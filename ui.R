
library(pacman)
p_load(shiny, shinymaterial, shinydashboard, shinyWidgets)

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
        width = 6
        
      ),
      material_column(
        offset = 1,
        width = 6,
        plotOutput("genderplot"))
    )
  )
)


shinyUI(ui)
