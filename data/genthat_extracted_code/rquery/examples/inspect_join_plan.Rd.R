library(rquery)


### Name: inspect_join_plan
### Title: check that a join plan is consistent with table descriptions.
### Aliases: inspect_join_plan

### ** Examples


if (requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  # example data
  DBI::dbWriteTable(my_db,
                    "d1",
                    data.frame(id= 1:3,
                               weight= c(200, 140, 98),
                               height= c(60, 24, 12)))
  DBI::dbWriteTable(my_db,
                    "d2",
                    data.frame(pid= 2:3,
                               weight= c(130, 110),
                               width= 1))
  # get the initial description of table defs
  tDesc <- describe_tables(my_db, qc(d1, d2))
  # declare keys (and give them consistent names)
  tDesc$keys[[1]] <- list(PrimaryKey= 'id')
  tDesc$keys[[2]] <- list(PrimaryKey= 'pid')
  # build the join plan
  columnJoinPlan <- build_join_plan(tDesc)
  # confirm the plan
  print(inspect_join_plan(tDesc, columnJoinPlan,
                          checkColClasses= TRUE))
  # damage the plan
  columnJoinPlan$sourceColumn[columnJoinPlan$sourceColumn=='width'] <- 'wd'
  # find a problem
  print(inspect_join_plan(tDesc, columnJoinPlan,
                          checkColClasses= TRUE))
  DBI::dbDisconnect(my_db)
}




