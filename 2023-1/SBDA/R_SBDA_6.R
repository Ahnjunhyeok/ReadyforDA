# 230322 통계기반데이터분석

# R 프로그램(3): 연산, 함수 및 제어

# 4. 프로그램 흐름 제어
# 1) 조건문과 비교, 논리연산자

# R의 조건문은 if 문과 else 문으로 구성; if 문 안의 값이 TRUE인지 FALSE인지에 따라서 작동여부가 결정
  # - 비교연산자 <, <=, >, >=, =, != 모두 사용하여 TRUE와 FALSE 중의 하나를 결과로 산출함.
  # 이 결과는 논리 연산자 &(또는 &&)과 |(또는 ||)을 통하여 AND와 OR 연산 수행함.
  # &는 원소 단위의 개별연산 결과 산출; &&는 첫번째 원소 간의 연산결과 산출

# 구조

# if(expression){
#   statements
# }
 
# Example 1

x <- 100

if(x > 10){
  print(paste(x, "is greater than 10"))
}

# 이후에 조건문이 이어질 수 있음

# Example 2

x <- 7
# Check value is less than or greater than 10

if(x > 10){
  print(paste(x, "is greater than 10"))
} else {
  print(paste(x, "is less(not greater) than 10")) 
}

# ifelse(statements, T실행, F실행)

x <- c(40, 55, 60, 65, 70)

group <- ifelse(x > 60, 1, 2) # TRUE이면 1, FALSE이면 2 출력

group

# 2) 반복문: for문과 while문(다른 언어에서 찾아볼 수 있는 do-while문은 없음)

# 구조

# for(변수명 in 벡터) {}: for문이 실행되면 객체 i에 벡터 안에 있는 값들이 순서대로 할당

sum <- 0
for(i in c(1, 4, 7)){
  sum <- sum + i
}

x <- letters[1:5]
for(i in x){
  print(i)
}

# while(구문) {}의 구조: 소괄호 안의 결과가 TRUE가 되는 한, 중골호 안의 로직은 계속 반복

i <- 0
while(i < 10){
  i <- i + 1
}


