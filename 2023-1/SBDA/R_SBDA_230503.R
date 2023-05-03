setwd("C:/R_SDA")
install.packages("readxl")
library(readxl)

library(readxl)
Data_Midterm <- read_excel("Data_Midterm.xlsx")
View(Data_Midterm)

attach(Data_Midterm)
head(Data_Midterm)

is.na(Data_Midterm $ Total)

class(Data_Midterm $ Total)
typeof(Data_Midterm $ Total)

Data_Midterm $ Enter2 <- as.numeric(Data_Midterm $ Enter)
Data_Midterm $ Grade <- cut(Total, breaks = c(0, 20, 50, 70, 100), labels = c("D", "C", "B", "A"))

Data_Midterm $ BC <- B + C
Data_Midterm $ E2 <- ifelse(Data_Midterm $ Enter2 < 2020, 0, 1)

# B_1
table(Data_Midterm $ Grade)

# B_3
pie(table(Data_Midterm $ Grade))

# B_2
barplot(table(Data_Midterm $ Grade))

# B_4
df <- data.frame(A, B, C, Total)
summary(df)

# B_5
par(mfrow = c(2, 2))
hist(Total); hist(A)
hist(B); hist(C)
barplot(table(Data_Midterm $ Grade), horiz=T)

# B_6
intervals <- seq(0, 100, 20)
value.cut <- cut(Total, breaks = intervals, right = T)
head(value.cut)
table(value.cut)

par(mfrow = c(1, 1))
hist(table(value.cut))
hist(Total, breaks = intervals, right = T)
barplot(table(value.cut))

# C_1
boxplot(Total ~ Enter)

# C_2
aggregate(Total, by = list(Enter), FUN = mean)
aggregate(Total ~ Enter, data = Data_Midterm, FUN = mean)

# C_3, 4
mytable <- table(Grade, Enter)
barplot(mytable)
barplot(mytable, legend = rownames(mytable))

install.packages("tidyverse")
library(tidyverse)

install.packages("RColorBrewer")
library(RColorBrewer)

display.brewer.all()
par(mar = c(3, 4, 2, 2))
display.brewer.all()

barplot(mytable, col = brewer.pal(4, "Blues"), 
        legend = rownames(mytable))

prop.table(table(Grade, Enter), margin = 2)

mytable_p <- prop.table(table(Grade, Enter), margin = 2)
barplot(mytable_p, legend = rownames(mytable)) 
barplot(mytable_p, col = brewer.pal(4, "Blues"),
        legend = rownames(mytable)) 

# C_6
cor(Data_Midterm[3:6]) # 피어슨 상관계수

par(mfrow = c(2, 3))
plot(Total ~ A)
plot(Total ~ B)
plot(Total ~ C)

par(mfrow = c(1, 1))
plot(B ~ A)
plot(B ~ A, type = "n")

symbols(B ~ A, circles = C)
symbols(B ~ A, circles = C, inches = 0.5)
symbols(B ~ A, circles = C, inches = 0.5, bg = "skyblue")

symbols(B ~ A, circles = C, inches = 0.5, 
        bg = "skyblue", main = "A Sample of Bubble Plot",
        ylab = "B score")

