# Working Directory
setwd("C:/Users/ahnjh/Desktop/R_실습")

# 데이터 불러오기
df1 <- read.csv("Data01.csv")

# 데이터의 구조와 타입 확인
head(df1) # 상위 6개 데이터 확인
dim(df1) # 데이터의 index 갯수와 column 갯수 확인
str(df1) # 데이터의 정보요약

# 패키지: 특정 목적을 달성하기 위한 함수들의 집합
# 패키지를 설치
install.packages("dplyr")

# 패키지를 불러옴
library("dplyr")
# dplyr : 정형데이터 전처리
# %>%   : 파이프 /함수들을 연속해서 사용할 수 있다.

df1 %>% slice(1, 6) %>% select(c("입고수량"))

df1 %>% select(c("입고수량", "출고수량")) %>% head()
