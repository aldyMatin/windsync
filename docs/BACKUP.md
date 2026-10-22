# Backup dan pemulihan

1. Buka vault lalu pilih **Backup terenkripsi → Ekspor**.
2. Gunakan kata sandi minimal 12 karakter dan simpan file `.wsbackup` di lokasi aman.
3. Simpan kata sandi secara terpisah. Jangan unggah file backup ke Issues atau layanan publik.
4. Untuk restore, buka vault tujuan, pilih Impor dan masukkan kata sandi backup. Batas impor saat ini 16 MiB.

**Impor mengganti konfigurasi lokal dan menutup terminal lama.** Ekspor data tujuan lebih dahulu. Impor bukan penggabungan data.

Backup berisi konfigurasi dan credential; tidak memulihkan proses SSH, scrollback, atau layar terminal. Opsi buka otomatis merupakan pengaturan perangkat. Verifikasi ulang host fingerprint bila aplikasi memintanya.

Tidak tersedia reset kata sandi backup. File database lokal saja tidak cukup untuk pemulihan tanpa key yang sesuai. Jika key perangkat hilang, jangan hapus database atau secure storage sebagai percobaan perbaikan. Gunakan backup dan kata sandi yang benar pada instalasi yang vault-nya dapat dibuka; hubungi dukungan tanpa mengirim credential atau backup.
