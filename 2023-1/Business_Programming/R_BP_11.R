setwd("C:/R_BP")

install.packages("tidyverse")
library(tidyverse)

# 데이터 조작

# rbind() # 데이터 값을 행으로 취급하여 합침
# cbind() # 데이터 값을 열로 취급하여 합침
# subset() # 조건식으로 데이터를 추출

x <- c(1:5)
y <- c(6:10)

rbind(x, y) # x와 y를 행으로 합침

cbind(x, y) # x와 y를 열로 합침

df <- data.frame(name = c("a", "b"), score = c(80, 60)) # 데이터 프레임 생성

df

cbind(df, rank = c(1, 2)) # rank 열 추가

rbind(df, rank = c(1, 2))

split(iris, iris $ Species) # 팩터 열로 나누기, 반환값은 리스트 구조

Length_1 <-  subset(iris, Sepal.Length >= 7)

nrow(Length)

ncol(Length)

subset(iris, Sepal.Length >= 7 & Species == "virginica")

subset(iris, Sepal.Length >= 7 | Species == "virginica")

subset(iris, Sepal.Length >= 7, select = c("Sepal.Length", "Species"))

