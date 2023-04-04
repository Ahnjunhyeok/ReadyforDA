# 230404 경영프로그래밍

# 4. save() 함수와 load() 함수

x <- c(1, 2, 3)
y <- c(4, 5, 6)

save(x, y, file = "save.Rdata")

rm(list = ls())

load("save.Rdata")

# 사용 중인 변수를 모두 저장하려면 list = ls() 구문을 응용한다. 

install.packages("writexl")
library(writexl)

str(iris)

write_xlsx(iris, "iris.xlsx")

library(readxl)

y <- read_xlsx("iris.xlsx")

str(iris) # iris의 데이터 구조를 출력

str(y) # factor형에서 character로 변경됨.

head(y)

head(iris)

head(y, 14); head(iris, 15)

tail(y); tail(iris)

tail(y, 12); tail(iris, 20)
