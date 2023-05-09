# 230509 경영프로그래밍

# 7장 데이터 그리기-------------------------------------

setwd("C:/R_BP")
install.packages("tidyverse")
library(tidyverse)

# pairs 함수
pairs( ~ Sepal.Width + Sepal.Length + Petal.Width +
      Petal.Length, data = iris, col = iris $ Species)

# hist() 함수

hist(iris $ Sepal.Width)

hist(iris $ Sepal.Width, freq = F)

# barplot() : 막대그래프 그리기

x <- aggregate(Petal.Length ~ Species, iris, mean)

barplot(x $ Petal.Length, names = x $ Species)

# pie() 함수: 파이 차트 그리기

x <- aggregate(Petal.Length ~ Species, iris, sum)
pie(x $ Petal.Length, labels = x $ Species)

# plot() 함수 O 옵션: 선 그래프 그리기

x <- tapply(iris $ Petal.Length, iris $ Petal.Width, mean)

x

plot(x, type = "o") # 선 그래프 옵션

# boxplot() 함수: 상자 그림 그리기

summary(iris $ Sepal.Width)

boxplot(iris $ Sepal.Width, horizontal = T)

boxplot(iris $ Sepal.Width)

par(mfrow = c(2, 2))

# 8장 조건문과 반복문-------------------------------------------

# 1) 조건문-------------

  # (1) if문-------

x <- 2

if(x == 2) {
      print("x is two")
  } else {
      print("x is not two")
}

x <- 0

if(x == 2) {
    print("x is two")
} else if (x == 0) {
    print("x is zero")
} else {
    print("x is not two")
}

  # (2) ifelse "함수"------

x <- c(1:5)

ifelse(x == 2, T, F)

# 2) 반복문-------------

  # (1) for문-----------

for (i in 1:5) {
    print(i)
}


sum <- 0

for (i in seq(1, 5, by = 1)) {
    sum <- sum + i
}

sum

  # (2) while문----------

i <- 1

while (i <= 5) {
    print(i)
    i <- i + 1
}

 # while 반복문에 next 예시 적용----

i <- 1

while (i <= 5) {
    i <- i + 1
    if (i == 2) {
        next      # i가 2이면 while문 처음으로 돌아감
    }
    print(i)
}

  # (3) repeat문----------

i <- 1

repeat {
    print(i)
    if (i >= 5) {
        break     # 5보다 크거나 같으면 멈춤
    }
    i <- i + 1
}

x <- c(0:5)
y <- 2

ifelse(x == 0, 0, ifelse(x %% y == 0, "Even Number", "Odd Number"))


