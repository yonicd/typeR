## ---- echo = FALSE-------------------------------------------------------
NOT_CRAN <- identical(tolower(Sys.getenv("NOT_CRAN")), "true")
knitr::opts_chunk$set(purl = NOT_CRAN,
											comment = "#>")

## ---- message = FALSE----------------------------------------------------
library(censusapi)

## ---- eval = FALSE-------------------------------------------------------
#  apis <- listCensusApis()
#  View(apis)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
acs_income <- getCensus(name = "acs/acs5",
	vintage = 2016, 
	vars = c("NAME", "B19013_001E", "B19013_001EA", "B19013_001M", "B19013_001MA"), 
	region = "tract:*",
	regionin = "state:02")
head(acs_income)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
flows <- getCensus(name = "acs/flows",
	vintage = 2015,
	vars = c("MOVEDIN", "FULL2_NAME", "FULL1_NAME"),
	region = "county:*",
	regionin = "state:6")
head(flows)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
languages <- getCensus(name = "language",
	vintage = 2013,
	vars = c("EST", "LAN", "LANLABEL"),
	region = "state:36")
head(languages)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
ase_csa <- getCensus(name = "ase/csa",
	vintage = 2014,
	vars = c("GEO_TTL", "NAICS2012", "NAICS2012_TTL", "EMPSZFI", "EMPSZFI_TTL", "FIRMPDEMP"),
	region = "us:*")
head(ase_csa)

ase_cscb <- getCensus(name = "ase/cscb",
	vintage = 2014,
	vars = c("GEO_TTL", "NAICS2012_TTL", "ASECB", "ASECB_TTL", "SPOUSES", "SPOUSES_TTL", "YEAR", 
					 "FIRMPDEMP", "FIRMPDEMP_PCT", "RCPPDEMP", "RCPPDEMP_F", "RCPPDEMP_PCT", 
					 "EMP", "EMP_PCT", "PAYANN", "PAYANN_PCT", "FIRMPDEMP_S", "FIRMPDEMP_PCT_S", 
					 "RCPPDEMP_S", "RCPPDEMP_PCT_S", "EMP_S", "EMP_PCT_S", "PAYANN_S", "PAYANN_PCT_S"),
	region = "us:*")
head(ase_cscb)

ase_cscbo <- getCensus(name = "ase/cscbo",
	vintage = 2014,
	vars = c("GEO_TTL", "NAICS2012_TTL", "ASECBO", "ASECBO_TTL", "ACQBUS", "ACQBUS_TTL", 
					 "YEAR", "OWNPDEMP", "OWNPDEMP_PCT", "OWNPDEMP_S", "OWNPDEMP_PCT_S"),
	region = "us:*")
head(ase_cscbo)


## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
asm_state <- getCensus(name = "timeseries/asm/state",
	vars = c("NAICS_TTL", "EMP", "GEO_TTL"),
	region = "state:*",
	time = 2016,
	naics = "31-33")
head(asm_state)

asm_product <- getCensus(name = "timeseries/asm/product",
	vars = c("PSCODE_TTL", "GEO_TTL", "PRODVAL"),
	region = "us:*",
	time = 2016,
	pscode = "311111")
head(asm_product)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
firms_states <- getCensus(name = "timeseries/bds/firms",
	vars = c("firms", "emp", "fage4"),
	region = "state:*",
	time = 2014)
head(firms_states)

firms_years <- getCensus(name = "timeseries/bds/firms",
	vars = c("firms", "emp"),
	region = "state:01",
	time = "from 1977 to 2014")
head(firms_years)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
cbp_2016 <- getCensus(name = "cbp",
 vintage = 2016,
 vars = c("EMP", "ESTAB", "NAICS2012_TTL", "GEO_TTL"),
 region = "state:*",
 naics2012 = "23")
 head(cbp_2016)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
zbp_2016 <- getCensus(name = "zbp",
 vintage = 2016,
 vars = c("GEO_TTL", "EMP"),
 region = "zipcode:90210")
head(zbp_2016)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
nonemp <- getCensus(name = "nonemp",
 vintage = 2016,
 vars = c("GEO_TTL", "NRCPTOT", "NAICS2012_TTL"),
 region = "state:*",
 naics2012 = "54")
head(nonemp)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
data2010 <- getCensus(name = "dec/sf1",
	vintage = 2010,
	vars = c("NAME", "P001001", "H010001"), 
	region = "metropolitan statistical area/micropolitan statistical area:*")
head(data2010)

data2000 <- getCensus(name = "sf1",
	vintage = 2000,
	vars = "P001001", 
	region = "block:*",
	regionin = "state:36+county:027+tract:010000")
head(data2000)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
ewks_2012 <- getCensus(name = "ewks",
	vintage = 2012,
	vars = c("EMP", "OPTAX", "GEOTYPE"),
	region = "state:*",
	naics2012 = "54")
head(ewks_2012)
ewks_2007 <- getCensus(name = "ewks",
	vintage = 2007,
	vars = c("EMP", "OPTAX", "GEOTYPE"),
	region = "state:*",
	naics2007 = "54")
head(ewks_2007)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
eits <- getCensus(name = "timeseries/eits/resconst",
	vars = c("cell_value", "data_type_code", "time_slot_id", "error_data", "category_code", "seasonally_adj"),
	region = "us:*",
	time = "from 2004-05 to 2012-12")
head(eits)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
sahie <- getCensus(name = "timeseries/healthins/sahie",
	vars = c("NAME", "IPRCAT", "IPR_DESC", "PCTUI_PT"),
	region = "state:1",
	time = 2015)
head(sahie)

sahie_annual <- getCensus(name = "timeseries/healthins/sahie",
	vars = c("NAME", "PCTUI_PT"),
	region = "state:1",
	time = "from 2006 to 2016")
sahie_annual

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
popest <- getCensus(name = "pep/population",
	vintage = 2016,
	vars = c("POP", "GEONAME", "DATE_DESC"),
	region = "state:*",
	date = "9")
head(popest)

popest_housing <- getCensus(name = "pep/housing",
	vintage = 2016,
	vars = c("DATE", "DATE_DESC", "GEONAME", "HUEST"),
	region = "county:195",
	regionin = "state:2")
head(popest_housing)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
popproj <- getCensus(name = "pep/projagegroups",
	vintage = 2014,
	vars = c("YEAR", "POP"),
	region = "us:1")
head(popproj)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
saipe <- getCensus(name = "timeseries/poverty/saipe",
	vars = c("NAME", "SAEPOVRT0_17_PT", "SAEPOVRTALL_PT"),
	region = "state:*",
	time = 2016)
head(saipe)

saipe_years <- getCensus(name = "timeseries/poverty/saipe",
	vars = c("NAME", "SAEPOVRT0_17_PT", "SAEPOVRTALL_PT"),
	region = "county:001",
	regionin = "state:12",
	time = "from 2000 to 2016")
head(saipe_years)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
qwi_counties <- getCensus(name = "timeseries/qwi/sa",
	vars = c("Emp", "EarnBeg"),
	region = "county:*",
	regionin = "state:01",
	time = "2016-Q1")
head(qwi_counties)

qwi_time <- getCensus(name = "timeseries/qwi/sa",
	vars = c("Emp", "EarnBeg"),
	region = "state:01",
	time = "from 2007 to 2017")
head(qwi_time)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
sbo <- getCensus(name = "sbo",
	vintage = 2012,
	vars = c("GEO_TTL", "RCPSZFI", "RCPSZFI_TTL", "FIRMPDEMP"),
	region = "state:*")
head(sbo)

sbo_groups <- getCensus(name = "sbo",
	vintage = 2012,
	vars = c("GEO_TTL", "RACE_GROUP", "RACE_GROUP_TTL", "FIRMPDEMP"),
	region = "county:*",
	regionin = "state:09")
head(sbo_groups)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
pdb <- getCensus(name = "pdb/blockgroup",
	vintage = 2016,
	vars = c("County_name", "State_name", "GIDBG", "Tot_Population_CEN_2010", "Mail_Return_Rate_CEN_2010"),
	region = "block group:*",
	regionin = "state:01+county:001")
head(pdb)

