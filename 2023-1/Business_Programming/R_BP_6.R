# 230323 경영프로그래밍 4주차

# p.125 ~ 
# 3. 데이터 형태

# 표 4-9 데이터의 형태 분류 설명 참조 - 페이지 127

# 4장 pass

# 5. 변수와 함수, 그리고 패키지

# R에서 변수는 알파벳, 숫자, 언더바(_), 마침표를 사용해서 만들 수 있다.
# 첫 글자는 알파벳이나 .로 시작해야 한다. R에서는 대소문자를 구분한다.


# 변수 네이밍 룰을 적용해보자.

x_1 <-c(1, 2, 3)

x.2 <- c(1, 2, 3)

# 1_x <- c(1, 3, 4) - Error: unexpected input in "1_" 발생

# 5.2. 함수

# 함수란? 데이터를 다루기 쉽게 미리 만들어 놓은 명령어

x <- c(1, 2, 3, 4)

min(x) # 최솟값을 구하는 함수

max(x) # 최댓값을 구하는 함수

a <- mean(x) # 평균을 구하는 mean() 함수로 x 값의 평균을 구하고, 이 값을 a에 할당함.

a # 값을 출력

class(a) 

# 함수의 문법 확인하기

# help() 나 ?를 활용하면 문법 확인 가능

# 사용자 정의 함수 - 중요!

# 함수는 기존에 정의한 것을 사용할 수도 있고, 필요하면 사용자가 만들 수도 있다.
# 간단한 사용자 함수를 만드는 형식은 다음과 같습니다.

# 함수이름 <- funtion(인수) {
#   ... 처리 논리
#   return(반환값)
# }

# example

user_f <- function(x) {
  return (x * 2)
}

user_f(c(1:3))

# 5.3 패키지

# 패키지는 특정 용도를 위한 함수를 모은 꾸러미라고 생각하면 된다.

install.packages("dplyr")
library(dplyr) # 메모리에 올려놓음

install.packages("tidyverse") # 패키지 설치, 한 번만 설치하면 됨.
library(tidyverse) # 패키지 로딩, R을 시작할 때마다 로딩해야함 

summarise(iris, avg = mean(Sepal.Length)) # summerise() : 특정 데이터 값 요약 함수

# 앞 예시는 iris 데이터셋에서 Sepal.Length 열의 평균(avg)을 구하는 코드이다.
# 평균값은 5.843333으로 출력됐다.

update.packages("tidyverse")
