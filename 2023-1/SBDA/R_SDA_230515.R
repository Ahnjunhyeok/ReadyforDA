# 230515 SDA--------

setwd("C:/R_SDA")

install.packages("readxl")
library(readxl)

mydata <- read_excel("ba_ch06_data.xlsx")

View(mydata_college)

str(mydata_college)
options(scipen = 999)

model <- lm(Earnings ~ Cost + Grad + Debt + City, data = mydata_college)

summary(model)

model

model1 <- lm(Earnings ~ Cost + Grad + City, data = mydata_college)
model1

summary(model1)

predict(model, data.frame(Cost = 25000, Grad = 60,
                          Debt = 80, City = 1))

predict(model1, data.frame(Cost = 25000, Grad = 60,
                           Debt = 80, City = 1))

library(readxl)
mydata_retail <- read_excel("ba_ch06_data.xlsx", 
                            sheet = "Retail")
View(mydata_retail)

mydata_retail $ d1 <- ifelse(mydata_retail $ Quarter == 1, 1, 0)
mydata_retail $ d2 <- ifelse(mydata_retail $ Quarter == 2, 1, 0)
mydata_retail $ d3 <- ifelse(mydata_retail $ Quarter == 3, 1, 0)

model2 <- lm(Sales ~ GNP + d1 + d2 + d3, data = mydata_retail)
summary(model2)

predict(model2, data.frame(GNP = 18000, d1 = 0,
                           d2 = 1, d3 = 0))

predict(model2, data.frame(GNP = 18000, d1 = 0,
                           d2 = 0, d3 = 0))

summary(model)

model3 <- lm(Earnings ~ Cost, data = mydata_college)
summary(model3)

model4 <- lm(Earnings ~ Cost + Grad + Debt, data = mydata_college)
summary(model4)

model5 <- lm(Earnings ~ Debt, data = mydata_college)
summary(model5)

cor.test(mydata_college $ Debt, mydata_college $ Grad)
