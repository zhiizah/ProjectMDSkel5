# 📌 Import Library yang Dibutuhkan
library(shiny)
library(shinydashboard)
library(DT)
library(leaflet)
library(DBI)
library(RMySQL)
library(dplyr)
library(ggplot2)

# 📌 Koneksi ke Database MySQL (pariwisata_db)
con <- dbConnect(MySQL(), 
                 dbname = "pariwisata_db", 
                 host = "127.0.0.1", 
                 port = 3306, 
                 user = "root", 
                 password = "")

# 📌 Fungsi untuk Mengambil Data dari Database
get_data <- function(table_name) {
  query <- paste("SELECT * FROM", table_name)
  data <- dbGetQuery(con, query)
  return(data)
}

# 📌 UI (Tampilan Aplikasi)
ui <- dashboardPage(
  dashboardHeader(title = "Dashboard Wisata"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Beranda", tabName = "beranda", icon = icon("home")),
      menuItem("Data Wisata", tabName = "data_wisata", icon = icon("table")),
      menuItem("Peta Wisata", tabName = "peta_wisata", icon = icon("map")),
      menuItem("Statistik Wisata", tabName = "statistik", icon = icon("chart-bar"))
    )
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "beranda",
              fluidRow(
                valueBoxOutput("total_wisata", width = 4),
                valueBoxOutput("total_kabupaten", width = 4),
                valueBoxOutput("total_kecamatan", width = 4)
              )
      ),
      
      tabItem(tabName = "data_wisata",
              fluidRow(
                box(title = "Tabel Data Wisata", width = 12, 
                    DTOutput("tabel_wisata"))
              )
      ),
      
      tabItem(tabName = "peta_wisata",
              fluidRow(
                box(title = "Peta Lokasi Wisata", width = 12, leafletOutput("peta"))
              )
      ),
      
      tabItem(tabName = "statistik",
              fluidRow(
                box(title = "Distribusi Wisata per Kabupaten", width = 12, 
                    plotOutput("statistik_wisata"))
              )
      )
    )
  )
)

# 📌 Server (Logika Aplikasi)
server <- function(input, output, session) {
  
  # 📌 Ambil Data dari Database
  wisata <- reactive({ get_data("wisata") })
  kabupaten <- reactive({ get_data("kabupaten") })
  kecamatan <- reactive({ get_data("kecamatan") })
  kelurahan <- reactive({ get_data("kelurahan") })
  
  # 📌 Value Box (Jumlah Data)
  output$total_wisata <- renderValueBox({
    valueBox(nrow(wisata()), "Total Wisata", icon = icon("map-marker"), color = "blue")
  })
  
  output$total_kabupaten <- renderValueBox({
    valueBox(nrow(kabupaten()), "Total Kabupaten", icon = icon("building"), color = "green")
  })
  
  output$total_kecamatan <- renderValueBox({
    valueBox(nrow(kecamatan()), "Total Kecamatan", icon = icon("globe"), color = "yellow")
  })
  
  # 📌 Tampilkan Tabel Wisata
  output$tabel_wisata <- renderDT({
    datatable(wisata(), options = list(pageLength = 10))
  })
  
  # 📌 Tampilkan Peta Wisata
  output$peta <- renderLeaflet({
    df <- wisata()
    
    leaflet(df) %>%
      addTiles() %>%
      addCircleMarkers(
        lng = ~as.numeric(Kode_Kel), lat = ~as.numeric(Kode_Kec), 
        popup = ~paste(Nama_Wisata, "<br>", Alamat),
        radius = 5, color = "red", fillOpacity = 0.7
      )
  })
  
  # 📌 Statistik Wisata per Kabupaten
  output$statistik_wisata <- renderPlot({
    df <- wisata() %>% group_by(Kode_Kabkot) %>% summarise(jumlah = n())
    
    ggplot(df, aes(x = Kode_Kabkot, y = jumlah, fill = Kode_Kabkot)) +
      geom_bar(stat = "identity") +
      theme_minimal() +
      labs(title = "Jumlah Wisata per Kabupaten", x = "Kabupaten", y = "Jumlah Wisata") +
      theme(legend.position = "none")
  })
}

# 📌 Jalankan Aplikasi Shiny
shinyApp(ui = ui, server = server)