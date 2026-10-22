# Setup repository publik

Folder ini adalah paket dokumentasi publik. Tidak memerlukan kode sumber aplikasi, Firebase config, atau akses ke repository private. Belum ada perubahan GitHub yang dilakukan oleh paket ini.

## 1. Putuskan nama repository

Target awal tautan: `aldyMatin/windsync`. GitHub tidak membedakan huruf besar-kecil pada nama repository. Jika repository kode Anda sudah memakai `WindSync`, rename repository kode menjadi misalnya `windsync-private` dan pastikan visibilitasnya Private sebelum membuat repository publik `windsync`.

Jangan mengubah repository kode menjadi Public. Jika kode pernah publik, menjadikannya private tidak menarik kembali salinan/fork pihak lain. Update remote clone kode melalui pengaturan Git Anda setelah rename. Tidak ada rename otomatis dalam paket ini.

Alternatif: pertahankan nama repo kode dan gunakan `windsync-downloads` untuk publik, lalu jalankan skrip konfigurasi dengan nama tersebut.

## 2. Konfigurasi identitas

Dari folder paket publik, jalankan dengan nilai milik Anda:

```powershell
./scripts/configure-public.ps1 -Repository 'aldyMatin/windsync' -KoFiUsername 'USERNAME_ANDA' -ContactEmail 'kontak@example.com'
./scripts/check-public.ps1 -RequireConfigured
```

Contoh bukan identitas nyata; jangan gunakan nilainya apa adanya. Tanpa parameter Ko-fi/email, skrip mempertahankan status belum dikonfigurasi. `ContactEmail` mengisi placeholder sekali; untuk mengubah email setelahnya edit PRIVACY.md dan SECURITY.md. Ko-fi dan nama repository dapat diperbarui berulang kali.

- Konfirmasi pemegang hak dan ketentuan di LICENSE.md.
- Selesaikan PRIVACY.md: identitas pengelola, kontak, masa retensi dan alur permintaan penghapusan akun/cloud. Uji prosedur tersebut sebelum mengklaim tersedia; jangan menjanjikan uninstall menghapus cloud.
- Tambahkan screenshot nyata yang telah disensor ke `assets/`, lalu tautkan dari README.
- Periksa tautan eksternal dan isi dokumentasi terhadap build final. Pemeriksa lokal hanya memeriksa jenis file, pola rahasia dasar, dan tautan Markdown lokal.

## 3. Buat Git history baru di direktori terpisah

Salin **isi** folder ini (termasuk `.github`, `.gitignore`, `.gitattributes`) ke direktori baru di luar checkout private. Jangan salin `.git` proyek utama. Jangan menjalankan `git init` atau mengganti remote di root proyek private untuk publikasi ini.

Pada direktori baru, pastikan `.git` belum ada dan `git rev-parse --show-toplevel` gagal; jika berhasil, direktori masih berada di repository lain. Kemudian:

```powershell
git init -b main
git add .
git diff --cached --stat
git diff --cached
git commit -m "Prepare WindSync public distribution"
git remote add origin https://github.com/aldyMatin/windsync.git
git push -u origin main
```

Buat repository Public kosong melalui GitHub terlebih dahulu; jangan menambahkan README otomatis. Sesuaikan remote jika nama berbeda. Tinjau seluruh file staged sebelum commit/push. GitHub Releases otomatis menawarkan source archive dari repository publik ini saja.

## 4. Pengaturan GitHub

- Description: `Free SSH terminal for Windows and Android. Downloads, documentation, and support. Closed-source application.`
- Topics: `ssh`, `terminal`, `sftp`, `windows`, `android`, `freeware`.
- Aktifkan Issues; template sudah tersedia. Discussions opsional. Wiki/Projects dapat dimatikan bila tidak dipakai.
- Aktifkan **Private vulnerability reporting** pada Settings → Advanced Security. SECURITY.md sendiri tidak mengaktifkan fitur ini.
- Batasi perubahan branch utama lewat ruleset/review jika tersedia pada akun Anda.
- GitHub Actions tidak dibutuhkan untuk paket ini. Tidak ada token repo private atau secret signing yang perlu dipasang di repo publik.
- Sponsor button membaca `.github/FUNDING.yml` pada branch default setelah username valid diisi.
- Pin repository di profil. Website dapat mengarah ke halaman Releases setelah rilis pertama tersedia.

Referensi: [GitHub Releases](https://docs.github.com/en/repositories/releasing-projects-on-github/about-releases), [Sponsor button](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/displaying-a-sponsor-button-in-your-repository), [private vulnerability reporting](https://docs.github.com/en/code-security/how-tos/report-and-fix-vulnerabilities/configure-vulnerability-reporting/configure-for-a-repository).

## 5. Checklist sebelum binary dipublikasikan

- [ ] Versi dan build number dinaikkan; application ID Android final.
- [ ] APK **release**, bukan debug: signature diverifikasi dengan `apksigner verify --verbose --print-certs`, certificate fingerprint dicatat, signing key dicadangkan secara privat; periksa juga APK tidak debuggable.
- [ ] Registrasi/verifikasi pengembang Android sesuai jalur distribusi ditinjau: [panduan resmi](https://developer.android.com/developer-verification).
- [ ] Installer Windows berisi runtime lengkap. Verifikasi Authenticode bila ditandatangani; jika unsigned, nyatakan pada release notes. [SmartScreen](https://learn.microsoft.com/windows/apps/package-and-deploy/smartscreen-reputation).
- [ ] Fresh install dan upgrade pada Windows/Android nyata berhasil, tanpa kehilangan vault.
- [ ] SSH, host-key mismatch, backup/restore, dan SFTP diuji. Sync dua perangkat diuji jika dipromosikan pada rilis.
- [ ] Audit lisensi dependency langsung/transitif Dart, Rust, Flutter, dan runtime native selesai untuk build final. Lengkapi THIRD_PARTY_NOTICES.md serta paket; file xterm yang sudah disertakan belum mencakup semuanya.
- [ ] Tidak ada database pengguna, backup, key, token admin, config privat, atau simbol debug di aset rilis.
- [ ] Privasi, kontak, prosedur penghapusan cloud, dan kebijakan retensi final; kuota serta biaya backend dipantau.
- [ ] Template release diisi, status beta dan batas pengujian jujur, serta checksum dibuat dari file final sesudah signing.

Jalankan build di checkout private. Jangan mengunggah folder build mentah atau seluruh artefak CI. Pilih hanya installer/APK release yang telah diverifikasi dan notices yang lengkap.

## 6. Buat draft release

Di GitHub Releases pilih **Draft a new release**, buat tag pada commit repository dokumentasi publik (bukan commit/tag source private), misalnya `v0.1.0-beta.1`. Gunakan `releases/TEMPLATE.md`, centang pre-release untuk beta, lalu unggah:

- `WindSync-<versi>-windows-x64-setup.exe`
- `WindSync-<versi>-android.apk`
- `THIRD_PARTY_NOTICES.txt` yang sudah lengkap
- `SHA256SUMS.txt`

Buat checksum di folder staging terpisah yang hanya berisi aset rilis terpilih. Contoh PowerShell, sesuaikan versi:

```powershell
$releaseFiles = @('WindSync-0.1.0-windows-x64-setup.exe', 'WindSync-0.1.0-android.apk', 'THIRD_PARTY_NOTICES.txt')
$lines = foreach ($file in $releaseFiles) {
    $hash = Get-FileHash -LiteralPath $file -Algorithm SHA256 -ErrorAction Stop
    '{0}  {1}' -f $hash.Hash.ToLowerInvariant(), [IO.Path]::GetFileName($file)
}
$lines | Set-Content -LiteralPath SHA256SUMS.txt -Encoding ascii
```

Tinjau draft dan aset sebelum Publish. Setelah publikasi, uji download dari browser tanpa login, verifikasi checksum, lalu perbarui README/CHANGELOG/KNOWN_ISSUES agar sesuai rilis yang benar-benar tersedia. Gunakan `/releases` untuk beta; `/releases/latest` tidak cocok sebelum ada rilis stabil.

## 7. Pengumuman

Bagikan tautan halaman rilis resmi, screenshot/video demo tanpa data server asli, platform yang diuji, batas beta, dan link Ko-fi. Minta pengguna melaporkan bug melalui template. Jangan menyebut aplikasi open-source atau menjanjikan keamanan mutlak.
