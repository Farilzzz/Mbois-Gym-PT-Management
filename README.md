# Mbois Gym PT Management

Sistem manajemen Personal Trainer untuk membantu operasional Mbois Gym. Proyek ini mendigitalisasi pengelolaan klien, program latihan, asesmen, absensi dan pencatatan sesi, serta evaluasi Post PT. Pengguna utama adalah pelatih; klien tidak memerlukan akun aplikasi.

## Status dan fitur

Implementasi tersedia dalam source, tetapi bukan pernyataan siap produksi atau bukti seluruh alur telah diuji pada backend nyata.

- Login PT menggunakan Firebase Authentication email/password dengan profil `users/{uid}` berperan `trainer` dan berstatus `active`.
- Reset password melalui Firebase; pesan UI bersifat generik dan saat ini tidak membuktikan email berhasil terkirim.
- Sign Up yang tersedia membuat akun SQLite lokal, **bukan akun Firebase**. Akun PT cloud harus diprovisikan administrator.
- Profil PT, pengaturan tema dan logout. Perubahan profil cloud dibatasi pada nama dan telepon; jangan menyamakan seluruh kemampuan edit akun lokal dengan akun Firebase.
- Daftar klien dan paket aktif/selesai, tambah/edit data klien, asesmen berupa data profil dan riwayat klien.
- Pengelolaan paket, jadwal dan absensi sesi, serta pengurangan kuota melalui transaksi aplikasi.
- List Exercise/katalog latihan lokal dan layanan pencarian latihan eksternal (wger).
- Workout Log dengan exercise, set, repetisi, beban, RPE/RIR, catatan, metode straight set, superset dan drop set; editor riwayat serta penghapusan.
- Perhitungan volume berdasarkan repetisi × beban; akumulasi superset/drop set dan penanganan beban null, dengan grafik progres.
- Evaluasi Post PT dan finalisasi paket.
- Kanvas tanda tangan PT dan klien: memeriksa minimum titik goresan di perangkat. Firestore menyimpan status `verified_pending_storage`, **bukan gambar atau bukti identitas penanda tangan**.
- Arsip SQLite lokal tetap tersedia. Ini bukan backup otomatis seluruh data cloud maupun jaminan sinkronisasi offline.

### Belum lengkap / perlu pengembangan

Penyimpanan bukti tanda tangan, registrasi cloud mandiri, konfigurasi Firebase non-Android, penguatan rules dan privasi arsip lokal, serta pengujian end-to-end multi-perangkat masih perlu dikerjakan. Jangan menggunakan data klien nyata untuk pengujian tanpa izin.

## Teknologi

Flutter 3.47.2 dan Dart 3.13.2 dipakai pada validasi publikasi; batas SDK di `pubspec.yaml` adalah `^3.13.2`.

- `flutter_riverpod` untuk state management (bukan GetX).
- `go_router` untuk navigasi.
- `firebase_core`, `firebase_auth`, `cloud_firestore` untuk backend cloud.
- `drift`, SQLite, `path_provider`, `path` untuk database lokal; kode `app_database.g.dart` disertakan.
- `shared_preferences`, `flutter_secure_storage`, `cryptography` untuk preferensi, penyimpanan terkait sesi dan hashing sandi lokal. Hashing sandi tidak berarti database SQLite terenkripsi.
- `fl_chart`, `http`, Material UI dan aset lokal.
- `flutter_test`, `flutter_lints`, `build_runner`, `drift_dev` untuk pengujian/generasi kode.

Versi teresolusi ada di `pubspec.lock`; jangan melakukan upgrade dependency massal saat setup. Tidak membutuhkan XAMPP atau MySQL.

## Struktur project

Root hasil clone langsung berisi project Flutter, bukan folder pembungkus tambahan.

```text
lib/main.dart                 Inisialisasi Firebase dan SQLite
lib/app.dart                  Provider, autentikasi, tema dan router
lib/cloud/                    Gateway Firebase, kontrak sesi dan layar pilot
lib/data/                     Repository, skema Drift, API latihan, utilitas migrasi
lib/features/screens.dart     Antarmuka fitur aplikasi
lib/design_system/            Token dan komponen visual
lib/widgets/                  Kanvas tanda tangan
assets/images/                Logo dan gambar antarmuka
android/                      Target Android dan Gradle wrapper
ios/, web/                    Scaffold platform, Firebase belum dikonfigurasi
linux/, macos/, windows/       Scaffold desktop, belum divalidasi sebagai target cloud
test/                         Unit dan widget tests
rules-test/                   Pengujian rules dengan emulator lokal
firebase.test.json            Konfigurasi emulator demo
firestore.rules               Rules lokal; status deployment tidak diverifikasi
firebase.json                 Konfigurasi FlutterFire dan referensi rules
pubspec.yaml, pubspec.lock     Dependency dan versi teresolusi
analysis_options.yaml         Konfigurasi analyzer
```

## Instalasi anggota kelompok

1. Install Git dari https://git-scm.com/.
2. Install Flutter SDK dan tambahkan ke PATH. Gunakan versi yang sesuai Dart SDK di atas. Install Android Studio/Android SDK, Platform Tools, Build Tools dan toolchain Java yang didukung Flutter. Panduan: https://docs.flutter.dev/get-started/install.
3. Install VS Code beserta ekstensi Flutter dan Dart.
4. Terima undangan repository private dan login GitHub menggunakan akun sendiri. Clone:
   ```bash
   git clone https://github.com/Farilzzz/Mbois-Gym-PT-Management.git
   ```
   Bila muncul `Repository not found`, periksa akun GitHub dan status penerimaan undangan, bukan mengubah repository menjadi public.
5. Buka project:
   ```bash
   cd Mbois-Gym-PT-Management
   code .
   ```
6. Periksa lingkungan:
   ```bash
   flutter doctor
   flutter doctor --android-licenses
   ```
   Selesaikan masalah Android toolchain yang ditampilkan.
7. Ambil dependency:
   ```bash
   flutter pub get
   ```
8. Periksa konfigurasi Firebase sesuai bagian berikut. Konfigurasi klien Android sudah disertakan; minta akun PT uji tersendiri kepada pemilik backend. Jangan membagikan password di Git atau README.
9. Nyalakan emulator Android, atau hubungkan smartphone dengan USB Debugging dan setujui otorisasi USB.
10. Periksa perangkat:
    ```bash
    flutter devices
    ```
11. Jalankan pada Android:
    ```bash
    flutter run
    ```
    Jika ada beberapa perangkat, gunakan `flutter run -d <id-perangkat-android>` dengan ID dari langkah sebelumnya.
12. Build APK debug:
    ```bash
    flutter build apk --debug
    ```
    Hasil: `build/app/outputs/flutter-apk/app-debug.apk`. APK/build tidak dimasukkan ke Git. Konfigurasi release saat ini masih memakai signing debug, sehingga bukan konfigurasi distribusi produksi.

Jika mengubah skema Drift, regenerasikan kode dengan `dart run build_runner build`, review hasilnya, dan jalankan test. Clone biasa tidak perlu regenerasi.

## Firebase dan keamanan

Project ID: `mbois-gym`. Android application ID: `com.mboisgym.pt.mbois_gym_pt`.

`lib/firebase_options.dart` dan `android/app/google-services.json` merupakan **konfigurasi klien**, bukan service account/admin key. Keduanya disertakan agar build menggunakan project yang sama. API key Firebase sisi klien tidak memberi hak administrator; otorisasi bergantung pada Authentication dan Firestore Rules.

Untuk mendapatkan ulang konfigurasi, hubungi pemilik project atau buka Firebase Console > Project Settings > General > Your apps > aplikasi Android dengan package tersebut, kemudian unduh `google-services.json` ke `android/app/`. Minta salinan `firebase_options.dart` yang cocok dari pemilik; perubahan/generasi ulang FlutterFire harus dikoordinasikan agar tidak mengganti project/platform tanpa sengaja.

Pemilik backend perlu memastikan provider Email/Password aktif, membuat akun uji masing-masing anggota, dan menyediakan dokumen `users/{uid}` yang sesuai gateway (`displayName`, `phone`, `role: trainer`, `status: active`). Aplikasi tidak berwenang membuat profil cloud sendiri. Penugasan klien menggunakan `assignedTrainerIds`.

Akses repository GitHub, akses login aplikasi, dan akses administrasi Firebase adalah tiga hal berbeda. Menjalankan aplikasi tidak membutuhkan izin Firebase Console; mengelola backend membutuhkan undangan Google account melalui Project Settings > Users and Permissions dengan hak minimum sesuai tugas. Jangan berbagi akun administrator.

Tidak menyertakan service account JSON, private key, token akses, password operasional, keystore atau database perangkat. File sensitif harus dibagikan hanya lewat kanal aman bila benar-benar diperlukan, tidak melalui commit.

### Batas audit keamanan

- Rules lokal mensyaratkan trainer aktif dan penugasan klien, serta membatasi edit profil. Namun create klien masih memungkinkan memasukkan UID trainer tambahan; akses tulis subkoleksi belum memvalidasi skema, kuota atau transisi status secara ketat. Transaksi pada aplikasi bukan pengganti validasi server.
- Arsip SQLite dapat dibuka dari layar login tanpa autentikasi; perangkat bersama berisiko memperlihatkan data historis. Database tidak terbukti terenkripsi.
- Mapping ID cloud berbasis waktu/memori perlu ditinjau untuk benturan dan restart; penghapusan dokumen klien tidak otomatis membersihkan subkoleksi Firestore.
- Tanda tangan belum tersimpan sebagai bukti; error permintaan reset password belum dibedakan dengan baik di UI.
- Rules produksi, provider Auth aktif, pembatasan API key, data produksi dan akses lintas perangkat belum diverifikasi langsung pada publikasi ini.

**Jangan menjalankan deployment Firebase, mengubah rules produksi, mengimpor data lewat migrator atau menghapus data tanpa persetujuan pemilik.** `firebase.json` masih mereferensikan rules lokal; bukan instruksi untuk deploy. Gunakan data sintetis dan emulator untuk pengembangan.

## Panduan penggunaan

1. Login dengan akun PT cloud aktif yang disiapkan administrator. Sign Up lokal tidak membuat akses cloud.
2. Dari dashboard, pilih klien atau tambahkan klien uji dan paket sesi. Tinjau klien aktif/selesai.
3. Lengkapi asesmen/profil klien, kemudian kelola jadwal dan absensi.
4. Catat Workout Log: pilih exercise, masukkan set/repetisi/beban dan metode latihan; simpan lalu tinjau history serta tonase. Edit log yang sama bila diperlukan.
5. Untuk penyelesaian sesi, isi kanvas tanda tangan PT/klien dan konfirmasi. Periksa status sesi dan sisa kuota setelah operasi selesai. Jangan menganggap status tanda tangan sebagai bukti tersimpan.
6. Isi evaluasi Post PT, review, dan konfirmasi finalisasi paket.
7. Gunakan profil/pengaturan untuk data PT, tema dan logout. Tombol Lupa Password mengajukan reset ke Firebase; periksa inbox/spam dan hubungi administrator bila tidak diterima.

## Pengujian dan hasil publikasi

Validasi pada 31 Oktober 2026, Windows, Flutter 3.47.2 / Dart 3.13.2:

| Perintah | Hasil |
| --- | --- |
| `flutter pub get` | Berhasil; 31 paket memiliki versi lebih baru di luar constraint |
| `flutter analyze` | Exit 1: 14 info, 0 error, 0 warning |
| `flutter analyze --no-fatal-infos` | Exit 0; 14 info tetap ada |
| `flutter test` | 62 test lulus |
| `flutter build apk --debug` | Berhasil; APK 263329415 byte |

Lint mencakup BuildContext setelah async dan penggunaan API deprecated di `screens.dart`. Build memberi peringatan ketidakselarasan versi SDK XML tools. Test tidak dihapus atau diubah untuk membuat hasil lulus.

Tidak ada perangkat Android terhubung saat `flutter devices`; smoke test sampai dashboard serta login/CRUD terhadap backend produksi belum dilakukan. Build berhasil tidak membuktikan seluruh alur runtime berhasil.

Pengujian rules opsional memerlukan Node.js/npm dan Java sesuai Firebase Emulator:

```bash
npm ci
npm run test:rules
```

Script memakai project **demo-mbois-gym**, host lokal dan `firebase.test.json`, bukan produksi. Jangan mengganti ID demo dengan ID produksi. Test rules tidak membuktikan rules lokal telah ter-deploy.

## Kolaborasi Git

Terima undangan repository sebelum clone. Gunakan branch masing-masing, bukan perubahan langsung di `main`.

```bash
git status
git switch main
git pull --ff-only origin main
git switch -c feature/filter-klien
# Edit file sesuai tugas, lalu jalankan analyze dan test.
git diff
git add lib/features/screens.dart
git diff --cached --stat
git diff --cached
git commit -m "feat: tambah filter klien"
git push -u origin feature/filter-klien
```

Sesuaikan daftar file `git add` dengan perubahan; jangan staging seluruh folder tanpa review. Jangan commit password, data pribadi, artefak build atau konfigurasi lokal.

Buka GitHub > Pull requests > New pull request, pilih base `main` dan branch fitur, jelaskan perubahan/hasil test, minta review anggota lain, lalu merge setelah disetujui. Setelah merge, kembali ke main dan jalankan `git pull --ff-only origin main`.

Untuk menyelaraskan branch fitur: simpan pekerjaan dalam commit terlebih dahulu, lalu `git fetch origin` dan `git merge origin/main`. Jika konflik, koordinasikan dengan pemilik perubahan, edit bagian konflik, jalankan test dan review sebelum commit. Jangan menimpa perubahan orang lain atau force push. Bagi tugas per file/modul, terutama karena `screens.dart` cukup besar.

### Mengundang collaborators

Pemilik membuka https://github.com/Farilzzz/Mbois-Gym-PT-Management > Settings > Collaborators (atau Collaborators and teams) > Add people. Masukkan username GitHub teman yang benar, kirim undangan, lalu minta mereka menerimanya. Username belum ditentukan dalam dokumentasi ini. Undangan GitHub tidak otomatis memberi izin administrasi Firebase.
