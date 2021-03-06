## ----environment, echo = FALSE, message = FALSE, warning=FALSE-----------
knitr::opts_chunk$set(collapse = TRUE, comment = "")
options(tibble.print_min = 4L, tibble.print_max = 4L)

library(dlookr)
library(dplyr)
library(ggplot2)

## ----import_data, warning=FALSE------------------------------------------
library(nycflights13)
dim(flights)
flights

## ----diagnose------------------------------------------------------------
diagnose(flights)

## ----diagnoses-----------------------------------------------------------
# Select columns by name
diagnose(flights, year, month, day)
# Select all columns between year and day (inclusive)
diagnose(flights, year:day)
# Select all columns except those from year to day (inclusive)
diagnose(flights, -(year:day))

## ----diagnose_pipe-------------------------------------------------------
flights %>%
  diagnose() %>%
  select(-unique_count, -unique_rate) %>% 
  filter(missing_count > 0) %>% 
  arrange(desc(missing_count))

## ----diagnose_pipe_numeric-----------------------------------------------
diagnose_numeric(flights)

## ----diagnose_pipe_numeric_pipe------------------------------------------
diagnose_numeric(flights) %>% 
  filter(minus > 0 | zero > 0) 

## ----diagnose_category---------------------------------------------------
diagnose_category(flights)

## ----diagnose_category_pipe----------------------------------------------
diagnose_category(flights) %>% 
  filter(is.na(levels))

## ----diagnose_category_pipe2---------------------------------------------
flights %>%
  diagnose_category(top = 500)  %>%
  filter(ratio <= 0.01)

## ----diagnose_outlier----------------------------------------------------
diagnose_outlier(flights)

## ----diagnose_outlier_pipe-----------------------------------------------
diagnose_outlier(flights) %>% 
  filter(outliers_cnt > 0) 

## ----diagnose_outlier_pipe2----------------------------------------------
diagnose_outlier(flights) %>% 
  filter(outliers_ratio > 5) %>% 
  mutate(rate = outliers_mean / with_mean) %>% 
  arrange(desc(rate)) %>% 
  select(-outliers_cnt)

## ----plot_outlier, fig.width = 5, fig.height = 3-------------------------
flights %>%
  plot_outlier(arr_delay) 

## ----plot_outlier_pipe, fig.width = 5, fig.height = 3--------------------
flights %>%
  plot_outlier(diagnose_outlier(flights) %>% 
                 filter(outliers_ratio >= 0.5) %>% 
                 select(variables) %>% 
                 unlist())

## ----diagnose_report, eval=FALSE-----------------------------------------
#  flights %>%
#    diagnose_report()

## ---- eval=FALSE---------------------------------------------------------
#  flights %>%
#    diagnose_report(output_format = "html")

## ---- eval=FALSE---------------------------------------------------------
#  flights %>%
#    diagnose_report(output_format = "html", output_file = "Diagn.html")

## ----diag_title_pdf, echo=FALSE, out.width='70%', fig.align='center', fig.pos="!h", fig.cap="Data Diagnostic Report Cover"----
knitr::include_graphics('img/diagn_title_pdf.png')

## ----diag_agenda_pdf, echo=FALSE, out.width='70%', fig.align='center', fig.pos="!h", fig.cap="Data Diagnostic Report Contents"----
knitr::include_graphics('img/diagn_agenda_pdf.png')

## ----diag_intro_pdf, echo=FALSE, out.width='70%', fig.align='center', fig.pos="!h", fig.cap="Sample data diagnostic report table"----
knitr::include_graphics('img/diag_intro_pdf.png')

## ----diag_outlier_pdf, echo=FALSE, out.width='70%', fig.align='center', fig.pos="!h", fig.cap="Data diagnosis report outlier diagnosis contents"----
knitr::include_graphics('img/diag_outlier_pdf.png')

## ----diag_egenda_html, echo=FALSE, out.width='70%', fig.align='center', fig.pos="!h", fig.cap="Data Diagnostic report titles and table of contents"----
knitr::include_graphics('img/diag_agenda_html.png')

## ----diag_table_html, echo=FALSE, out.width='70%', fig.align='center', fig.pos="!h", fig.cap="Sample data diagnostic report table (html)"----
knitr::include_graphics('img/diag_table_html.png')

## ----diag_outlier_html, echo=FALSE, out.width='70%', fig.align='center', fig.pos="!h", fig.cap="Data diagnosis report outlier diagnosis contents (html)"----
knitr::include_graphics('img/diag_outlier_html.png')

## ----dbi_table, warning=FALSE, message=FALSE-----------------------------
if (!require(DBI)) install.packages('DBI')
if (!require(RSQLite)) install.packages('RSQLite')
if (!require(dplyr)) install.packages('dplyr')
if (!require(dbplyr)) install.packages('dbplyr')

library(dbplyr)
library(dplyr)

carseats <- ISLR::Carseats
carseats[sample(seq(NROW(carseats)), 20), "Income"] <- NA
carseats[sample(seq(NROW(carseats)), 5), "Urban"] <- NA

# connect DBMS
con_sqlite <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")

# copy carseats to the DBMS with a table named TB_CARSEATS
copy_to(con_sqlite, carseats, name = "TB_CARSEATS", overwrite = TRUE)

## ----dbi_diag------------------------------------------------------------
# Diagnosis of all columns
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose()

# Positions values select columns, and In-memory mode
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose(1, 3, 8, in_database = FALSE)
  
# Positions values select columns, and In-memory mode and collect size is 200
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose(-8, -9, -10, in_database = FALSE, collect_size = 200)

## ----dbi_category--------------------------------------------------------
# Positions values select variables, and In-memory mode and collect size is 200
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose_category(7, in_database = FALSE, collect_size = 200) 
  
# Positions values select variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose_category(-7)

## ----dbi_numeric---------------------------------------------------------
# Diagnosis of all numerical variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose_numeric()
  
# Positive values select variables, and In-memory mode and collect size is 200
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose_numeric(Sales, Income, collect_size = 200)

## ----dbi_outlier---------------------------------------------------------
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose_outlier()  %>%
  filter(outliers_ratio > 1)

## ----plot_outlier_dbi, fig.width = 5, fig.height = 3---------------------
# Visualization of numerical variables with a ratio of
# outliers greater than 1%
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  plot_outlier(con_sqlite %>% 
                 tbl("TB_CARSEATS") %>% 
                 diagnose_outlier() %>%
                 filter(outliers_ratio > 1) %>%
                 select(variables) %>%
                 pull())

## ----dbi_diag_report, eval=FALSE-----------------------------------------
#  # create pdf file. file name is DataDiagnosis_Report.pdf
#  con_sqlite %>%
#    tbl("TB_CARSEATS") %>%
#    diagnose_report()
#  
#  # create pdf file. file name is Diagn.pdf, and collect size is 350
#  con_sqlite %>%
#    tbl("TB_CARSEATS") %>%
#    diagnose_report(collect_size = 350, output_file = "Diagn.pdf")
#  
#  # create html file. file name is Diagnosis_Report.html
#  con_sqlite %>%
#    tbl("TB_CARSEATS") %>%
#    diagnose_report(output_format = "html")
#  
#  # create html file. file name is Diagn.html
#  con_sqlite %>%
#    tbl("TB_CARSEATS") %>%
#    diagnose_report(output_format = "html", output_file = "Diagn.html")

