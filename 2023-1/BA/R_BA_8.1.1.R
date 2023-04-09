# 230405 비즈니스어낼리틱스

setwd("C:/Users/ahnjh/Desktop/R")

# R 프로그래밍 로직과 함수 정의하기

# 조건 분기

# if 명령믄, if ... else 명령문, ifelse() 함수, 그리고 switch() 함수

# 1) if 명령문

# if 명령문은 주어진 하나의 조건이 참일 경우 제시된 실행문의 내용을 수행하고,
# 그렇지 않으면 명령을 수행하지 않도록 제어하는 명령문이다.

# <if 명령문의 형태>
# if (condition) {statement_1, ..., statement_k}

# 이때 if 명령문은 조건 판별을 위해 "길이가 1"인 "논리벡터"만을 고려한다.  
# 따라서 길이가 2 이상인 벡터가 조건식에 사용되는 경우,
# 결과 값으로 역시 길이가 2 이상인 논리 벡터가 생성되어 오류가 발생하게 된다. 
# 따라서 if 명령문의 조건식은 길이가 2 이상인 벡터가 입력되면 자동으로 첫 번째 원소에 대해서만 조건을 판별하게 된다. 

# 또한 if 명령문이 포함되는 실행문은 둘 이상일 수도 있으며, if 조건식을 "여러 개 중첩"하여 사용할 수도 있다. 

x <- 3

if (x < 2) x + 2 # 입력값이 2보다 작으면 2를 더함

if (x >= 2) x + 2 # 입력값이 2보다 크거나 같으면 2를 더함

y <- c(-1, 0, 1)

if (y > 0) y + 1  # 버전에 따라 Warning message가 뜨거나 에러 발생, 입력값이 0보다 작거나 같으면 1을 더함

if (any (y > 0)) y + 1 # 입력된 모든 값에 대해 하나 이상 만족되면 1을 더함

if (all (y > 0)) y + 1 # 입력된 모든 값에 대해 모든 값이 만족되면 1을 더함

if (x > 1 | y > 2) x + 2 # 버전에 따라 Warning message가 뜨거나 에러 발생, 첫 번째 원소에 대해 두 조건 중 하나 이상이 만족되면 2를 더함

if (x > 1 || y > 2) x + 2 # 모든 원소에 대해 두 조건 중 하나 이상이 만족되면 2를 더함

if (x > 1 & y > 2) x + 2 # 첫 번째 원소에 대해 두 조건이 모두 만족되면 2를 더함 

if (x > 1 && y > 2) x + 2 # 모든 원소에 대해 두 조건이 모두 만족되면 2를 더함


x <- 3
y <- c(-1, 0, 1)


if (x == 3 && y == -1) {                      # 조건식 입력         
  x <- x ^ 3                                  # 실행문 1 
  y <- y * y                                  # 실행문 2
  cat("there are two statements in braces")   # 실행문 3
}                                             # 실행문 종료

# 여러 개의 실행문을 입력하기 위해 중괄호({}) 연산자 입력

x; y                                          # 결과 확인         

if (x > 2) {                                  # 조건식 입력
  x <- x / 3                                  # 실행문 1
  if (x == 9) x - 6                           # if 명령문 1
}                                             # 실행문 종료

x                                             # 결과 확인, x - 6을 객체에 저장하지 않았기 때문에 9로 출력


# if ... else 명령문
# 조건식의 논리가 참일 경우 마찬가지로 실행문을 실행하되, 
# 거짓일 경우에도 else 구문에 포함된 또다른 실행문을 실행하는 명령문이다. 
# 따라서 if ... else 명령문을 사용하면 주어진 여러 가지 조건들을 순차적으로 고려할 수 있다. 

# <if ... else 명령문의 형태>

# if (condition) {statement_1, ... , statement_k}
# else {statement_1, ... , statement_k}

# if...else 명령문을 사용하는 과정에서 종종 if 구문과 else 구문을 서로 다른 명령 행에서 실행하는 오류를 범하기도 하는데, 
# 이 경우 두 구문이 서로 독립적인 명령문으로 인식되어 오류가 발생하게 된다.

x <- -15; y <- 50

if (x > y)                            # 조건식 입력
  cat("x is bigger than y") else      # 참일 경우 실행문 + else
    cat("y is bigger than x")           # 거짓일 경우 실행문

if (x > y) {                          # 조건식 입력
  cat("x is bigger than x\n")         # 참일 경우 실행문
  if (x %% 2 == 0)                  # (중첩) 조건식 입력
    cat("x is even number") else      # (중첩) 참일 경우 실행문  + else
      cat("x is odd number")            # (중첩) 거짓일 경우 실행문
}  else {                             # if 마침 + else
  cat("y is bigger than x\n")         # 거짓의 경우 실행문
  if (y %% 2 == 0)                  # (중첩) 조건식 입력
    cat("y is even number") else      # (중첩) 참일 경우 실행문 + else
      cat("y is odd number")            # (중첩) 거짓일 경우 실행문
}                                     # else 마침  


# else if 명령문
# else if 명령문은 여러 가지 조건을 동시에 효율적으로 고려할 수 있도록 if ... else 명령문을 보다 발전시킨 형태이다. 
# 따라서 else if 명령문을 사용하면 명령문을 보다 단순화할 수 있다. 


# <else if 명령문의 형태>

# if (condition) {
#   statement_1, ... , statement_k } else if (condition) {
#   statement_1, ... , statement_k } else {
#   statement_1, ... , statement_k }

# else if 구문의 사용 방법을 보자. 

# example

income <- 12000                                             # 과세표준 할당
if (income > 30000)                                         # if 조건식 입력
  9010 + ((income - 30000) * 0.38) else if (income > 8800) 
    1590 + ((income - 8800) * 0.35) else if (income > 4600)
      582 + ((income - 582) * 0.24) else if (income > 1200)
        72 + ((income - 1200) * 0.15) else                        # else 구문 입력
          income * 0.06

# ifelse 함수
# <ifelse() 함수의 형태>
# ifelse(condition, yes, no)

# ifelse() 함수는 입력된 벡터 변수를 주어진 조건에서 판별하고, 
# 판별된 참 혹은 거짓의 논리벡터를 가지고 새로운 벡터 연산을 수행하기 때문에, 
# "함수화", 혹은 "벡터화"된 if ... else 명령문이라고 볼 수 있다. 

x <- exp(1) # 수리함수 활용; 지수함수, exponential

ifelse(x > 0, yes = x, no = log(x))
ifelse(x < 0, yes = x, no = log(x))

log(exp(1)) # log와 exp 간의 관계 인지하기

y <- -10

ifelse(y > 0, y, -y)

# 이번에는 조건식으로부터 판별된 논리값이 둘 이상인 경우를 살펴보자.

x <- c(1, 2, 3, 4, 5)
y <- c(-2, -1, 0, 6, 7)

x > y

ifelse(x > y, x, y)

x;y

x %% 2 == 0 # 연산자 의미 익히기!
y %% 2 == 0

ifelse(x %% 2 == 0, x, ifelse(y %% 2 == 0, y, 0)) # 중첩 ifelse

# switch() 함수
# switch()는 여러 개의 대안 리스트 중에서 조건에 따라 하나의 리스트를 선택하여 분기하는 기능을 가지고 있다.
# 이때 조건에 입력되는 값은 "길이의 수치형 벡터 혹은 문자열 벡터"이어야 하며, 
# 입력된 조건이 길이 1의 수치형 벡터이며 그 값이 "k"일 경우 k번째 실행문이 실행되고, 
# 입력된 조건이 길이 1의 문자열 벡터이며 그 값이 "name_k"일 경우 name_k에 해당하는 실행문이 실행된다. 

# <switch() 함수의 형태>
# switch(condition,
#                  name_1 = statement_1,
#                  name_2 = statement_2,  
#                  ...,
#                  name_k = statement_k)

x <- 1:10
switch(2, mean(x), sum(x), var(x), sd(x))    # 2번째 실행문 선택
switch(x[4], mean(x), sum(x), var(x), sd(x)) # 4번째 실행문 선택

x <- 1:10
method <- "my.iqr"
switch(method,                                                 # 조건 입력
       my.range = diff(range(x)),                              # 실행문 1
       my.mad = sum(abs(x - mean(x))) / length(x),             # 실행문 2
       my.iqr = diff(quantile(x, probs = c(0.25, 0.75))),      # 실행문 3
       my.var = sum((x - mean(x)) ^ 2) / (length(x) - 1),       # 실행문 4
       my.sd = sqrt(sum((x - mean(x)) ^ 2) / (length(x) - 1))  # 실행문 5
)  

# 입력된 조건에 따라 사분위범위를 구하는 my.iqr이 선택되며(75%), 변수 x의 사분위범위 값인 4.5가 반환된다.
