# 230516 경영프로그래밍

setwd("C:/R_BP")
install.packages("tidyverse")
library(tidyverse)

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
# 횟수 제어 반복문

for (i in 10:15) {
  print(i)
}


sum <- 0  # 초기 변수값 지정

for (i in seq(1, 5, by = 1)) {   # seq(): 순차 값을 생성하는 함수
  sum <- sum + i
}

sum

# (1.1) for문 추가 예시------ 

df_rm <- data.frame()

for (line in 1:50) {
  
  df_rm <- rbind(iris[line, ], df_rm)
  
}

View(df_rm)

# (2) while문----------
# 조건 제어 반복문

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
    next          # i가 2이면 while문 처음으로 돌아감
  }
  
  print(i)
}

# 무한루프 반복문(while)----

while(TRUE) {
  print("집가고 싶다")
}

# (3) repeat문----------
# 단순 반복

i <- 1

repeat {
  print(i)
  if (i >= 5) {
    break         # 5보다 크거나 같으면 멈춤
  }
  
  i <- i + 1

}

x <- c(0:5)
y <- 2

ifelse(x == 0, 0, ifelse(x %% y == 0, "Even Number", "Odd Number"))

# 구구단 만들기-------

for (x in 2:9) {
  cat("--", x, "단---", "\n")        
  for (y in 1:9) {                     
    cat(x, "*", y, "=", x * y, "\n") 
    }                                 
}                                    
