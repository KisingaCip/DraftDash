library(pacman)
p_load(shiny, shinymaterial, shinydashboard, shinyWidgets)

event_options <- c(
  "Agricultural Sector Productivity & Food Security (ASP&FS)" = 1,
  "Maternal/Child Health & Nutrition (H&N)" = 2,
  "Business Development Services (BDS)" = 3
)
quarter_options <- c("2016.2", "2016.3", "2016.4", "2017.1", "2017.2", "2017.3", "2017.4", "2018.1", "2018.2", "2018.3")

county_options <- c("Meru" = 13, "Uasin Gishu" = 21, "Nandi" = 15, "Marakwet" = 4, "Bomet" = 1)

indicators <- c("EG. 11-6", "HL.9-2", "HL.9-4", "HL.9.1-c", "EG.3-6.-7.-8", "EG.3.2-18", "EG.3.2-17", "EG.3.2-1", "EG.3.2-5", "EG.3-1", "EG.3.1-12")

ui <- material_page(
  title = "Draft Dash",
  HTML('<meta name="viewport" content="width=device-width, initial-scale=1">'),
  nav_bar_color = "#3e2723 brown darken-3",
  nav_bar_fixed = F,
  include_fonts = T,

  # side bar panel
  material_side_nav(
    fixed = TRUE,
    image_source = "img/cip_logo.png",
    # Place side-nav tabs within side-nav
    material_side_nav_tabs(
      side_nav_tabs = c(
        "Summaries" = "summary",
        "Graphics" = "charts"
      ),
      icons = c("explore", "insert_chart")
    )
  ),
  material_side_nav_tab_content(
    side_nav_tab_id = "summary",
    # tag$br(),
    material_row(
      material_column(
        offset = 1,
        width = 4,
        awesomeRadio(
          inputId = "collection",
          label = "Table",
          choices = c(
            "Total Reached" = "tt_benf",
            "Events and Training" = "events",
            "Fips Seed Distribution" = "fips_rch"
          ),
          selected = "tt_benf",
          status = "success"
        )
      ),
      material_column(
        width = 3,
        awesomeCheckboxGroup("county", "County",
          selected = c(13, 21, 15, 4, 1),
          choices = county_options,
          inline = T, status = "success"
        )
      ),
      material_column(
        width = 4,
        selectInput("quarters", "Select Quarter:",
          choices = c(Choose = "", quarter_options),
          multiple = T, selected = quarter_options
        )
      )
    ),
    material_row(
      material_column(
        offset = 1,
        width = 4,

        awesomeRadio(
          inputId = "indicator",
          label = "Idicators",
          choices = indicators,
          selected = "EG.3.2-17"
        )
      ),
      material_column(
        width = 7
      )
    )
  ),
  material_side_nav_tab_content(
    side_nav_tab_id = "charts",
    material_row(
      material_column(
        offset = 1,
        width = 6,
        material_card(title = "Project Indicators")
      ),
      material_column(
        width = 6,
        material_card(title = "Indicator Progress", plotOutput("genderplot"))
      )
    )
  )
)



server <- function(input, output) {

}


shinyApp(ui, server)
