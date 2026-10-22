# Status dan batas yang diketahui

Status persiapan publikasi: 22 Oktober 2026. Ini bukan daftar hasil uji untuk sebuah rilis yang sudah dipublikasikan.

- Rilis publik pertama belum diumumkan; APK pengembangan/debug bukan paket distribusi umum.
- Sinkronisasi pada Windows dan Android nyata, termasuk jaringan putus/pulih, masih memerlukan penerimaan akhir.
- Remote device revoke, My Devices, dan reset kata sandi cloud belum tersedia.
- Input keyboard Android, seleksi mouse/touch, dan sesi tmux perlu diperiksa pada perangkat pengguna.
- Transfer/edit file 1 GB perlu uji perangkat dan server nyata; pengujian metadata bukan bukti transfer aktual.
- Android dapat menghentikan koneksi di background. Sesi persisten memerlukan tmux di server.
- Windows baru/unsigned dapat memunculkan peringatan keamanan. Status signing harus diumumkan per rilis.
- Android 32-bit dan iOS belum didistribusikan. Linux tidak termasuk paket publik awal ini.

Catatan rilis harus menjelaskan batas yang masih berlaku pada build yang diunduh. Jangan menandai masalah selesai hanya karena build berhasil.
