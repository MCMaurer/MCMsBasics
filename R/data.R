#' Fuel economy data for cars from 1984-2020
#'
#' A dataset containing information on various aspects of fuel economy for cars from 1984 to 2020. Data have been cleaned to include more explicit NAs, where in the original data missing values were sometimes denoted by -1 or 0.
#'
#' Produced via:
#' library(tidyverse)
#' cars_mpg <- read_csv("https://www.fueleconomy.gov/feg/epadata/vehicles.csv") %>%
#' mutate(across(where(is.numeric), ~ifelse(.x == 0 | .x == -1, NA, .x)))
#' save(cars_mpg, file = "data/cars_mpg.rda")
#'
#' @format A data frame with 43,221 rows and 83 variables:
#' \describe{
#' \item{barrels08}{annual petroleum consumption in barrels for fuelType1 (1)}
#' \item{barrelsA08}{annual petroleum consumption in barrels for fuelType2 (1)}
#' \item{charge120}{time to charge an electric vehicle in hours at 120 V}
#' \item{charge240}{time to charge an electric vehicle in hours at 240 V}
#' \item{city08}{city MPG for fuelType1 (2), (11)}
#' \item{city08U}{unrounded city MPG for fuelType1 (2), (3)}
#' \item{cityA08}{city MPG for fuelType2 (2)}
#' \item{cityA08U}{unrounded city MPG for fuelType2 (2), (3)}
#' \item{cityCD}{city gasoline consumption (gallons/100 miles) in charge depleting mode (4)}
#' \item{cityE}{city electricity consumption in kw-hrs/100 miles}
#' \item{cityUF}{EPA city utility factor (share of electricity) for PHEV}
#' \item{co2}{tailpipe CO2 in grams/mile for fuelType1 (5)}
#' \item{co2A}{tailpipe CO2 in grams/mile for fuelType2 (5)}
#' \item{co2TailpipeAGpm}{tailpipe CO2 in grams/mile for fuelType2 (5)}
#' \item{co2TailpipeGpm}{tailpipe CO2 in grams/mile for fuelType1 (5)}
#' \item{comb08}{combined MPG for fuelType1 (2), (11)}
#' \item{comb08U}{unrounded combined MPG for fuelType1 (2), (3)}
#' \item{combA08}{combined MPG for fuelType2 (2)}
#' \item{combA08U}{unrounded combined MPG for fuelType2 (2), (3)}
#' \item{combE}{combined electricity consumption in kw-hrs/100 miles}
#' \item{combinedCD}{combined gasoline consumption (gallons/100 miles) in charge depleting mode (4)}
#' \item{combinedUF}{EPA combined utility factor (share of electricity) for PHEV}
#' \item{cylinders}{engine cylinders}
#' \item{displ}{engine displacement in liters}
#' \item{engId}{EPA model type index}
#' \item{eng_dscr}{engine descriptor; see http://www.fueleconomy.gov/feg/findacarhelp.shtml#engine}
#' \item{evMotor}{electric motor (kw-hrs)}
#' \item{feScore}{EPA Fuel Economy Score (-1 = Not available)}
#' \item{fuelCost08}{annual fuel cost for fuelType1 ($) (7)}
#' \item{fuelCostA08}{annual fuel cost for fuelType2 ($) (7)}
#' \item{fuelType}{fuel type with fuelType1 and fuelType2 (if applicable)}
#' \item{fuelType1}{fuel type 1. For single fuel vehicles, this will be the only fuel. For dual fuel vehicles, this will be the conventional fuel.}
#' \item{fuelType2}{fuel type 2. For dual fuel vehicles, this will be the alternative fuel (e.g. E85, Electricity, CNG, LPG). For single fuel vehicles, this field is not used}
#' \item{ghgScore}{EPA GHG score (-1 = Not available)}
#' \item{ghgScoreA}{EPA GHG score for dual fuel vehicle running on the alternative fuel (-1 = Not available)}
#' \item{guzzler}{if G or T, this vehicle is subject to the gas guzzler tax}
#' \item{highway08}{highway MPG for fuelType1 (2), (11)}
#' \item{highway08U}{unrounded highway MPG for fuelType1 (2), (3)}
#' \item{highwayA08}{highway MPG for fuelType2 (2)}
#' \item{highwayA08U}{unrounded highway MPG for fuelType2 (2),(3)}
#' \item{highwayCD}{highway gasoline consumption (gallons/100miles) in charge depleting mode (4)}
#' \item{highwayE}{highway electricity consumption in kw-hrs/100 miles}
#' \item{highwayUF}{EPA highway utility factor (share of electricity) for PHEV}
#' \item{hlv}{hatchback luggage volume (cubic feet) (8)}
#' \item{hpv}{hatchback passenger volume (cubic feet) (8)}
#' \item{id}{vehicle record id}
#' \item{lv2}{2 door luggage volume (cubic feet) (8)}
#' \item{lv4}{4 door luggage volume (cubic feet) (8)}
#' \item{make}{manufacturer (division)}
#' \item{mfrCode}{3-character manufacturer code}
#' \item{model}{model name (carline)}
#' \item{mpgData}{has My MPG data; see yourMpgVehicle and yourMpgDriverVehicle}
#' \item{phevBlended}{if true, this vehicle operates on a blend of gasoline and electricity in charge depleting mode}
#' \item{pv2}{2-door passenger volume (cubic feet) (8)}
#' \item{pv4}{4-door passenger volume (cubic feet) (8)}
#' \item{rangeA}{EPA range for fuelType2}
#' \item{rangeCityA}{EPA city range for fuelType2}
#' \item{rangeHwyA}{EPA highway range for fuelType2}
#' \item{trans_dscr}{transmission descriptor; see http://www.fueleconomy.gov/feg/findacarhelp.shtml#trany}
#' \item{trany}{transmission}
#' \item{UCity}{unadjusted city MPG for fuelType1; see the description of the EPA test procedures}
#' \item{UCityA}{unadjusted city MPG for fuelType2; see the description of the EPA test procedures}
#' \item{UHighway}{unadjusted highway MPG for fuelType1; see the description of the EPA test procedures}
#' \item{UHighwayA}{unadjusted highway MPG for fuelType2; see the description of the EPA test procedures}
#' \item{VClass}{EPA vehicle size class}
#' \item{year}{model year}
#' \item{youSaveSpend}{you save/spend over 5 years compared to an average car ($). Savings are positive; a greater amount spent yields a negative number. For dual fuel vehicles, this is the cost savings for gasoline}
#' \item{sCharger}{if S, this vehicle is supercharged}
#' \item{tCharger}{if T, this vehicle is turbocharged}
#' \item{c240Dscr}{electric vehicle charger description}
#' \item{charge240b}{time to charge an electric vehicle in hours at 240 V using the alternate charger}
#' \item{c240bDscr}{electric vehicle alternate charger description}
#' \item{createdOn}{date the vehicle record was created (ISO 8601 format)}
#' \item{modifiedOn}{date the vehicle record was last modified (ISO 8601 format)}
#' \item{startStop}{vehicle has start-stop technology (Y, N, or blank for older vehicles)}
#' \item{phevCity}{EPA composite gasoline-electricity city MPGe for plug-in hybrid vehicles}
#' \item{phevHwy}{EPA composite gasoline-electricity highway MPGe for plug-in hybrid vehicles}
#' \item{phevComb}{EPA composite gasoline-electricity combined city-highway MPGe for plug-in hybrid vehicles}
#' }
#' @source \url{https://www.fueleconomy.gov/feg/ws/index.shtml}
#' @details {}
"cars_mpg"

