import 'package:flutter/material.dart';

import 'cloud_session.dart';

/// Deliberately isolated read-only Firebase pilot; SQLite UI remains default.
class CloudPilot extends StatefulWidget {
  const CloudPilot({super.key, required this.gateway});
  final CloudGateway gateway;
  @override
  State<CloudPilot> createState() => _CloudPilotState();
}

class _CloudPilotState extends State<CloudPilot> {
  late final CloudSession _session = CloudSession(widget.gateway)
    ..onChanged = () {
      if (mounted) setState(() {});
    };
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _busy = false;
  String? _message;

  @override
  void dispose() {
    _session.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _run(Future<void> Function() action, String success) async {
    if (_busy) return;
    setState(() {
      _busy = true;
      _message = null;
    });
    try {
      await action();
      if (mounted) setState(() => _message = success);
    } catch (_) {
      if (mounted) {
        setState(
          () => _message =
              'Tidak dapat memproses permintaan. Periksa jaringan dan akun.',
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    String email() => _email.text.trim();
    final profile = _session.profile;
    return Scaffold(
      appBar: AppBar(title: const Text('Firebase (uji terbatas)')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Hanya baca • Data operasional lokal/SQLite tetap aktif'),
          if (profile == null) ...[
            const SizedBox(height: 20),
            TextField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email PT'),
            ),
            TextField(
              controller: _password,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: _busy
                  ? null
                  : () => _run(() async {
                      if (email().isEmpty ||
                          !email().contains('@') ||
                          _password.text.isEmpty) {
                        throw const FormatException();
                      }
                      await widget.gateway.signIn(email(), _password.text);
                    }, 'Permintaan masuk dikirim.'),
              child: Text(_busy ? 'Memproses…' : 'Masuk Firebase'),
            ),
            TextButton(
              onPressed: _busy
                  ? null
                  : () {
                      if (!email().contains('@')) {
                        setState(
                          () => _message =
                              'Masukkan email valid terlebih dahulu.',
                        );
                        return;
                      }
                      _run(
                        () => widget.gateway.resetPassword(email()),
                        'Jika email terdaftar, instruksi reset dikirim.',
                      );
                    },
              child: const Text('Kirim reset password'),
            ),
          ] else ...[
            const SizedBox(height: 20),
            Text('Akun: ${profile.name}'),
            Text(
              profile.active
                  ? 'Profil aktif'
                  : 'Akun belum aktif; akses data ditolak',
            ),
            if (!profile.active) ..._inactive(),
            if (profile.active)
              FutureBuilder<List<CloudClient>>(
                future: widget.gateway.clients(profile.uid),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Data cloud tidak dapat dimuat.');
                  }
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.data!.isEmpty) {
                    return const Text('Belum ada klien cloud yang ditugaskan.');
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Klien yang ditugaskan'),
                      for (final client in snapshot.data!)
                        ListTile(title: Text(client.name)),
                    ],
                  );
                },
              ),
            TextButton(
              onPressed: _busy
                  ? null
                  : () => _run(widget.gateway.signOut, 'Keluar.'),
              child: const Text('Keluar'),
            ),
          ],
          if (_message != null)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(_message!),
            ),
        ],
      ),
    );
  }

  List<Widget> _inactive() => [
    const Text('Profil pengguna belum disetujui admin. Operasi dinonaktifkan.'),
    TextButton(
      onPressed: _busy ? null : () => _run(widget.gateway.signOut, 'Keluar.'),
      child: const Text('Keluar'),
    ),
  ];
}
