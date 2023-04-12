setwd("C:/R_SBDA")

library(readxl)
GVdata <- read_excel("ba_ch03_data.xlsx", 
                     sheet = "Growth_Value")
View(GVdata)
attach(GVdata)

rf <- 2
(mean(Growth) - rf) / sd(Growth) # 샤프지수 구하기

(mean(Value) - rf) / sd(Value)

Sharp_Growth <- (mean(Growth) - rf) / sd(Growth)

Sharp_Value <- (mean(Value) - rf) / sd(Value)

install.packages("tidyverse")
install.packages("moments") # 왜도계수 구하기 위한 패키지 설치
library(moments)

skewness(Growth) # 왜도계수, 양의 비대칭
skewness(Value) # 음의 비대칭

kurtosis(Growth) # 첨도계수
kurtosis(Value)

kurtosis(Growth) - 3 # 정규분포와 첨도기준을 0으로
kurtosis(Value) -3

cov(GVdata) # 상관계수

cor(GVdata)

boxplot(Growth, Value)

boxplot(Growth, Value, horizontal = TRUE)

boxplot(Growth, Value, horizontal = TRUE, names = c("Growth", "Value"))

outlier_Growth <- boxplot(Growth) $ out
outlier_Growth

outlier_Value <- boxplot(Value) $ out
outlier_Value


# 결측치 처리, outlier 값 없애기
GVdata $ newGrowth <- ifelse(Growth %in% outlier_Growth, NA, Growth)

boxplot(GVdata $ newGrowth)
summary(c(Growth, GVdata $ newGrowth))

summary(GVdata)

GVdata $ newValue <- ifelse(Value %in% outlier_Value, NA, Value)
boxplot(GVdata $ newGrowth, GVdata $ newValue, horizontal = TRUE)

(-40.90 - mean(Growth)) / sd(Growth)
(-46.52 - mean(Value)) / sd(Value)

str(mtcars)
attach(mtcars)

table(am)
table(cyl)

barplot(cyl)
barplot(table(cyl))

pie(table(cyl))
summary(mpg)

hist(mpg)
skewness(mpg)

boxplot(mpg)
boxplot(mpg, horizontal = TRUE)
aggregate(x = mpg, by = list(am), FUN = mean)

t.test(mpg ~ am)

aggregate(x = mpg, by = list(cyl), FUN = mean)
boxplot(mpg ~ cyl)

m <- aov(mpg ~ cyl)
summary(m)

plot(wt, mpg)
cor(wt, mpg)

cor.test(wt, mpg)
lm(mpg ~ wt)
