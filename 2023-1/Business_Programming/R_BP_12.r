# 230502 경영프로그래밍

setwd("C:/R_BP")

# sort() 함수와 order() 함수
# sort(): 데이터 값의 순서를 정렬해서 반환

x <- c(20, 10, 30, 50, 40)

sort(x, decreasing = F) # 오름차순 정렬

sort(x, decreasing = T) # 내림차순 정렬

# order(): 순서를 정렬해서 "인덱스" 반환

x <- c(20, 10, 30, 50, 40)

order(x, decreasing = F) # 오름차순 정렬일 때 인덱스 순서

order(x, decreasing = T) # 내림차순 정렬일 때 인덱스 순서

head(iris[order(iris $ Sepal.Length), ]) # 인덱스를 반환하기 때문에 다음과 같이 dataframe 구조 정렬에 응용 가능

# unique() 함수
# unique(): 벡터나 dataframe에 대해 중복값을 제거한 유일 값(unique)을 반환

x <- c(1, 1, 2, 2, 3, 3)
unique(x)

levels(iris $ Species)
unique(iris $ Species)

# rm() 함수
# rm(): 변수를 메모리에서 제거

x <- 1; y <- 2
rm(x, y)

# rm(list = ls()) 형태로 많이 사용함

# aggregate() 함수
# 기준 열로 그룹화하여 특정 열에 대해 요약 통계를 적용한 값을 반환한다.
# 요약통계: max, min, mean, median 등 집단이 요약된 값을 의미한다.

# 구조: aggregate(기준열 ~ 그룹화할 열, x, 적용할 통계)

aggregate(Petal.Length ~ Species, iris, mean)

# 품종별로 Petal.Length의 평균 길이를 구했다. 여러 열을 선택하려면 다음과 같이 응용하면 된다.

aggregate(cbind(Petal.Length, Sepal.Length) ~ Species, iris, mean) # cbind()로 열을 묶었다.
aggregate(cbind(Petal.Length, Petal.Width) ~ Species, iris, mean) # cbind()로 열을 묶었다.


# apply() 계열함수
# apply(), sapply(), lapply(), tapply(), mapply()가 있다.
# 데이터셋에 특정 요약 통계를 적용하여 결과를 반환하는 기능을 한다.
# apply 계열 함수들은 각각 받아서 처리하는 값인 인수와 반환하는 결괏값에 차이가 있다.

# tapply()와 mapply()에 대해 살펴보자.

x <- unique(iris $ Petal.Width) # Petal.Width의 유일 값 확인
sort(x) # 정렬해서 확인

# 구조: tapply(함수가 적용될 대상 열, 그룹화 기준 열, 적용될 함수)
tapply(iris $ Petal.Length, iris $ Petal.Width, mean)

# mapply()
# 각 대상 인수에 대해 지정된 요약 통계를 적용한다.

mapply(max, iris[, 1:4])

# as.~ 계열 함수
# 형 변환 함수이다. 용도에 맞게 변경해서 사용해야 함.

x <- c(1, 1, 1, 2, 2, 2) # 숫자형으로 생성
class(x)

x <- as.character(x) 
x # 문자에 ""가 붙음을 확인
class(x)


