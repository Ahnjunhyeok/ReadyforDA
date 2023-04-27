# 학번: 2019100299, 학과: 경영학과, 이름: 안준혁

setwd("C:/midterm_exam_2023_1")

install.packages("readxl")
library(readxl)

install.packages("writexl")
library(writexl)

# 1-가
# 답: 경영프로그래밍


# 1-나
# 답: 문제인식, 분석, 결과 실행


# 1-다
# 답: NA(Not Available)


# 1-라
# 답: 데이터 처리, 데이터 분석, 통계 분석, 머신 러닝, 텍스트 마이닝, 소셜 분석, 시각화


# 1-마
# 답: 알파벳, 숫자, -(대시) or _(밑줄) or .(마침표)


# 2-가 
vec <- c(1, 2, 3, 4, 5)
class(vec)


# 2-나 
player <- c("Taeyang", "Sunjin", "Minwoo", "Sihwan")
player[3]


# 2-다 
mat <- matrix(1:24, 6, 4) 
mat


# 2-라 
list_data <- list()
list_data[1] <- "우리는"
list_data[2] <- "자랑스러운"
list_data[3] <- "경희인이다."
list_data


# 2-마 
mat_x <- array(1:3, c(5, 4, 3))
mat_x


# 3-가
player <- c("이태양", "김범수", "문동주", "김기중", "강재민")
num <- c(46, 47, 1, 15, 55)
ERA <- c(3.86, 4.00, 1.08, 0.00, 2.89)

starting_pitcher <- data.frame(player, num, ERA)
starting_pitcher


# 3-나
load(file = "df.Rdata")
write.csv(df, "df.csv")


# 3-다
df_2 <- read.csv("C:/midterm_exam_2023_1/online_shoppers_intention.csv")
str(df_2)


# 3-라
df_3 <- read_excel("Housing.xlsx")
mean(df_3 $ LSTAT, na.rm = TRUE)


# 3-마
sampled_df_3 <- subset(df_3, CRIM >= 3.7, MEDV <= 22)
write_xlsx(sampled_df_3, "df_3.xlsx")


# 3-바


# 3-사
line_up <- c("반즈", "스트레일리", "박세웅", "나균안", "한현희")
back_number <- c(12, 51, 13, 6, 61)
whip <- c(2.35, 3.21, 4.34, 0.35, 2.89)

lotte_pitcher <- data.frame(line_up, back_number, whip)
lotte_pitcher



