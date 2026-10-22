# Sinkronisasi cloud opsional

Fitur telah diimplementasikan, tetapi penerimaan Windows–Android pada dua perangkat nyata masih menjadi pekerjaan rilis. Gunakan backup terpisah dan lihat catatan rilis untuk status pengujiannya.

1. Login Google dan buka vault lokal.
2. Buka **Sinkronisasi cloud**.
3. Buat/masukkan kata sandi sinkronisasi minimal 12 karakter. Ini berbeda dari kata sandi Google dan backup.
4. Pada perangkat lain gunakan akun Google dan kata sandi sinkronisasi yang sama.
5. Gunakan **Sinkronkan sekarang**; sinkronisasi berkala berjalan saat aktif dan vault terbuka.

Data yang disinkronkan mencakup konfigurasi server, grup, snippet, credential SSH, private key session, dan settings dalam bentuk terenkripsi. File SFTP, output terminal, proses server, dan trust fingerprint tidak ikut disinkronkan. Backend tetap memproses identitas akun serta metadata record/revision/waktu.

Konflik meminta pilihan versi lokal atau cloud. Ekspor backup terlebih dahulu jika kedua versi diperlukan. Record bernama sama dengan ID berbeda dapat tetap menjadi dua record.

Kunci vault, logout Google, hentikan sync, atau impor backup menghentikan sinkronisasi. Setelah restart/unlock, kata sandi sync diperlukan kembali. Logout tidak menghapus vault lokal, tidak mencabut akses perangkat lain, dan bukan penghapusan data cloud.

Belum tersedia remote revoke/My Devices maupun reset kata sandi cloud. Jangan mengandalkan logout untuk mengamankan perangkat yang hilang; amankan akun Google dan ganti credential SSH yang terpapar. Jangan menghapus data cloud untuk mencoba memperbaiki kata sandi.

Layanan dapat terpengaruh jaringan dan kuota. Penggunaan lokal tetap tersedia sesuai kondisi vault; sinkronisasi bukan pengganti backup. [Privasi](../PRIVACY.md).
