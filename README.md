
<p align="center">
  <img width="700" height="370" src="https://github.com/zhiizah/ProjectMDSkel5/blob/main/Images/Blue%20Green%20Minimalist%20Modern%20Travel%20Package%20Presentation.gif?raw=true">
</p>

<div align="center">

  
# PESONA JABAR

_Jelajahi indahnya Jawa Barat_
  
</div>

## Menu
- [Tentang](#-tentang) 📖
- [Screenshot](#-screenshot) 📸
- [Demo](#-demo) 🎬
- [ERD](#-erd) 📈
- [Deskripsi Data](#-deskripsi-data) 📋
- [Struktur Folder](#-struktur-folder) 📁
- [Our Team](#-tim-pengembang) 👨‍💻

 ## 📖 **Tentang**  

"Pesona Jabar" adalah dashboard interaktif yang membantu Anda menemukan destinasi wisata terbaik di Provinsi Jawa Barat dengan mudah, cepat, dan tanpa ribet! ✨  

🎯 **Fitur Utama**  
✅ **Cari Wisata** – Filter dan temukan destinasi wisata berdasarkan kabupaten/kota dan tipe wisata.
✅ **Statistik Wisata** – Lihat data dan analisis seputar tren wisata di Jawa Barat.  
✅ **Rekomendasi Terbaik** – Dapatkan rekomendasi wisata dengan rating tertinggi yang wajib dikunjungi.  

🚀 **Cara Menggunakan**  
1️⃣ Buka halaman **Dashboard** untuk melihat rekomendasi wisata terbaik.  
2️⃣ Klik menu **Cari Wisata** untuk mencari tempat yang sesuai dengan preferensimu.  
3️⃣ Jelajahi **Statistik Wisata** untuk memahami tren wisata di Jawa Barat.  
4️⃣ Nikmati perjalananmu dan bagikan pengalaman terbaikmu! 🌟  

 ## 📸 Screenshot

<p align="center">
  <img width="900" height="420" src="https://github.com/zhiizah/ProjectMDSkel5/blob/main/Images/Dashboard.png?raw=true">
</p>

Halaman pertama pada dashboard menampilkan "tentang" yang berisi deskripsi singkat terkait dengan dashboard, selain itu ada tampilan Top 4 Rank wisata di Jawa Barat.

<p align="center">
  <img width="900" height="420" src="https://github.com/zhiizah/ProjectMDSkel5/blob/main/Images/Cari%20Wisata.png?raw=true">
</p>

Halaman kedua merupakan fitur untuk mencari wisata dengan memasukkan pilihan Kabupaten/Kota yang ingin kamu cari lalu memilih jenis wisata sehingga menampilkan tabel hasil pencarian berupa Nama Wisata, Rating, Harga, Deskripsi , dan Link ke google maps. 

<p align="center">
  <img width="900" height="420" src="https://github.com/zhiizah/ProjectMDSkel5/blob/main/Images/Statistik%20Wisata.png?raw=true">
</p>

Halaman ketiga terkait dengan statistik wisata yang menampilkan tren seputar wisata Jawa Barat. Anda bisa melihat distribusi tarif wisata disetiap kabupaten/kita berdasarkan kategori berbayar atau gratis.

## 🎬 Demo

Berikut merupakan link untuk shinnyapps atau dashboard dari project kami:
[Open in browser](http://127.0.0.1:7341/)

## 💾 ERD
Entitiy Relationship Diagram (ERD) menampilkan hubungan antara entitas dengan atribut. Pada project ini, pada entitas Wisata terdapat 3 atribut yang berhubungan dengan entitas lain yaitu kode_kabkot yang memiliki hubungan ke entitas Kota, kode_kec berhubungan dengan entitas Kecamatan, Kodel_kel memiliki hubungan dengan entitas Kelurahan dengan masing-masing hubungan One-to-Many. 

<p align="center">
  <img width="600" height="400" src="https://github.com/zhiizah/ProjectMDSkel5/blob/main/Images/ERD.drawio.png?raw=true">
</p>

## 📋 Deskripsi Data

Database "Pesona Jabar" terdiri dari empat entitas atau tabel utama yaitu Kota, Kecamatan, Kelurahan dan Wisata yang diberi nama **pariwisataok_db**. 

Database dibuat dan dikelola dengan aplikasi R yang dikoneksikan ke MySQL melalu paket `DBI` dan `RMySQL`. Berikut adalah kode untuk koneksi ke database

```sql
con <- dbConnect(
  MySQL(),
  host = "127.0.0.1",
  port = 3306
  user = "root",
  password = "",
  dbname = "pariwisataok_db"
```
Selanjutnya load dataset berdasarkan lokasi file. Dataset tersedia pada folder [Data](https://github.com/zhiizah/ProjectMDSkel5/tree/main/data). Kemudian mengisi database dengan `dbWriteTable` seperti di bawah ini

```sql
dbWriteTable(con, "kabupaten", kabupaten, overwrite = TRUE)
dbWriteTable(con, "kecamatan", kecamatan, overwrite = TRUE)
dbWriteTable(con, "kelurahan", kelurahan, overwrite = TRUE)
dbWriteTable(con, "wisata", wisata, overwrite = TRUE)
```

_Note:_ Sintaks lengkap dapat dilihat pada file [Projek MDS UTS.qmd](https://github.com/zhiizah/ProjectMDSkel5/blob/main/kodingan/Project%20MDS%20UTS.qmd) 

| Entity             | Atribut                | 
|:-------------------|:-----------------------|
| Kota               | Kode_Kabkot , Nama_Kabkot, Jml_pddk_kabkot  |        
| Kecamatan          | Kode_Kec , Nama_Kec, Kode_Kabkot, Jml_pddk_kec        | 
| Kelurahan          | Kode_Kel , Nama_Kel, Kode_Kec, Jml_pddk_kec        | 
| Wisata             | Kode_Wisata, Nama_Wisata, Tipe_Wisata, Kode_Kec , Kode_Kel, Kode_Kabkot, Rating, Harga, Alamat, Deskripsi        | 
    
Berikut pendefinisian masing-masing entity 

### Table Kota
Table Kota memberikan informasi kepada user terkait dengan kabupaten / kota yang ada di Jawa Barat termasuk kode kabupaten, nama kabupaten dan jumlah penduduk. Berikut deskripsi untuk setiap tabel Kota.
| Attribute          | Type                   | Description                     |
|:-------------------|:-----------------------|:--------------------------------|
| Kode_Kabkot        | character varying(10)  | Kode Kabupaten / kota           |
| Nama_Kabkot        | character varying(100) | Nama Kabupaten / Kota           |
| Ibukota            | character varying(100) | Ibu Kota                        |
| Jml_pddk_kabkot    | integer                | Jumlah penduduk                 |


### Table Kecamatan
Table Kecamatan  memberikan informasi kepada user terkait dengan Kecamatan yang ada di Jawa Barat termasuk kode kecamtan, Nama kecamatan, terletak di kabupaten apa dan jumlah penduduk  Berikut deskripsi untuk setiap tabel Kecamatan.
| Attribute          | Type                   | Description                     |
|:-------------------|:-----------------------|:--------------------------------|
| Kode_Kec           | character varying(10)  | Kode Kecamatan                  |
| Kode_Kabkot        | character varying(10)  | Kode Kabupaten / Kota           |
| Nama_Kec           | character varying(100) | Nama Kecamatan                  |
| Jml_pddk_kec       | integer                | Jumlah penduduk                 |

### Table Kelurahan
Table Kelurahan memberikan informasi kepada user terkait dengan Kecamatan yang ada di Jawa Barat termasuk kode kecamtan, Nama kecamatan, terletak di kabupaten apa dan jumlah penduduk  Berikut deskripsi untuk setiap tabel Kelurahan.

| Attribute          | Type                   | Description                     |
|:-------------------|:-----------------------|:--------------------------------|
| kode_Kel           | character varying(10)  | Kode Kelurahan                  |
| Kode_Kec           | character varying(10)  | Kode Kecamatan                  |
| Nama_Kel           | character varying(100) | Nama Kelurahan                  |
| Jml_pddk_kel       | integer                | Jumlah penduduk                 |

### Table Wisata
Table Wisata  memberikan informasi kepada user terkait dengan Wisata yang ada di Jawa Barat termasuk berdasarkan kabupaten, kecamtan, Kelurahan, Harga, Rating, Alamat, Deskripsi singkat. Berikut deskripsi untuk setiap tabel Wisata.
| Attribute          | Type                   | Description                     |
|:-------------------|:-----------------------|:--------------------------------|
| Kode_Wisata        | character varying(10)  | Kode Wisata                     |
| Nama_Wisata        | character varying(50)  | Nama Wisata                     |  
| Tipe_Wisata        | character varying(50)  | Tipe Wisata                     |
| kode_Kab           | character varying(10)  | Kode Kebupaten                  |
| Kode_Kec           | character varying(10)  | Kode Kecamatan                  |
| Kode_Kel           | character varying(10)  | Nama Kelurahan                  |
| Deskripsi          | character varying(200) | Deskripsi                       |
| Harga_tiket        | numeric                | Harga Tiket                     |
| Rating             | numeric                | Rating                          |
| Alamat             | character varying(50)  | Alamat                          |


## 📁 Struktur Folder

```
.
├── kodingan           # ShinyApps
│   ├── css
│   │   ├── **/*.css
│   ├── Frontend.Rmd
│   └── Backend.Rmd
│   └── Project MDS UTS.qmd   #database connection
├── data 
│   ├── csv
│   │   ├── **/*.css
├── image           # Project image
├── .gitignore
├── LICENSE
└── README.md
```


## 👨‍💻 Tim Pengembang

<p align="center">
  <img width="780" height="420" src="https://github.com/zhiizah/ProjectMDSkel5/blob/main/Images/About%20Our%20Team%20Business%20Presentation%20in%20Black%20and%20White%20Emerald%20Mint%20Green%20Aspirational%20Elegance%20Style.jpg?raw=true ">
</p>
<p align="center">

  
- Database Manager: [Boy Riansyah](https://github.com/boyriansyah) (M0501241012)
- Backend Developer: [Syella Zignora Limba](https://github.com/syellazignora16) (M0501241027)
- Frontend Developer: [Siti Nur Azizah](https://github.com/zhiizah) (M0501241046)
- Technical Writer: [Nabila Syukri](https://github.com/nabilasyukrii) (M0501241086)
