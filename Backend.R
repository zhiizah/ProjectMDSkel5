# Import Library yang Dibutuhkan
library(DBI)
library(RMySQL)
library(dplyr)

# Koneksi ke Database MySQL (pariwisata_db)
con <- dbConnect(MySQL(), 
                 dbname = "pariwisata_db", 
                 host = "127.0.0.1", 
                 port = 3306, 
                 user = "root", 
                 password = "")

# Fungsi untuk Mengambil Data dari Tabel MySQL
get_data <- function(table_name) {
  query <- paste("SELECT * FROM", table_name)
  data <- dbGetQuery(con, query)
  return(data)
}

# Ambil Data Wisata
get_wisata <- function() {
  return(get_data("wisata"))
}

# Ambil Data Kabupaten
get_kabupaten <- function() {
  return(get_data("kabupaten"))
}

# Ambil Data Kecamatan
get_kecamatan <- function() {
  return(get_data("kecamatan"))
}

# Ambil Data Kelurahan
get_kelurahan <- function() {
  return(get_data("kelurahan"))
}

# Contoh Pemanggilan Fungsi (Gunakan di Shiny atau Script Lain)
print("Mengambil data wisata...")
wisata_data <- get_wisata()
print(head(wisata_data))  # Menampilkan 6 baris pertama dari data wisata

print("Mengambil data kabupaten...")
kabupaten_data <- get_kabupaten()
print(head(kabupaten_data))

print("Mengambil data kecamatan...")
kecamatan_data <- get_kecamatan()
print(head(kecamatan_data))

print("Mengambil data kelurahan...")
kelurahan_data <- get_kelurahan()
print(head(kelurahan_data))

# Tutup Koneksi Database (Gunakan dbDisconnect(con) saat aplikasi selesai)