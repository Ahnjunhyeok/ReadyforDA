# 작업 폴더 설정
setwd("C:/Users/ahnjh/Desktop/R_실습")
df1 <- read.csv("Data01.csv")
View(df1)

# 데이터의 구조와 타입을 확인
head(df1) # 상위 6개 데이터를 확인
dim(df1) # 데이터의 index 갯수와 column 갯수 확인


#  정형 데이터의 규칙: 하나의 column에는 한가지의 데이터 타입만 올 수 있다.

str(df1) 
# 데이터 정보 요약
# (chr : 문자(범주형) / num: 숫자(연속형) / int: 정수형(숫자, 연속형) factor : 범주형)
 