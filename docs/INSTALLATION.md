# Instalasi dan update

Unduh hanya dari halaman Releases yang ditautkan README. Pilih paket sesuai perangkat dan baca catatan rilis, termasuk status beta dan batas dukungan OS.

## Windows

1. Unduh installer `WindSync-<versi>-windows-x64-setup.exe` dan `SHA256SUMS.txt` dari rilis yang sama.
2. Verifikasi checksum seperti petunjuk di bawah.
3. Jalankan installer dan ikuti petunjuk. Instalasi standar berada di akun pengguna.
4. Jika tersedia ZIP portable, ekstrak seluruh isinya. Jangan memindahkan EXE tanpa DLL dan folder `data`.

Windows dapat menampilkan peringatan untuk aplikasi baru atau penerbit yang belum dikenal. Periksa sumber, checksum, dan status tanda tangan pada catatan rilis. Jika tidak yakin, jangan lanjutkan; jangan menonaktifkan antivirus atau proteksi Windows secara global.

## Android

1. Gunakan Android 10 atau lebih baru dengan ARM64 atau x86_64. Perangkat 32-bit tidak didukung oleh paket saat ini.
2. Unduh APK release dari rilis yang sama. AAB bukan paket untuk instalasi langsung.
3. Jika diminta, izinkan instalasi dari browser/file manager yang Anda gunakan, kemudian buka APK.
4. Setelah selesai, nonaktifkan kembali izin instalasi sumber tersebut jika tidak diperlukan.

Kebijakan perangkat/organisasi dan verifikasi pengembang Android dapat memengaruhi instalasi. Jangan melewati larangan perangkat organisasi. Jika pembaruan ditolak karena signature berbeda, jangan langsung uninstall: ekspor backup terenkripsi terlebih dahulu. Build debug lama dapat memiliki signature berbeda dari rilis publik.

## Verifikasi checksum

Di PowerShell, jalankan pada file yang diunduh:

```powershell
Get-FileHash -LiteralPath './WindSync-0.1.0-windows-x64-setup.exe' -Algorithm SHA256
```

Nama file hanya contoh. Bandingkan nilai hash dengan baris file yang sama di `SHA256SUMS.txt`. Hash tidak boleh berbeda. Checksum memeriksa kesesuaian file; bukan pengganti tanda tangan penerbit atau jaminan keamanan aplikasi.

## Update

Ekspor backup beserta kata sandinya, simpan pekerjaan terminal, lalu tutup WindSync sebelum memasang pembaruan. Di Android gunakan APK dengan application ID dan signing key yang sama. Baca catatan migrasi sebelum downgrade; kompatibilitas data dengan versi lama tidak dijamin. Belum ada janji pembaruan otomatis.

## Uninstall

Ekspor backup sebelum uninstall atau membersihkan data aplikasi. Data lokal/secure storage dapat hilang. Logout atau uninstall tidak membuktikan bahwa data cloud telah dihapus. Lihat [privasi](../PRIVACY.md).
