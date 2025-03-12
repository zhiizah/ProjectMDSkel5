
<p align="center">
  <img width="670" height="350" src="https://github.com/zhiizah/ProjectMDSkel5/blob/main/Images/Blue%20Green%20Minimalist%20Modern%20Travel%20Package%20Presentation.gif?raw=true">
</p>

<div align="center">

  
# PESONA JABAR

[Tentang](#scroll-tentang)
•
[Screenshot](#rice_scene-screenshot)
•
[Demo](#dvd-demo)
•
[Dokumentasi](#blue_book-dokumentasi)
  
</div>

## :bookmark_tabs: Menu
- [Tentang](#scroll-tentang) 📖
- [Screenshot](#rice_scene-screenshot) 📸
- [Demo](#dvd-demo) 🎬
- [Dokumentasi](#blue_book-dokumentasi) 📚
- [ERD](#rotating_light-erd) 📈
- [Deskripsi Data](#heavy_check_mark-deskripsi-data) 📋
- [Struktur Folder](#open_file_folder-struktur-folder) 📁
- [Our Team](#smiley_cat-tim-pengembang) 👨‍💻

 ## 📖 **Tentang**  

"Pesona Jabar" adalah dashboard interaktif yang membantu Anda menemukan destinasi wisata terbaik di Provinsi Jawa Barat dengan mudah, cepat, dan tanpa ribet! ✨  

🎯 **Fitur Utama**  
✅ **Cari Wisata** – Filter dan temukan destinasi wisata berdasarkan kabupaten, kecamatan, tipe wisata, harga tiket, dan rating.  
✅ **Statistik Wisata** – Lihat data dan analisis seputar tren wisata di Jawa Barat.  
✅ **Rekomendasi Terbaik** – Dapatkan rekomendasi wisata dengan rating tertinggi yang wajib dikunjungi.  

🚀 **Cara Menggunakan**  
1️⃣ Buka halaman **Dashboard** untuk melihat rekomendasi wisata terbaik.  

2️⃣ Klik menu **Cari Wisata** untuk mencari tempat yang sesuai dengan preferensimu.  

3️⃣ Jelajahi **Statistik Wisata** untuk memahami tren wisata di Jawa Barat.  

4️⃣ Nikmati perjalananmu dan bagikan pengalaman terbaikmu! 🌟  

 ## :📸 Screenshot

<p align="center">
  <img width="900" height="420" src="https://github.com/zhiizah/ProjectMDSkel5/blob/main/Images/Dashboard.png?raw=true">
</p>

Halaman pertama pada dashboard menampilkan "tentang" yang berisi deskripsi singkat terkait dengan dashboard, selain itu ada tampilan Top 4 Rank wisata di Jawa Barat

<p align="center">
  <img width="900" height="420" src="https://github.com/zhiizah/ProjectMDSkel5/blob/main/Images/Cari%20Wisata.png?raw=true">
</p>

Halaman kedua merupakan fitur untuk mencari wisata dengan memasukkan pilihan Kabupaten/Kota yang ingin kamu cari lalu memilih jenis wisata sehingga menampilkan tabel hasil pencarian berupa Nama Wisata, Rating, Harga, Deskripsi , dan Link ke google maps. 

<p align="center">
  <img width="900" height="420" src="https://github.com/zhiizah/ProjectMDSkel5/blob/main/Images/Statistik%20Wisata.png?raw=true">
</p>

Halaman ketiga terkait dengan statistik wisata yang menampilkan tren seputar wisata Jawa Barat. 

## 🎬 Demo

Berikut merupakan link untuk shinnyapps atau dashboard dari project kami:
https://mdselompok6.shinyapps.io/Dashbordmds6/

## 💾 ERD
Entitiy Relationship Diagram (ERD) menampilkan hubungan antara entitas dengan atribut. Pada project ini, pada entitas Wisata terdapat 3 atribut yang berhubungan dengan entitas lain yaitu kode_kabkot yang memiliki hubungan ke entitas Kota, kode_kec berhubungan dengan entitas Kecamatan, Kodel_kel memiliki hubungan dengan entitas Kelurahan dengan masing-masing hubungan One-to-Many. 

<p align="center">
  <img width="600" height="400" src="https://github.com/zhiizah/ProjectMDSkel5/blob/main/Images/ERD.drawio.png?raw=true">
</p>

## 📋 Deskripsi Data

Berisi tentang tabel-tabel yang digunakan berikut dengan sintaks SQL DDL (CREATE).

### Create Database
"Pesona Jabar" menyimpan informasi yang mewakili atribut data yang saling berhubungan untuk kemudian dianalisis.

### Create Table Kabupaten Kota
Table Kabupaten memberikan informasi kepada user terkait dengan kabupaten / kota yang ada di Jawa Barat termasuk kode kabupaten, nama kabupaten dan jumlah penduduk  Berikut deskripsi untuk setiap tabel penerbit.
| Attribute          | Type                   | Description                     |
|:-------------------|:-----------------------|:--------------------------------|
| kode_Kabkot        | character varying(10)  | Kode Kabupaten / kota           |
| nama_Kabkot        | character varying(100) | Nama Kabupaten / Kota           |
| Ibukota            | character varying(100) | Ibu Kota                        |
| Jml_pddk_kabkot    | character varying(100) | Jumlah penduduk                 |

dengan script SQL sebagai berikut:
```sql
CREATE TABLE IF NOT EXISTS Kota (
    Kode_Kabkot VARCHAR(10) PRIMARY KEY,
    Nama_Kabkot VARCHAR(100) NOT NULL,
    Ibukota VARCHAR(100),
    Jml_pddk_kabkot int (20)
);
select * from Kota
```

### Create Table Kecamatan

Table Kecamatan  memberikan informasi kepada user terkait dengan Kecamatan yang ada di Jawa Barat termasuk kode kecamtan, Nama kecamatan, terletak di kabupaten apa dan jumlah penduduk  Berikut deskripsi untuk setiap tabel penerbit.
| Attribute          | Type                   | Description                     |
|:-------------------|:-----------------------|:--------------------------------|
| kode_Kec           | character varying(10)  | Kode Kecamatan                  |
| Kode_Kabkot        | character varying(10)  | Kode Kabupaten / Kota           |
| Nama_Kec           | character varying(100) | Nama Kecamatan                  |
| Jml_pddk_kec       | character varying(100) | Jumlah penduduk                 |

dengan script SQL sebagai berikut:
```sql
CREATE TABLE IF NOT EXISTS Kecamatan (
    Kode_Kec VARCHAR(10) PRIMARY KEY,
    Kode_Kabkot VARCHAR(100) NOT NULL,
    Nama_Kec VARCHAR(100),
    Jml_pddk_kec int (20)
);
select * from Kecamatan
```
### Create Table Kelurahan

Table Kecamatan  memberikan informasi kepada user terkait dengan Kecamatan yang ada di Jawa Barat termasuk kode kecamtan, Nama kecamatan, terletak di kabupaten apa dan jumlah penduduk  Berikut deskripsi untuk setiap tabel penerbit.
| Attribute          | Type                   | Description                     |
|:-------------------|:-----------------------|:--------------------------------|
| kode_Kel           | character varying(10)  | Kode Kelurahan                  |
| Kode_Kec           | character varying(10)  | Kode Kecamatan                  |
| Nama_Kel           | character varying(100) | Nama Kelurahan                  |
| Jml_pddk_kel       | character varying(100) | Jumlah penduduk                 |

dengan script SQL sebagai berikut:
```sql
CREATE TABLE IF NOT EXISTS Kelurahan (
    Kode_Kel VARCHAR(10) PRIMARY KEY,
    Kode_Kec VARCHAR(100) NOT NULL,
    Nama_Kel VARCHAR(100),
    Jml_pddk_kelc int (20)
);
select * from Kelurahan
```
### Create Table Wisata

## 📁 Struktur Folder

```
.
├── app           # ShinyApps
│   ├── css
│   │   ├── **/*.css
│   ├── server.R
│   └── ui.R
├── data 
│   ├── csv
│   │   ├── **/*.css
│   └── sql
|       └── db.sql
├── src           # Project source code
├── doc           # Doc for the project
├── .gitignore
├── LICENSE
└── README.md
```


## 👨‍💻 Tim Pengembang

- Frontend Developer: [Syella Zignora Limba](https://github.com/syellazignora16) (G1501231027)
- Backend Developer: [Siti Nur Azizah](https://github.com/zhiizah) (G1501231058)
- Technical Writer: [Nabila Syukri](https://github.com/nabilasyukrii) (G1501231073)
- Database Manager: [Boy Riansyah](https://github.com/boyriansyah) (G1501231055)

