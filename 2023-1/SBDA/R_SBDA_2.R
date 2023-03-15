# 학습목표
# 1. R 프로그램에서 사용하는 다양한 자료형을 이해하고 확인할 수 있다.
# 2. 자료들의 집합인 데이터 구조 4유형을 구분하여 설명할 수 있고, 각 데이터 구조를 생성하여 변환할 수 있다.
# 3.R 프로그램으로 분석할 데이터셋을 생성하는 세 가지 방법을 이해하고, 
# 내장 데이터셋을 이용하여 흔히 사용되는 명령어를 활용할 수 있다.

# 230315 SBDA

# 0. Assignment operations: <- vs =
# R: 변수(객체)에 값 저장시 <- 사용(S 언어), 함수 안에서 인자 설정시 = 사용

rm(list=ls())
median(x = 1:10)
x # = 사용으로 인한 에러 발생

median(x <- 1:10)
x # <- 사용이 적절함

# 1. R 프로그램: 데이터 유형 및 검증
  # 숫자형(numeric): 
    # 더블형(double): 양적자료로써 소수점까지 표현되는 연속변수 /
    # 정수형(integer): 양적자료로써 소수점이 없는 이산변수
  # 문자형(character): 문자로 구성
  # 논리형(logical)  : TRUE, FALSE(참, 거짓) 형태
  # 팩터형(factor)   : 범주형 자료(순위형과 명목형)

# 1) 자료유형의 확인
x <- c(1.5, 3.7, 4.9) # 더블형 벡터
x
class(x) # 데이터 유형은 무엇인가?
typeof(x) # (물리적인) 데이터 유형은 무엇인가?
is.numeric(x) # 숫자형인지?
is.double(x) # 더블형 벡터인지?

y <- c(TRUE, FALSE, T, F) # 논리형 벡터
y
class(y) # 데이터 유형은 무엇인가?
typeof(y) # (물리적인) 데이터 유형은 무엇인가?
is.numeric(y) # 숫자형인지?
is.logical(y) # 논리형인지?

install.packages("ggplot2")
install.packages("dplyr")

# https://velog.io/@jerrykim91/R-R-%ED%8C%A8%ED%82%A4%EC%A7%80-%EC%A0%95%EB%A6%AC - R 패키지 정리

x <- 0:5
x <- as.character(x)
x <- as.numeric(x)

# as.logical: True or False로; 0: False, 0을 제외한 나머지 숫자: True

x <- as.logical(x)
x
# logical -> integer: True: 1, False: 0
x <- as.integer(x)
str(x)

# 문자에서 숫자 변환은 에러 발생
x <- c("M", "M", "F")
str(x)
x <- as.integer(x) # Warning message: NAs introduced by coercion
x <- as.numeric(x) # 결측값으로 바뀜
x <- as.logical(x) # 결측값으로 바뀜

# 2) 결측값(NA)과 미정값(NULL)
x1 <- 3
x2 <- NA
x1
x1 + x2
x1 > x2

sum(1, 2, NA)
sum(1, 2, NULL)

x <- NA
sum(1, 2, x)
sum(1, 2, x, na.rm=TRUE)
x[is.na(x)] <- 0
sum(1, 2, x)

# 3) 날짜형
Sys.time()
date1 <- as.Date("2023-03-01")
class(date1)
typeof(date1)
date2 <- as.Date("2022-03-01")
difftime(date1, date2)

# 3-1) 날짜 관련 패키지
install.packages("lubridate")
library("lubridate")
now()
date3 = now ( )
year(date3)
day(date3)

# 4) 데이터의 모양은 숫자인데, 실제로 데이터가 계산이 안되는 경우
  # 데이터의 유형을 확인하여 변경해야 함.

x <- c("100", "200", "500", "700", "250", "300", "400") # character
sum(x) # Error in sum(x) : invalid 'type' (character) of argument 발생
typeof(x)
is.numeric(x) # 숫자형인가?
x <- as.integer(x) # 데이터 유형 변환
sum(x)
mean(x)

# 2. R 프로그램: 데이터 구조 4유형
  # 벡터(vector): 최단순형 - 동일 자료형의 원소
  # 행렬(Matrix): 동일 자료형 2차원, 배열(Array): n차원
  # 리스트(list): 서로 다른 자료형의 원소 혼합
  # 데이터프레임(Dataframe): 혼합된 자료유형을 포함하는 2차원 표 형태의 구조
    # - 가장 흔히 사용하는 직사각형 변수형 * 측정값 형태

# 1) Vector
  # (1) 변수 만들기 기초
    a <- c(1, 2, 3, 4, 5, 6, 7) # 숫자형 vector
    b <- c("apple", "banana", "orange") # 문자형 vector
    c <- c(1:10) # 콜론을 사용하여, 1씩 증가하는 연속형 vector
    d <- seq(10, 15) # seq() 함수를 이용하여 만드는 sequence vector
    e <- seq(1, 10, by=2) # 2씩 증가하는 vector
    f <- rep(1, 10) # rep() 함수를 이용하여 특정 값(숫자, 문자 등) repeat
    