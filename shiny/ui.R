library(shiny)
library(DT)

shinyUI(fluidPage(
  tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "style.css")),
  tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "style5.css")),
  head("疑似データ生成"),
  theme = shinytheme("lumen"),
  sidebarLayout(
    sidebarPanel(p("変数と行数を選択してください"),
                 p("性別と年齢はデフォルトで生成されます"),
                 checkboxGroupInput("checkvariable", 
                                    label = "変数選択", 
                                    choices = list("姓名" = "姓名", 
                                                   "年齢階層" = "年齢階層",
                                                   "身長" = "身長",
                                                   "体重" = "体重",
                                                   "bmi" = "bmi",
                                                   "所在地" = "所在地",
                                                   "最終学歴" = "最終学歴",
                                                   "専攻学科" = "専攻学科",
                                                   "職業" = "職業",
                                                   "給料" = "給料",
                                                   "配偶状況" = "配偶状況",
                                                   "初婚年齢" = "初婚年齢",
                                                   "喫煙" = "喫煙",
                                                   "飲酒" = "飲酒",
                                                   "生活満足度" = "生活満足度")),
                 numericInput("num", label = "データ行数(10～5000)",value = 10, min = 2, max = 5000),
                 actionButton("action", label = "生成")),
    mainPanel(
      downloadButton('downloadData', 'Download'),
      dataTableOutput("JPdata2")
      )
  )
))

