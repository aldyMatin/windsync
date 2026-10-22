# Mulai menggunakan WindSync

## Koneksi pertama

1. Buka aplikasi lalu pilih **Buka vault lokal**. Pembukaan vault memakai proteksi perangkat; ini bukan login Google.
2. Tambahkan user SSH atau credential, lalu buat session berisi nama, host, port, dan metode autentikasi. Host tidak memakai awalan `http://`.
3. Pastikan server dapat dijangkau melalui jaringan/LAN/VPN Anda. WindSync tidak menyediakan VPN atau server SSH.
4. Hubungkan dan cocokkan fingerprint host dengan administrator server sebelum menerima key pertama kali. Jika key berubah, hentikan dan verifikasi penyebabnya.

Google Login tidak diperlukan untuk penggunaan SSH lokal. Jangan mengirim credential sebelum memastikan terminal dan prompt tujuan benar.

## Terminal

- Pindah tab untuk berganti sesi; menutup tab memutus koneksinya.
- `Ctrl+F` mencari di buffer terminal yang masih tersedia.
- `Ctrl+C` menyalin seleksi; tanpa seleksi mengirim interupsi ke terminal.
- `Ctrl+V` melakukan paste; paste multiline meminta konfirmasi.
- `Ctrl+K` membuka pencarian Library. Toolbar Android menyediakan tombol tambahan.
- Reconnect biasa membuka shell baru. Untuk mempertahankan proses server, aktifkan sesi persisten dan sediakan `tmux` di server.

Android dapat menghentikan proses atau jaringan di background. `tmux` mempertahankan proses di server, bukan menjamin koneksi HP terus aktif. Reboot server atau penghentian sesi tmux dapat mengakhiri proses tersebut.

## File dan monitoring

SFTP menyediakan browser file remote, upload/download, rename, folder baru dan penghapusan berkonfirmasi. Batas implementasi saat ini 1 GB per file; editor bawaan hingga 256 KiB. File lebih besar memakai editor eksternal setelah download. Simpan salinan sebelum mengganti file remote. Aplikasi eksternal dapat menyimpan salinan file di luar vault WindSync. Transfer 1 GB pada perangkat nyata masih perlu divalidasi.

Monitor Linux/Docker menggunakan akses akun SSH. Hasil bergantung pada permission dan lingkungan server; angka dalam container dapat mewakili host. Hindari memberikan hak administrator hanya untuk menghilangkan error monitoring.

## Vault dan backup

Kunci manual menutup koneksi aktif. Atur auto-lock dan tampilan melalui Preferensi. Opsi buka otomatis memudahkan akses bagi siapa pun yang bisa membuka aplikasi pada akun perangkat tersebut.

Ekspor backup sebelum mengganti perangkat, impor data, update besar, atau uninstall. [Panduan backup](BACKUP.md) menjelaskan penggantian data saat restore.

## Masalah koneksi

| Gejala | Pemeriksaan |
| --- | --- |
| Timeout | Host, jaringan/VPN, firewall, port, status server |
| Autentikasi ditolak | Username, password/key, passphrase, kebijakan server |
| Host key berubah | Verifikasi dengan administrator; jangan langsung menghapus trust |
| Komponen Windows hilang | Instal ulang paket resmi lengkap setelah backup |
| Vault tidak bisa dibuka | Jangan menghapus database atau secure storage; lihat panduan pemulihan |

[Laporkan masalah](../SUPPORT.md) dengan versi aplikasi dan langkah reproduksi yang telah disensor.
