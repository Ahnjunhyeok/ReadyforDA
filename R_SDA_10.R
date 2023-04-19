setwd("C:/R_SDA")
install.packages("tidyverse")
library(tidyverse)

library(readxl)
dataset <- read_excel("ba_ch05_data.xlsx", 
                      sheet = "Prime")
View(dataset)

attach(dataset)

length(Expenditures)

t.test(Expenditures, mu = 1300)

t.test(Expenditures, mu = 1200)

t.test(Expenditures, alternative = "two.sided", mu = 1200)

library(readxl)
dataset_2 <- read_excel("ba_ch05_data.xlsx", 
                        sheet = "Study_Hours")
View(dataset_2)
attach(dataset_2)

t.test(Hours, mu = 24)
t.test(Hours, alternative = "less", mu = 24)

attach(mtcars)
table(am)
aggregate(mpg ~ am, data = mtcars, mean)

t.test(mpg ~ factor(am))

var.test(mpg ~ factor(am))

t.test(mpg ~ factor(am), var.equal = TRUE)

before <- c(88, 90, 80)
after <- c(80, 85, 85)

t.test(before, after, paired = TRUE)
