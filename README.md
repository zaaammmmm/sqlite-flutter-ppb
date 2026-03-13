# Aplikasi Mahasiswa SQLite Flutter

Aplikasi Flutter untuk manajemen data mahasiswa menggunakan database SQLite lokal. Aplikasi ini mendukung operasi CRUD (Create, Read, Update, Delete) dan dapat berjalan di berbagai platform seperti Android, iOS, Web, Linux, macOS, dan Windows.

## Fitur

- **Tambah Mahasiswa**: Input data nama, NIM, dan jurusan mahasiswa baru.
- **Lihat Daftar Mahasiswa**: Tampilkan semua data mahasiswa dalam bentuk list.
- **Edit Mahasiswa**: Ubah data mahasiswa yang sudah ada.
- **Hapus Mahasiswa**: Hapus data mahasiswa dari database.
- **Penyimpanan Lokal**: Menggunakan SQLite untuk penyimpanan data offline.
- **Multi-Platform**: Mendukung Android, iOS, Web, dan desktop (Linux, macOS, Windows).

## Persyaratan Sistem

- **Flutter SDK**: Versi 3.10.0 atau lebih baru.
- **Dart SDK**: Versi 3.0.0 atau lebih baru.
- **Android Studio** (untuk Android/iOS development).
- **Chrome** (untuk web development).
- **Desktop Toolchain** (untuk Linux/macOS/Windows, ikuti panduan Flutter).

## Instalasi

1. **Clone Repository**:
   ```bash
   git clone https://github.com/zaaammmmm/sqlite-flutter-ppb.git
   cd sqlite-flutter-ppb
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Setup untuk Web**:
   ```bash
   dart run sqflite_common_ffi_web:setup
   ```

4. **Enable Desktop Support** (opsional, untuk Linux/macOS/Windows):
   ```bash
   flutter config --enable-linux-desktop
   flutter config --enable-macos-desktop
   flutter config --enable-windows-desktop
   ```

## Cara Menjalankan

### Jalankan di Web (Chrome)
```bash
flutter run -d chrome
```

### Jalankan di Android Emulator/Device
```bash
flutter run -d android
```

### Jalankan di iOS Simulator/Device (hanya di macOS)
```bash
flutter run -d ios
```

### Jalankan di Desktop
- **Linux**:
  ```bash
  flutter run -d linux
  ```
- **macOS**:
  ```bash
  flutter run -d macos
  ```
- **Windows**:
  ```bash
  flutter run -d windows
  ```

## Build untuk Production

### Build untuk Web
```bash
flutter build web
```

### Build APK untuk Android
```bash
flutter build apk
```

### Build untuk Desktop
- **Linux**:
  ```bash
  flutter build linux
  ```
- **macOS**:
  ```bash
  flutter build macos
  ```
- **Windows**:
  ```bash
  flutter build windows
  ```

## Struktur Proyek

```
lib/
├── main.dart                 # Entry point aplikasi
├── database/
│   └── mahasiswa_helper.dart # Helper untuk operasi database SQLite
├── models/
│   └── mahasiswa.dart        # Model data Mahasiswa
├── pages/
│   └── mahasiswa_page.dart   # UI utama untuk manajemen mahasiswa
└── services/
    └── mahasiswa_service.dart # Service layer untuk business logic
```

## Teknologi yang Digunakan

- **Flutter**: Framework UI untuk multi-platform.
- **Dart**: Bahasa pemrograman.
- **SQLite**: Database lokal.
- **sqflite**: Plugin Flutter untuk SQLite.
- **sqflite_common_ffi**: Untuk dukungan desktop dan web.

## Lisensi

Proyek ini menggunakan lisensi MIT. Lihat file [LICENSE](LICENSE) untuk detail lebih lanjut.

## Kontribusi

Kontribusi sangat diterima! Silakan buat issue atau pull request di [GitHub](https://github.com/zaaammmmm/sqlite-flutter-ppb).

## Kontak

Jika ada pertanyaan, hubungi [zaaammmmm](https://github.com/zaaammmmm).
