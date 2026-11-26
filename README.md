# Sistem Pengelolaan Peminjaman Peralatan Laboratorium

## Anggota Kelompok
1. **Dennis Pratama Saputra** - K3525023
2. **Allicya Nailah Fairuza** - K3525048
3. **Arofa Karindra Bimantara** - K3525051

## Deskripsi Sistem
Aplikasi berbasis Python dengan pendekatan *Object-Oriented Programming* (OOP) untuk mengelola peminjaman dan pengembalian peralatan laboratorium. Pada tahap pengembangan Proyek III, sistem telah bermigrasi ke penyimpanan basis data relasional **MySQL (XAMPP)** menggunakan library `pymysql` dengan dukungan transaksi ACID (*commit* dan *rollback*), sehingga seluruh data master maupun transaksi tersimpan secara terpusat dan konsisten.

## Fitur Utama & Aturan Bisnis
- **Manajemen Data Master (CRUD):** Pengelolaan data kategori alat, peralatan laboratorium, dan data mahasiswa.
- **Transaksi Peminjaman Multi-Alat:** Satu transaksi dapat meminjam lebih dari satu alat sekaligus dengan batas waktu peminjaman otomatis selama 7 hari dan maksimal 2 transaksi aktif per mahasiswa.
- **Pengembalian Sebagian (Parsial):** Mahasiswa dapat mengembalikan sebagian alat dari satu transaksi, dengan pembaruan kondisi fisik alat (`Baik`, `Rusak Ringan`, atau `Rusak Berat`).
- **Validasi Integritas Data:** Alat yang sedang dipinjam atau berstatus rusak tidak dapat dipinjam, serta data mahasiswa maupun alat yang masih terlibat transaksi aktif tidak dapat dihapus.

## Struktur Program
```text
Tugas-Projek-3-Pemrograman/
│
├── models/
│   ├── alat.py
│   ├── kategori.py
│   ├── mahasiswa.py
│   └── transaksi.py
├── controllers/
│   └── sistem_peminjaman.py
├── ui/
│   └── menu_ui.py
├── utils/
│   ├── db_handler.py
│   ├── file_handler.py
│   └── logger.py
├── database.py
├── main.py
└── README.md