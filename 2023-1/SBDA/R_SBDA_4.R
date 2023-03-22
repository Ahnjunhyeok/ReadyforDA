# 230322 3주차 2차시

# R 프로그램(3) : 연산, 함수 및 제어

# 1. 연산자(Operators)
  # Assign          : <-, ->, =
  # Or              : |
  # And             : &
  # Addition        : +
  # Substraction    : -
  # Multiplication  : *
  # Division        : /
  # Exponent        : **, ^
  # Integer division: %/%
  # Remainder       : %%
  # Less            : <
  # Greater         : >
  # Less or =       : <=
  # Greater or =    : >=
  # Not             : !
  # Is equal        : ==
  # Not Equal       : !=


  # 1) 할당 연산자

  x <- 1
  y = 2
  3 -> z

  # 2) 산술 연산자
  
  9 + 2
  9 - 2
  9 * 2
  9 / 2
  9 ** 2
  9 ^ 2
  9 %/% 2
  9 %% 2

  # 3) 논리 연산자
  a <- TRUE
  b <- FALSE
  
  a & b
  
  a | b
  
  !a & b
  
  !a | b
  
  a & !b
  
  a | !b
  
  # 4) 비교 연산자
  
  9 < 2
  9 > 2    
  9 <= 2
  9 >= 2  
  9 == 2  
  9 != 2  
  !(9 == 2)  
  
# 2. 함수(function)
  # 함수는 연산의 패키지로 연속적으로 수행되는 일련의 코드 집합을 의미.
  # R은 다양한 내장(built-in) 함수를 제공하며, 사용자가 직접 만드는 사용자 정의 함수를 만들 수도 있음.
  
  # 1) 기초적인 수학적 & 통계학적 계산 가능
  
  log(100) # 자연로그
  
  log10(100)  # 상용로그
  
  floor(3.14) # 버림  
  
  ceiling(5.87) # 올림  
  
  round(4.65) # 반올림
  
  sqrt(9) # 제곱근
  
  min(c(1, 5, 7)) # 최솟값
  
  max(c(2, 6, 9)) # 최댓값
  
  mean(c(3, 6, 9)) # 평균
  
  sd(c(1, 2, 3, 4)) # 표준편차  
  
  f <- function(x) 3*x^2 - 5*x + 1
  
  integrate(f, 0, 5) # 정적분
  
  plot(function(x){3*x^2 - 5*x + 1}, xlim = range(-10, 10)) # 그래프 그리기
  
  
  # 2) 사용자 정의 함수
    # 더하기 함수 만들기
  
  add <- function(a, b)
  {result <- a + b
    return(result)
  }

  add(1, 2)    
  
  add2 <- function(a, b) {result <- a + b; return(result)}
  add2(1, 2)

  # 주사위 던지기(복원추출); 실험을 통해 표본크기에 따라 분포에 차이가 있는지 비교 분석하고자 함.
  D <- sample(1:6, 10, replace = T) # 주사위 10회 던지기(복원추출)
  barplot(table(D))  

  Dice <- function(n) {sample(1:6, n, replace = T)} # 주사위 n회 던지기 함수(복원추출)   
  D30 <- Dice(30) # 주사위 던지기 10회  
  D50 <- Dice(50) # 주사위 던지기 30회 
  D500 <- Dice(500) # 주사위 던지기 100회
  D1000 <- Dice(1000) # 주사위 던지기 1000회

  # 주사위 던지기 결과를 그래프로 시각화
  par(mfrow = c(2, 2)) # 그래프를 2개의 행, 2개의 열 형태로 배열
  
  barplot(table(D30)); barplot(table(D50))
  barplot(table(D500)); barplot(table(D1000))

# 3. 데이터셋을 활용한 함수(Functions) 연습
  
  # mtcars 데이터셋을 이용한 함수 연습
  str(mtcars)
  attach(mtcars) # mtcars 데이터셋을 고정시켜 사용(데이터셋 이름 $ 변수명 => 변수명만으로 사용)
  dim(mtcars)  
  help("mtcars")
  
  table(am)  # 질적자료의 빈도표 및 그래프
  table(cyl)  
  pie(table(cyl))  
  
  summary(mpg) # 양적자료의 요약통계량 및 그래프
  hist(mpg)    
  boxplot(mpg)  
  
  aggregate(x = mpg, by = list(am), FUN = mean)  # 그룹별 평균 비교(2 groups), # aggregate에서는 반드시 리스트 사용!
  boxplot(mpg~am)  
  t.test(mpg~am)  
  
  aggregate(x=mpg, by=list(cyl), FUN = mean) # 그룹별 평균 비교(3 groups)    
  boxplot(mpg~cyl)  
  m <- aov(mpg~cyl)  
  summary(m)  
  
  plot(wt, mpg)          # 양적자료 간의 관계  
  cor.test(mpg, wt)
  lm(mpg ~ wt)  
  m <- lm(mpg~wt)  
  summary(m)  
  abline(m)  
  
  