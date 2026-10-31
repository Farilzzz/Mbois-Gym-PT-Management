const { readFileSync } = require('node:fs');
const assert = require('node:assert/strict');
const { initializeTestEnvironment, assertFails, assertSucceeds } = require('@firebase/rules-unit-testing');
const { doc, collection, collectionGroup, getDoc, getDocs, setDoc, updateDoc, deleteDoc, query, where } = require('firebase/firestore');

const projectId = 'demo-mbois-gym';
const descendants = ['packages', 'sessions', 'workouts', 'evaluations', 'assessments', 'progress_measurements', 'assignment_history'];
let env;
const dbFor = uid => uid ? env.authenticatedContext(uid).firestore() : env.unauthenticatedContext().firestore();
const read = (uid, path) => getDoc(doc(dbFor(uid), path));
async function adminUpdate(path, data) {
  await env.withSecurityRulesDisabled(async ctx => updateDoc(doc(ctx.firestore(), path), data));
}

describe('Mbois Gym read-only pilot rules (emulator only)', function () {
  this.timeout(20000);
  before(async () => {
    // Fail closed: never allow this suite to select a live project or endpoint.
    assert.match(process.env.FIRESTORE_EMULATOR_HOST || '', /^(127\.0\.0\.1|localhost):8085$/);
    env = await initializeTestEnvironment({ projectId, firestore: { host: '127.0.0.1', port: 8085, rules: readFileSync('firestore.rules', 'utf8') } });
  });
  beforeEach(async () => {
    await env.clearFirestore();
    await env.withSecurityRulesDisabled(async ctx => {
      const db = ctx.firestore();
      const entries = [];
      for (let i = 1; i <= 4; i++) {
        entries.push([`users/pt${i}`, { role: 'trainer', status: 'active', displayName: `PT ${i}`, phone: '08000' }]);
        entries.push([`clients/c${i}`, { assignedTrainerIds: [`pt${i}`], name: `Client ${i}` }]);
        for (const sub of descendants) entries.push([`clients/c${i}/${sub}/old`, { trainerId: `pt${i}`, note: 'historical' }]);
      }
      entries.push(['users/inactive', { role: 'trainer', status: 'inactive' }], ['users/pending', { role: 'trainer', status: 'pending' }], ['users/admin', { role: 'admin', status: 'active' }], ['clients/shared', { assignedTrainerIds: ['pt1', 'pt2'] }], ['clients/disabled', { assignedTrainerIds: ['inactive', 'pending', 'unknown', 'admin'] }], ['pt_packages/old', { assignedTrainerId: 'pt1' }], ['workout_logs/old', { trainerId: 'pt1' }]);
      await Promise.all(entries.map(([path, data]) => setDoc(doc(db, path), data)));
    });
  });
  after(async () => { if (env) await env.cleanup(); });

  for (let i = 1; i <= 4; i++) {
    it(`PT ${i} reads own client but not any other PT client`, async () => {
      await assertSucceeds(read(`pt${i}`, `clients/c${i}`));
      for (let j = 1; j <= 4; j++) if (j !== i) await assertFails(read(`pt${i}`, `clients/c${j}`));
    });
    it(`PT ${i} query returns exactly assigned clients`, async () => {
      const db = dbFor(`pt${i}`);
      const result = await assertSucceeds(getDocs(query(collection(db, 'clients'), where('assignedTrainerIds', 'array-contains', `pt${i}`))));
      assert.deepEqual(result.docs.map(d => d.id).sort(), (i <= 2 ? [`c${i}`, 'shared'] : [`c${i}`]).sort());
    });
  }
  for (const uid of [null, 'inactive', 'pending', 'unknown', 'admin']) {
    it(`${uid || 'unauthenticated'} cannot read operational data or query`, async () => {
      await assertFails(read(uid, 'clients/disabled'));
      await assertFails(read(uid, 'clients/c1/sessions/old'));
      await assertFails(getDocs(query(collection(dbFor(uid), 'clients'), where('assignedTrainerIds', 'array-contains', uid || 'pt1'))));
    });
  }
  it('unfiltered and another trainer filtered queries are denied', async () => {
    const db = dbFor('pt1');
    await assertFails(getDocs(collection(db, 'clients')));
    await assertFails(getDocs(query(collection(db, 'clients'), where('assignedTrainerIds', 'array-contains', 'pt2'))));
  });
  for (const sub of descendants) {
    it(`${sub}: authoritative parent allows assigned reads/list and denies outsiders`, async () => {
      await assertSucceeds(read('pt1', `clients/c1/${sub}/old`));
      await assertSucceeds(getDocs(collection(dbFor('pt1'), `clients/c1/${sub}`)));
      await assertFails(read('pt2', `clients/c1/${sub}/old`));
      await assertFails(getDocs(collection(dbFor('pt2'), `clients/c1/${sub}`)));
    });
    it(`${sub}: reassignment revokes former PT despite historical trainerId`, async () => {
      await adminUpdate('clients/c1', { assignedTrainerIds: ['pt2'] });
      await assertFails(read('pt1', 'clients/c1'));
      await assertFails(read('pt1', `clients/c1/${sub}/old`));
      await assertSucceeds(read('pt2', `clients/c1/${sub}/old`));
    });
  }
  it('revoking active status immediately removes access', async () => {
    const db = dbFor('pt1');
    await assertSucceeds(getDoc(doc(db, 'clients/c1')));
    await adminUpdate('users/pt1', { status: 'inactive' });
    await assertFails(getDoc(doc(db, 'clients/c1')));
    await assertFails(getDoc(doc(db, 'clients/c1/sessions/old')));
  });
  it('own profile readable, other profile/list and unauthenticated access denied', async () => {
    await assertSucceeds(read('pt1', 'users/pt1'));
    await assertSucceeds(read('inactive', 'users/inactive'));
    await assertFails(read('pt1', 'users/pt2'));
    await assertFails(read(null, 'users/pt1'));
    await assertFails(getDocs(collection(dbFor('pt1'), 'users')));
  });
  it('self displayName and phone edits allowed without changing authorization', async () => {
    await assertSucceeds(updateDoc(doc(dbFor('pt1'), 'users/pt1'), { displayName: 'Edited', phone: '08123' }));
  });
  for (const [uid, data] of [['pt1', { role: 'admin' }], ['pending', { status: 'active' }], ['inactive', { status: 'active' }], ['pt1', { assignedTrainerIds: ['pt1'] }]]) {
    it(`${uid} cannot escalate with ${Object.keys(data)[0]}`, async () => {
      await assertFails(updateDoc(doc(dbFor(uid), `users/${uid}`), data));
    });
  }
  it('profiles cannot be self-provisioned, deleted, or modified by another user', async () => {
    await assertFails(setDoc(doc(dbFor('unknown'), 'users/unknown'), { role: 'trainer', status: 'active' }));
    await assertFails(deleteDoc(doc(dbFor('pt1'), 'users/pt1')));
    await assertFails(updateDoc(doc(dbFor('pt1'), 'users/pt2'), { displayName: 'Forged' }));
  });
  it('assignment tampering forbidden', async () => {
    await assertFails(updateDoc(doc(dbFor('pt1'), 'clients/c2'), { assignedTrainerIds: ['pt1'] }));
    await assertFails(updateDoc(doc(dbFor('pt1'), 'clients/c1'), { assignedTrainerIds: ['pt1', 'pt2'] }));
  });
  it('active trainer can create client assigned to self, but not only to others', async () => {
    await assertSucceeds(setDoc(doc(dbFor('pt1'), 'clients/c_new_1'), { name: 'New Client 1', assignedTrainerIds: ['pt1'] }));
    await assertFails(setDoc(doc(dbFor('pt1'), 'clients/c_new_2'), { name: 'Forged Assignment', assignedTrainerIds: ['pt2'] }));
    await assertFails(setDoc(doc(dbFor('inactive'), 'clients/c_new_3'), { name: 'Inactive Creator', assignedTrainerIds: ['inactive'] }));
  });
  it('assigned trainer can update client fields, but outsiders cannot', async () => {
    await assertSucceeds(updateDoc(doc(dbFor('pt1'), 'clients/c1'), { name: 'Updated Client 1', age: 30 }));
    await assertFails(updateDoc(doc(dbFor('pt2'), 'clients/c1'), { name: 'Intruder Update' }));
    await assertFails(deleteDoc(doc(dbFor('pt2'), 'clients/c1')));
  });
  for (const sub of descendants) {
    it(`${sub}: assigned trainer can create, update, delete, while outsiders cannot`, async () => {
      const db1 = dbFor('pt1');
      const db2 = dbFor('pt2');
      // Assigned PT1 succeeds
      await assertSucceeds(setDoc(doc(db1, `clients/c1/${sub}/new_item`), { note: 'Created by PT1', createdAt: new Date() }));
      await assertSucceeds(updateDoc(doc(db1, `clients/c1/${sub}/old`), { note: 'Updated by PT1' }));
      await assertSucceeds(deleteDoc(doc(db1, `clients/c1/${sub}/old`)));
      // Outsider PT2 fails
      await assertFails(setDoc(doc(db2, `clients/c1/${sub}/intruder`), { note: 'Intrusion' }));
      await assertFails(updateDoc(doc(db2, `clients/c1/${sub}/new_item`), { note: 'Tampered' }));
      await assertFails(deleteDoc(doc(db2, `clients/c1/${sub}/new_item`)));
    });
  }
  for (const path of ['pt_packages/old', 'workout_logs/old', 'exercise_catalog/old', 'migration_imports/old']) {
    it(`${path}: un-namespaced root operational writes strictly denied`, async () => {
      const db = dbFor('pt1');
      await assertFails(setDoc(doc(db, `${path}-new`), { assignedTrainerId: 'pt1', trainerId: 'pt1' }));
      await assertFails(updateDoc(doc(db, path), { note: 'tampered' }));
      await assertFails(deleteDoc(doc(db, path)));
    });
  }
  it('legacy root resources, unknown paths, deeper nesting and collection groups denied', async () => {
    for (const path of ['pt_packages/old', 'workout_logs/old', 'unknown/doc', 'clients/c1/sessions/old/secret/data']) await assertFails(read('pt1', path));
    await assertFails(getDocs(collectionGroup(dbFor('pt1'), 'sessions')));
  });
});
