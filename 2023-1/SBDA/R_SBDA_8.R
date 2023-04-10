setwd("C:/R_SBDA")
install.packages("tidyverse")
library(tidyverse)

install.packages("writexl")
library(writexl)
library(readxl)

X <- read_excel("ba_ch03_data.xlsx")

str(X)
summary(X)

