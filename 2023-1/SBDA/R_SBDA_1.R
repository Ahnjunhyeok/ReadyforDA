# R 프로그램 맛보기
# 프린트 내용정리
sqrt(x=4)
sqrt(x <- 4)

# 1. 상수: R as a calculator
1 + 2 + 3
log(10)
log2(32)
sqrt(16)
pi

# 2. 변수: 함수 사용
x <- pi * 2
x
(y <- pi * 100)
floor(x) # 내림
ceiling(x) # 올림
round(x) # 반올링(default digit=0)
round(x, 1) 
round(x, 3)
round(y, -2)

# 3.  변수의 유형
a <- 49 # 숫자(numeric)
sqrt(a)

b <- "The dog ate my homework." # 문자(character)
sub("dog", "cat", b)

c <- (1+1 == 3) # 논리형(logical or Boolean)
c

# 4. 예제: 기업의 광고비(X)가 매출액(Y)에 미치는 영향
x <- c(220,  210,  170,  285,  74,  54,  53,  15,  10,  9)
y <- c(2700, 2100, 1500, 1200, 660, 570, 480, 400, 250, 140)
plot(x, y) # 그래프 만들기(dot)
cor.test(x, y) # 상관분석
(m <- lm(y~x)) # 선형회귀분석
abline(m) # 1차함수 형태 선형그래프 만들기

# 기타
ls() # Working directory에 있는 객체 목록
rm(c) # Working directory에 있는 객체 c 삭제
# q() - R 종료

install.packages("ggplot2")

# 자료유형 : 날짜형
Sys.time()
data1 <- as.Date("2022-09-01")
data1

typeof(data1)
data2 <- as.Date(("2022-01-01"))
difftime(data1, data2)

# 자료유형 : 결측값(NA)과 미정값(NULL)
x1 <- 3
x2 <- NA

x1 + x2

x2 <- NULL
x1 + x2

# 자료유형 확인: typeof, class
