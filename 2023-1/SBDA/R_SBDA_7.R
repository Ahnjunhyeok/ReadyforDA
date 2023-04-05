# 230405 통계기반데이터분석

setwd("C:/R_SBDA")

install.packages("tidyverse")
library(tidyverse)

install.packages("readxl")
library(readxl)

x <- read_excel("C:/R_SBDA/ba_ch03_data.xlsx")

head(x, 15)

library(readxl)
promotion <- read_excel("C:\\R_SBDA\\ba_ch03_data.xlsx", 
                        sheet = "Promotion")
View(promotion)

attach(promotion)
mytable <- table(Location, Purchase)

mytable

prop.table(mytable)

barplot(mytable)

mytable2 <- table(Purchase, Location)

barplot(mytable2)

barplot(mytable2, legend = rownames(mytable2))

barplot(mytable2, legend = rownames(mytable2), col = c("blue", "red"))

library(readxl)
GVdata <- read_excel("ba_ch03_data.xlsx", 
                     sheet = "Growth_Value")
View(GVdata)

# 코드로 작성해도 되고, RStudio에서 data를 import해도 됨.

attach(GVdata)

plot(Value ~ Growth)
plot(Growth, Value)
plot(Value, Growth)
plot(Value ~ Growth, pch = 16)

plot(Value ~ Growth, pch = 16, col = "red")

library(readxl)
BL_data <- read_excel("ba_ch03_data.xlsx", 
                      sheet = "Birth_Life")
View(BL_data)

attach(BL_data)

plot(`Birth Rate` ~ `Life Exp`)
plot(`Birth Rate` ~ `Life Exp`)

plot(`Birth Rate` ~ `Life Exp`, pch = 16)
plot(`Birth Rate` ~ `Life Exp`, pch = 16, col = "red")
plot(`Birth Rate` ~ `Life Exp`, pch = 16, col = 
       ifelse(Development == "Developing", 20, 26))

plot(`Birth Rate` ~ `Life Exp`, pch = 16, col = ifelse(Development == "Developing", "blue", "red"))

legend("right", legend = c("Developing", "Developed"), pch = 16, col = c("blue", "red"))

plot(`Birth Rate` ~ `Life Exp`, pch = 16, col = ifelse(Development == "Developing", "blue", "red"), xlab = "Life Expectancy")

legend("right", legend = c("Developing", "Developed"), pch = 16, col = c("blue", "red"))

plot(`Birth Rate` ~ `Life Exp`, type = "n")

symbols(`Birth Rate` ~ `Life Exp`, circles = GNI)
symbols(`Birth Rate` ~ `Life Exp`, circles = GNI, inches = 0.5, bg = "blue")

plot(GVdata $ Growth ~ GVdata $ Year, type = "l", col = "blue")
lines(GVdata $ Value ~ GVdata $ Year, type = "l", col = "red")
legend("bottom", legend = c("Growth", "Value"), col = c("blue", "red"))

legend("bottom", legend = c("Growth", "Value"), col = c("blue", "red"), lty = 1)
legend("bottom", legend = c("Growth", "Value"), col = c("blue", "red"), lty = 1)

library(readxl)
Bookstores <- read_excel("ba_ch03_data.xlsx", 
                         sheet = "Bookstores")
View(Bookstores)

mytable <- table(Bookstores $ BookStore, Bookstores $ BookType)

mytable

rowSums(mytable)

colSums(mytable)

mytable.matrix <- as.matrix(mytable)

mytable.matrix

heatmap(mytable.matrix)

heatmap(mytable.matrix, scale = "none")

heatmap(mytable.matrix)
