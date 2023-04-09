# 230405 비즈니스어낼리틱스

setwd("C:/Users/ahnjh/Desktop/R")

# 루핑(Looping)
# 루핑은 하나의 프로그램 내에서 명령문의 일부를 되풀이하여 실행하는 것을 말한다. 
# 루핑을 위해 repeat 명령문이나 for 명령문, 또는 while 명령문을 사용할 수 있다. 

# repeat 명령문
# repeat 명령문은 루핑 과정에서 사용되는 명령문들 중에서 가장 단순한 형태로, 
# 명령문 내에 포함되어 있는 실행문을 "무한히" 반복하도록 명령한다. 
# 따라서 반드시 루프를 탈출할 수 있도록 하는 break 명령문과 함께 사용되어야 하며, 
# 만약 입력상의 오류로 루프 탈출 기능이 작동하지 않는다면 ESC 키를 눌러 프로그램을 멈출 수 있다. 

# <repeat 명령문의 형태> 
# repeat {statement_1, ... , statement_k}

start <- 0
x <- 1

repeat {
  start <- start + x # start는 1씩 증가
  if (x >= 10) break # x는 10까지 증가 후 탈출
  x <- x + 1 
} 

start                # 결과 확인


# for 문
# for 명령문은 사용이 쉽고 빠른 루핑을 수행하기 때문에 가장 일반적으로 사용되는 명령문이다. 
# 여기서 name은 반복을 제어하는 루프 변수이며,
# 실행문에 포함된 루프 변수는 조건에 입력된 벡터의 개별 원소를 순서대로 입력받으며 실행문을 반복적으로 실행하게 된다.
# 따라서 실행문의 반복 횟수는 입력된 벡터의 길이와 같다.

# <for 명령문의 형태>
# for (name in vector) {statement_1, ... , statement_k}

P <- c(150, 100, 80, 90, 120)                       # 가격 변수 입력
Q <- c(3, 4, 5, 7, 2)                               # 수량 변수 입력

value <- 0                                          # 초깃값 입력

for (i in 1:5) {                                    # for 명령문 시작
  value <- value + (P[i] * Q[i])                    # 실행문 1 입력
  cat("P", i, "*", "Q", i, "=", P[i] * Q[i], "\n",  
      "cumsum=", value, "\n")                       # 실행문 2 입력
}                                                   # for 명령문 종료


value # 누적 합이 저장                              # 결과 확인

# cat() 함수에 대해!
# 콤마를 이용하여 여러 값을 입력 받아 출력한다. 아래와 같이 사용한다. 입력받은 값을 파일로 저장할 수도 있다.
# cat(... , file = "", sep = " ", fill = FALSE, labels = NULL,
# append = FALSE)

# file : 파일 경로와 이름(파일로 저장 시)

# sep : 각 값들 사이를 무엇으로 구분할 것인지

# fill : 몇 칸 만큼 채우고 줄바꿈할 것인지 결정 (options("width")이용하여 현재 창의 넓이 확인 가능)

# labels : fill이 false가 아닌 경우 각 줄의 이름 지정

# append = 파일 저장 시 이름 겹칠 경우 이어붙일지 덮어쓸지 결정


# while 명령문
# while 명령문은 주어진 조건하에서 판별 결과가 참일 경우에만 반복을 실행하는 명령문으로, 
# 루프 탈출이 가능한 repeat 명령문의 형태와 매우 흡사하다.

# <while 명령문의 형태>
# while (condition) {statement_1, ... , statement_k}

x <- 1                               # 초깃값 입력

while (x <= 5) {                     # x가 5 이하인 경우 반복
  cat("collect an apple 5 times\n")  # 실행문 입력
  x <- x + 1                         # x는 1씩 증가
}                                    # while 명령문 종료

start <- 0                           # 초깃값 입력
x <- 1                               # 초깃값 입력

while (x <= 10) {                    # x가 10 이하인 경우 반복
  start <- start + x                 # start는 1씩 증가
  x <- x + 1                         # x는 1씩 증가
}                                    # while 명령문 종료

x; start                             # 결과 확인

x <- 5                               # 초깃값 입력
y <- 1                               # 초깃값 입력

while (y <= 9) {                     # y가 9 이하인 경우 반복
  cat(x, "*", y, "=", x * y, "\n")   # 구구단 (5단) 출력
  x <- x                             # x는 5로 고정
  y <- y + 1                         # y는 1부터 9까지 증가
}                                    # while 명령문 종료

# 응용학습
# 구구단 1단부터 9단까지 만들기

# 1. for 명령문 활용

for (x in 1:9) {
  for (y in 1:9) {
    cat(x, "*", y, "=", x * y, "\n")
  }
}

# 2. while 명령문 활용
# while 명령문을 활용할 때는, 미리 객체를 지정해주는 게 좋다.

x <- 1
y <- 1

while (x <= 9) {
  while (y <= 9) {
    cat(x, "*", y, "=", x * y, "\n")
    x <- x
    y <- y + 1}
  x <- x + 1
  y <- 1
}