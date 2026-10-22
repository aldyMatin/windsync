# WindSync v<VERSION> — Public beta

Status: DRAFT. Lengkapi seluruh bagian sebelum publikasi. Jangan memakai tag stabil untuk build yang belum melewati acceptance.

## Perubahan

- Jelaskan perubahan yang terasa oleh pengguna.

## Download

| Paket | Platform | Signature |
| --- | --- | --- |
| WindSync-<VERSION>-windows-x64-setup.exe | Windows x64; versi OS yang telah diuji | Nyatakan signed/unsigned serta penerbit |
| WindSync-<VERSION>-android.apk | Android 10+ ARM64/x86_64 | Release signing; cantumkan fingerprint sertifikat SHA256 |

Lampirkan `SHA256SUMS.txt` dan `THIRD_PARTY_NOTICES.txt`. Jangan lampirkan source code private, key, database, log internal, atau simbol debug.

## Instalasi dan upgrade

Ekspor backup dahulu. Jelaskan perubahan format data, kompatibilitas versi lama, dan migrasi dari APK debug jika relevan. Sertakan tautan panduan instalasi repository publik.

## Pengujian

Cantumkan OS/perangkat yang benar-benar diuji: fresh install, upgrade mempertahankan vault, SSH, host-key mismatch, backup/restore, SFTP, dan sync dua perangkat bila fitur dipromosikan. Hasil build saja tidak cukup.

## Batas yang diketahui

Cantumkan batas aktual, status cloud, serta fitur yang belum tersedia. Jangan menyatakan remote revoke atau recovery kata sandi tersedia sebelum implementasi diverifikasi.
