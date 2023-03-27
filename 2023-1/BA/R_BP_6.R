# 230327 비즈니스어낼리틱스

# 참조문(주석) - 주석 안달면 감점, 열심히 달자 주석!

# 1. 유형
 
# mode() 함수를 통해 객체의 유형을 알 수 있다.

mode(5 + 4)

mode(5 > 4)

mode("economy")

A <- c(TRUE, FALSE, T, F, T, F)

mode(A)

# 기본형 데이터의 유형은 as.~() 형태의 함수를 사용하여 변화시킬 수 있다.

A <- c(TRUE, FALSE, T, F, T, F)

mode(A) # 기본형의 데이터 유형 확인

as.numeric(A) # 숫자형으로 변환
as.character(A) # 문자형으로 변환
as.complex(A) # 복소수형으로 변환

B <- c(1, 1, 1, 0, 0, 0)

mode(B)

as.logical(B) # 논리형으로 변환

as.integer(pi) # 정수형으로 변환

C <- c("a", "b", "c", "d")

as.numeric(C) # 문자형을 숫자형으로 변환하면 NA 값 출력(결측값이 됨)

# NA vs NULL

# NA는 결측값으로, 데이터의 부재로 연산 결과를 얻을 수 없는 경우를 의미한다. 
# NULL은 값이 비어있거나 어떠한 가치도 없음을 의미한다. 

x <- c(1, 2, 3, NA, 5) # 객체 x 정의(결측값 포함)

y <- c(2, 4, 6, 8, 10) # 객체 y 정의

x + y # 객체 간의 합, 네번째 원소의 합 불가능
 
0 / 0 # 정확한 값 제시 불가

Inf / 1 # 무한대인 경우
 
c() # 형태가 없는 경우

# 2. 길이

1:5

length(c(1:5)) # 벡터의 길이 확인

G7 <- c("USA", "JAPAN", "UK", "FRANCE", "GERMANY", "ITALY", "CANADA")

length(G7) # 객체 G7의 길이 확인


# 3. class(클래스)

my.mat <- matrix(1:4, nrow = 2) # 2 * 2 행렬 생성

my.mat # 행렬 출력

mode(my.mat) # 객체 my.mat의 유형 확인

class(my.mat) # 객체 my.mat의 클래스 확인

mode(G7)

class(G7)

# 모델과 클래스의 차이 인지하기!

# 수열 생성하기; seq() 함수
 
-5:10

100:50

seq(from = 1, to = 10, by = 0.5)

seq(to = 5)

seq(to = 10, length.out = 15)

seq(1, 2, length.out = 10)

# 반복 함수; rep()

rep(c(1, 2, 3), times = 3)

rep(1:5, each = 2)

rep(G7, each = 3, times = 2)

# 벡터에 원소 추가를 위한 함수; append()

G8 <- append(G7, "RUSSIA")

G8

G10 <- append(G8, c("kOREA", "CHINA"), after = 1)

G10

# 벡터의 개별 원소에 이름 부여: names() 함수

GDP.rate <- c(5.2, 5.1, 2.3, 0.3, 6.2, 3.6)

GDP.rate

names(GDP.rate) <- c(2005:2010)

GDP.rate[c("2009", "2010")]

# 벡터의 개별 원소에 이름 부여: paste() 함수

Unem.rate <- c(3.5, 3.2, 3.2, 3.6, 3.7, 3.4)

Unem.rate

names(Unem.rate) <- paste(2005:2010, "y", sep=" ")

names(Unem.rate) <- paste(2005:2010, "y", sep="_")

Unem.rate

# names()와 paste() 함수 구분하기!

# 기타 유용한 함수: apply() & lapply(); lapply() 사용빈도 매우 높음!

result <- lapply(Unem.rate, log) # log를 취해라

result # list 형태로 출력

unlist(result) # vector로 바꾸고 싶다면 unlist

unlist_result <- unlist(result) # 변수에 지정 후 출력

unlist_result
