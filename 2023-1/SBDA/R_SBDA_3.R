# 230320 SBDA 3주차 2차시

# 230315 학습내용에서 이어짐.

# 프린트 페이지 3 
# 2. R 프로그램: 데이터 구조 4유형

# (2) vector 연습

x <- c(1, 2, 3, 4, 5)

y <- 1:5

x + y

length(x)

sorted_x <- sort(x)

sorted_x

x

x[3]

x[1:2]

x[-3]

x[x > 3]

x > 3

which(x > 3)

# (3) vector의 자료구조 확인 및 연산

var1 <- c(1, 2, 3)

is.vector(var1)

var1[3] # 벡터이름(행 번호)

var1[-2] # 특정 행만 제외(-행 번호)

var1[2:4] # 범위로 선택[행 번호:행 번호]

3 %in% var1 # 특정 값이 있는지?

length(var1) # 벡터의 길이

var2 <- c(4, 5, 6)

union(var1, var2) # 벡터의 합집합

var3 <- c(1, 2, 3, 4)

intersect(var2, var3) # 벡터의 교집합

setdiff(var3, var1) # 벡터의 차집합

# 2. Matrix

m1 <- matrix(c(1, 2, 3, 4))

m2 <- matrix(c(1, 2, 3, 4), nrow = 2) # nrow = 행의 갯수

m3 <- matrix(c(1, 2, 3, 4), nrow = 2, byrow = TRUE) # byrow = 행의 순서로

m4 <- matrix(1:9, nrow = 3, ncol = 3, byrow = TRUE)

m4[1, 2]

m4[1:2, 2:3]

m5 <- matrix(c(1:20), nrow = 4)

m5[c(1,3), c(2, 3)]

m5[ , c(2, 3)] # 행 빈칸: 모든 행

m5[c(1, 3), ] # 열 빈칸: 모든 열

# 3. list 
list1 <- list(학번 = 1001, 이름 = "홍길동", 생일 = "1980-01-01")

list1 $ 이름

list1[3]

list2 <- list(SID = 1001, NAME = "홍길동", BDATE = "1980-01-01")

# 4. DataFrame

a = c(1:5)

b = a^2

data1 = data.frame(a, b)

data1

dim(data1)

data1 $ b

data1[3, 2]

data1[c(4, 5), ]

subset(data1, a > 3)

subset(data1, a > 2 & b < 10)

# 230315 내용 마무리

# 230320 SBDA

# 3. R 프로그램에서의 데이터셋 작성 및 사용

  # 1) 직접 입력한 vector의 결합

sid <- (c(1001, 1002, 1003))

name <- c("홍길동", "Michael", "손석구")

bdate <- (c("1980-01-01", "1985-10-23", "1991-06-16"))

(member1 <- data.frame(SID=sid, NAME=name, BDATE=bdate))

(member2 <- data.frame(SID=1004, NAME="Cindy", BDATE="1987-04-10"))

(member <- rbind("member1", "member2"))

(member <- cbind("member", GRADE=c(1, 3, 2, 3)))

  # 2) R 프로그램 내장 데이터셋 활용

# example; mtcars(Motor Trend Car Road Tests)

help(mtcars)
head(mtcars)
str(mtcars)

  # 3) Excel 파일 불러오기

# 워킹 디렉토리 설정
setwd("C:/Users/user/Desktop/R_SBDA")
data01 <- read.csv("data_admission_SBDA_csv.csv")

# 엑셀 파일은 불러오기 위해서 패키지 설치 필요
install.packages("readxl")
library(readxl)

data02 <- read_excel("data_admission_SBDA_excel.xlsx")

  # 4) 흔히 사용하는 데이터셋 사용 명령어 - 프린트 5p 참고

# 4. R 프로그램에서의 자료형 변환

# 문자형 벡터의 원소가 지역명, 대학명, 학점(문자), 메달의 종류(금/은/동)와 같이 그룹을 의미하는 문자열이 반복되는 경우, factor(범주형 벡터)로 변환

  # 1) as.factor 함수

grade <- c("B", "C", "A", "B", "B", "A", "B", "C", "A", "F")

print(grade)
grade

# 문자형 벡터는 따옴표로 표시된 문자열로 출력
table(grade)

grade.f <- (as.factor(grade))
grade.f

# 범주형 벡터 출력
# 따옴표 없는 문자열과 함께 레벨 추가됨(레벨: 중복된 원소 제거 후 오름차순으로 정렬)

as.integer(grade.f) # 정수형으로 변환

# 비교: 문자형 벡터는 수치형으로 변환 불가
as.integer(grade) # Warning message: NAs introduced by coercion 

  # 2) factor 함수

# 범주형 벡터 레벨 순서 지정 시
grade.f2 <- factor(grade, levels = c("A", "B", "C", "D", "E", "F"))
grade.f2
table(grade.f2)
