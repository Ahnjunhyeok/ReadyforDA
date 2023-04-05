# 230405 비즈니스어낼리틱스

setwd("C:/R_BA")

# R 프로그래밍 로직과 함수 정의하기

# 조건 분기

# if 명령믄, if ... else 명령문, ifelse() 함수, 그리고 switch() 함수

x <- 3
y <- c(-1, 0, 1)

if (x < 2) x + 2

if (x >= 2) x + 2

y <- c(-1, 0, 1)

if (y > 0) y + 1  # 에러 발생

if (any (y > 0)) y + 1

if (all (y > 0)) y + 1

if (x > 1 | y > 2) x + 2 # 에러 발생

if (x > 1 || y > 2) x + 2

if (x > 1 & y > 2) x + 2

if (x > 1 && y > 2) x + 2


x <- 3
y <- c(-1, 0, 1)

if (x == 3 && y == -1) {
  x <- x^3
  y <- y * y
  cat("there are two statements in braces")
}

x
y

if (x > 2) {
  x <- x / 3
  if (x == 9) x - 6
}

x # x - 6을 객체에 저장하지 않았기 때문에 9로 출력

x <- -15
y <- 50

if (x > y)
  cat("x is bigger than y") else
  cat("y is bigger than x")

if (x > y) {
  cat("x is bigger than x\n")
    if (x %% 2 == 0)
      cat("x is even number") else
      cat("x is odd numbe")
} else {
    cat("y is bigger than x\n")
      if (y %% 2 == 0)
        cat("y is even number") else
        cat("y is odd number")
}

x <- exp(1) 

ifelse(x > 0, yes = x, no = log(x))
ifelse(x < 0, yes = x, no = log(x))

log(exp(1)) # log와 exp 간의 관계 인지하기

y <- -10

ifelse(y > 0, y, -y)

x <- c(1, 2, 3, 4, 5)
y <- c(-2, -1, 0, 6, 7)

x > y

ifelse(x > y, x, y)

x;y

x %% 2 == 0
y %% 2 == 0

ifelse(x %% 2 == 0, x, ifelse(y %% 2 == 0, y, 0)) # 중첩 ifelse

# switch() 함수

x <- 1:10
switch(2, mean(x), sum(x), var(x), sd(x))
switch (x[4], mean(x), sum(x), var(x), sd(x))

method <- "my.iqr"
switch(method,
       my.range = diff(range(x)),
       my.mad = sum(abs(x - mean(x))) / length(x),
       ) # pdf 38페이지, 미완

start <- 0
x <- 1

repeat {
  start <- start + x
  if (x >= 10) break
  x <- x + 1
} 

start


# for 문

P <- c(150, 100, 80, 90, 120)
Q <- c(3, 4, 5, 7, 2)

value <- 0

for (i in 1:5) {
  value <- value + (P[i] * Q[i])
  cat("P", i, "*", "Q", i, "=", P[i] * Q[i], "\n",
      "cumsum=", value, "\n")
}

value # 누적 합이 저장

x <- 1

while (x <= 5) {
  cat("collect an apple 5 times\n")
  x <- x + 1
}

start <- 0
x <- 1

while (x <= 10) {
  start <- start + x
  x <- x + 1
}

x

start


x <- 5
y <- 1

while (y <= 9) {
  cat(x, "*", y, "=", x * y, "\n")
  x <- x
  y <- y + 1
}

# 구구단 1단부터 9단까지 만들기

for (x in 1:9) {
  for (y in 1:9) {
    cat(x, "*", y, "=", "x * y", "\n")
  }
}

x <- 1
y <- 1

while (x <= 9) {
  while (y <= 9) {
    cat(x, "*", y, "=", "x * y", "\n")
    x <- x
    y <- y + 1}
  x <- x + 1
  y <- 1
}
