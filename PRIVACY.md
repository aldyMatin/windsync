# Informasi privasi WindSync

Draft untuk persiapan rilis, 22 Oktober 2026. Kontak privasi dan prosedur penghapusan cloud harus diselesaikan sebelum peluncuran umum.

## Data dan tujuan

WindSync menyimpan konfigurasi server, grup, snippet, preferensi, serta credential SSH pada perangkat untuk menjalankan fitur terminal. Credential dilindungi oleh mekanisme vault; jangan menganggap seluruh metadata lokal tersembunyi. Key lokal menggunakan secure storage perangkat. Keamanan juga bergantung pada akun dan proteksi OS.

Koneksi SSH/SFTP mengirim autentikasi, perintah, atau file ke server yang Anda pilih. Server tujuan dapat mencatat aktivitas sesuai kebijakannya. File download, ekspor, dan file yang dibuka editor eksternal dapat berada di luar vault dan mengikuti proteksi aplikasi/lokasi tersebut.

## Google dan cloud opsional

Login menggunakan Google/Firebase Authentication. Identitas akun seperti UID, nama/email serta data sesi autentikasi diproses untuk login. Saat sync diaktifkan, Firebase Firestore menyimpan payload terenkripsi dan metadata teknis seperti identitas record, revision, serta waktu. Penyedia jaringan/cloud dapat memproses IP dan metadata layanan sesuai kebijakannya.

Login tidak otomatis mengaktifkan sync. Lihat [panduan cloud](docs/CLOUD_SYNC.md) untuk data yang disertakan. Jangan menafsirkan enkripsi sebagai anonimitas atau perlindungan perangkat yang sudah dikuasai pihak lain.

## Diagnostik dan layanan lain

Implementasi yang didokumentasikan saat ini tidak mengaktifkan analytics atau pengunggah crash report aplikasi. Ini bukan klaim bahwa OS, server SSH, Google, GitHub, atau Ko-fi tidak mencatat aktivitas.

Laporan GitHub Issues bersifat publik. Pembayaran sukarela melalui Ko-fi dan pemroses pembayarannya berlangsung di layanan mereka; jangan memasukkan informasi pembayaran atau credential di Issues.

## Kendali dan penghapusan

Anda dapat menghentikan sync, logout, menghapus konfigurasi melalui aplikasi, dan mengelola file ekspor sendiri. Logout/uninstall tidak menghapus data cloud. Penghapusan record melalui sync tidak boleh dianggap sebagai penghapusan fisik seluruh salinan backend atau backup. Penghapusan akun/cloud mandiri belum tersedia.

Kontak permintaan privasi: **PENDING_PRIVACY_EMAIL**. Kebijakan retensi, identitas pengelola, dan prosedur verifikasi/penghapusan cloud masih perlu ditetapkan pengelola sebelum rilis umum. Jangan mengirim password, key, token, atau backup dalam permintaan.

Perubahan pengumpulan data akan dicatat melalui pembaruan dokumen dan catatan rilis.
