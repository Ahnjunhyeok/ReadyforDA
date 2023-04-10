# 230411 비즈니스어낼리틱스 예습

setwd("C:/R_BA")

# 1. 무조건 분기

# 조건이 만족되는 경우에만 분기를 실행하는 조건 분기와 달리, 
# 무조건 분기는 프로그램 상의 조건이나 상태와는 관계없이 분기를 실행한다. 
# 무조건 분기에 사용되는 명령문은 크게 "break 명령문"과 "next 명령문"으로 구분된다. 
# break 명령문은 루프에 의한 프로그램의 순환을 중간에 강제로 종료하는 기능을 수행하며, 
# next 명령문은 하나의 루프를 실행하는 과정에서 특정 실행문을 건너뛰고 처음으로 분기하여 실행을 계속한다. 

# break 명령문
# break 명령문은 repeat에 의한 루프를 탈출하는 데 사용되는 유일한 명령문이기도 하며, 
# 프로그램이 순차적으로 진행되는 과정에서 break 명령문을 만나면 프로그램은 종료된다. 
# break 명령문은 주로 일정한 조건과 함께 사용되는 경우가 대부분인데,
# 만약 어떠한 조건도 없이 단독으로 사용된다면 채 1회 반복이 끝나기도 전에 루핑이 종료될 것이기 때문이다. 

x <- 0
repeat {                              
  cat("collect an apple 5 times\n")   # 실행문 입력
  x <- x + 1                          # x는 1씩 증가
  if (x == 5) break                   # 5회 반복 후 탈출
}


# next 명령문
# 이번에는 하나의 루프를 수행하는 과정에서 특정 실행문을 건너뛰고 처음으로 분기하여 반복을 계속하는 next 명령문을 살펴보자. 
# next 명령문 역시 break 명령문과 마찬가지로 대개 특정한 조건과 함께 사용되는 것이 일반적이다.
# 또한 실행문이 순차적으로 진행되는 과정에서 next 명령문을 만나면 해당 실행문의 실행을 중지하고 처음 실행문으로 흐름이 변경되어 반복이 계속된다. 

P <- c(150, 100, 80, 90, 120)
Q <- c(3, 4, 5, 7, 2)

value <- 0

for (i in 1:5) {                                   # for 명령문 시작
  if (i %% 2 == 0) next                            # i가 2의 배수이면 next
  value <- value + (P[i] * Q[i])                   # 실행문 1
  cat("P", i, "*", "Q", i, "=", P[i] * Q[i], "\n",
      "cumsum =", value, "\n")                     # 실행문 2
}                                                  # for 명령문 종료

value                                              # 결과 확인


# 2. 함수
# 함수란 목적에 맞게 나열된 연산 과정들의 작은 집합체다. 
# 연산의 흐름을 통제하는 흐름통제 명령어를 배움으로써 하나의 함수를 정의할 수 있는 기초가 마련되었다. 

# 사용자 정의 함수를 통해 내장함수와 마찬가지로 R 내에서 필요할 때마다 다시 사용될 수 있기 때문에 복잡한 프로그램을 보다 효율적으로 작성할 수 있다. 
# 또한 정의된 함수가 이항 연산의 기능을 가지고 있다면 함수의 내용을 이항 연산자의 형태로 만들어 보다 편리하게 사용할 수도 있을 것이다. 
# 먼저 함수의 형태를 살펴보자.

# 1) 함수의 형태
# name <- function(argument_1, ... , argument_k) {body}
# 이름, function, 인수(argument), 몸체(body)의 네 부분으로 구성되어 있다.

# 2) 함수의 정의
# 앞서 설명했듯이 함수의 이름과 함수 호출 명령어, 인수, 몸체와 같은 구성요소들이 결합하여 하나의 사용자 정의 함수를 구성하게 된다. 

# 2-1) 함수의 인수가 하나인 경우

x <- c(10, 15, 30, 55, 70)
my.sd <- function(x) sqrt(sum((x - mean(x)) ^ 2) / (length(x) - 1))
my.sd(x)                        # 새롭게 정의된 함수로 연산한 결과 반환
sd(x)                           # 내장 함수를 사용하여 연산한 결과 반환

# 위의 경우는 내장함수와 결과가 동일함.

inc.tax <- function(x) {        # 함수 이름 <- 함수 호출 명령어(인수)
  if (x > 30000)                # 함수 몸체 입력
    9010 + ((x - 30000) * 0.38) else if (x > 8800)
    1590 + ((x - 8800)  * 0.35) else if (x > 4600)
    582  + ((x - 4600)  * 0.24) else if (x > 1200)
    72   + ((x - 1200)  * 0.15) else
    x * 0.06
}                               # 함수 몸체 종료

inc.tax(12000)                  # 과세표준이 1억 2천만 원일 경우의 소득세
inc.tax(5000)                   # 과세표준이 5천만 원일 경우의 소득세

# 2-2) 함수의 인수가 여러 개인 경우

compare <- function(x, y) {          # 함수 선언
  if (x > y)                         # body 입력 시작
    cat(x, "is bigger than", y) else
      cat(y, "is bigger than", x)
}                                    # body 입력 종료

compare(10, 20)

# 사용자 정의 함수 응용 실습

fun1 <- function(x) {
  y <- x ^ 2
  return(y)
}

fun1(3)

fun2 <- function(x, y) {
  z <- x * y
  return(z)
}

fun2(4, 5)

fun3 <- function(a) {
  if (a < 0) {
    return(-a)
       }
  else {
    return(a)
       }
  }

fun3(-2); fun3(2)

fun4 <- function(a) {
  if (a > 0) {
    x <- -a-a
    return(x) 
       }
  else {
    x <- a + a
    return(x)
       }
  }

fun4(1)
fun4(4)
fun4(-2)

fun5 <- function(x, y) {
  if ((x > 1) && (y > 1)) {
    z <- x * y
    return(z)
       }
  else {
    z <- x + y
    return(z)
       }
  }

fun5(2, 4)
fun5(1, 3)

fun6 <- function(a) {
  if (a < 0) return(0)
  else if (a >= 1 && a < 6) return(1)
  else return(10)
  }

fun6(-2)
fun6(5)
fun6(10)

fun7 <- function(a) {
  for (i in 1:5) {
    a <- a + i
    }
  return(a)
  }

fun7(5)

fun8 <- function(n) {
  i <- 0
  for (j in 1:n) {
    i <- i + j
    }
  return(i)
  }

fun8(11)
