# 230411 데이터 살펴보기

setwd("C:/R_BP")

install.packages("tidyverse")
library(tidyverse)

dim(iris) # 차원을 셈, iris는 150행 5열

dim(iris)[1]

dim(iris)[2]

nrow(iris) # 행 개수를 셈 

ncol(iris) # 열 개수를 셈

length(iris)  # 데이터 길이 세기, 데이터프레임에서는 열의 길이를 셈, 벡터도 사용가능

length(c(1:9))

# 리스트도 가능하다. 

test <- list()

test[[1]] <- c(1:8)
test[[2]] <- c("a", "b","c", "d")
test[[3]] <- c(1:10)
test[[4]] <- c(1:3)

length(test) # index가 4개이기 때문에 길이가 4

test[[5]] <- "a"

length(test[[2]]) # 객체에 담은 벡터 길이 확인방법

ls() # 변수 목록 확인하기

test2 <- iris

object.size(test2)

x <- c(1:8, NA, 10)
x

is.na(x)

is.null(x)

is.numeric(x)

is.character(x)

is.logical(x)

is.factor(x)

is.data.frame(x)

