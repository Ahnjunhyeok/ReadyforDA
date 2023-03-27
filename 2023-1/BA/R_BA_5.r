# 230320 BA 

# 1. vector
subject_name <- c("John Doe", "Jane Doe", "Steve Graves")
subject_name

temperature <- c(98.1, 98.6, 101.4)

flu_status <- c(FALSE, FALSE, TRUE)

temperature[2]

temperature[2:3]

temperature[1:3]

temperature

temperature[-2]

temperature[c(TRUE, TRUE, FALSE)] # 처음 두 개의 temperature 판독 값은 포함하고 세 번째는 제외함.
# TRUE라고 되어있는 위치의 값만 불러옴.

# 2. factor
gender <- factor(c("MALE", "FEMALE", "MALE")) # vector로 만들고, factor로 저장
gender

blood <- factor(c("O", "AB", "A"),
                levels = c("A", "B", "AB", "O"))
blood

# factor는 Levels 값을 따로 생성해줌

help("levels")

# 3. list; 항목의 순서 집합을 저장하는 데 사용된다는 점에서 vector와 매우 유사함

subject1 <- (list(fullname = subject_name[1],
                  temperature = temperature[1],
                  flu_status = flu_status[1],
                  gender = gender[1], 
                  blood = blood[1]))

subject1[2]

subject1 $ temperature

subject1[c("temperature", "flu_status")] $ temperature

subject1[c("temperature", "flu_status")] $ flu_status

# $는 하위 구조 표시할 때 사용 - 하위 구조 직접 불러올 수 있음

subject1[]

# 4. Data frame

pt_data <- data.frame(subject_name, temperature, flu_status, gender, 
                      blood, stringsAsFactors = FALSE ) 
pt_data

pt_data $ subject_name

pt_data[c("temperature", "flu_status")]

pt_data[2:3] # 위 코드와 결과값이 동일

pt_data[1, 2] # 1행 2열의 데이터를 불러옴

pt_data[2, 1] # 2행 1열의 데이터를 불러옴

pt_data[c(1, 3), c(2, 4)] # (1, 3행)과 (2열, 4열)을 선택

pt_data[c(1, 2), c(1, 3)] # (1, 2행)과 (1열, 3열)을 선택

pt_data[, 1]

pt_data[1, ]

pt_data[ , ]

pt_data[c(1, 3), c("temperature", "gender")]

pt_data[-2, c(-1, -3, -5)]

# 5. Matrix

m <- matrix(c("a", "b", "c", "d"), nrow = 2) # 2 * 2 행렬

m

m1 <- matrix(c("a", "b", "c", "d"), ncol = 2)

m1 # m = m1 - why? 정사각행렬이기 때문에~

m2 <- matrix(c("a", "b", "c", "d", "e", "f"), nrow = 2) # 2 * 3 matrix

m2

m3 <- matrix(c("a", "b", "c", "d", "e", "f"), ncol = 2) # 3 * 2 matrix

m3

m3[1, 1]

m3[3, 2]

m3[1, ]

m3[, 1]

# 연산자와 함수 사용

(36 + 31 + 12) / 3

mean(c(36, 31, 12))

3 * 1

median(c(36, 12, 31))

range(usedcars $ price)

min(usedcars $ price)

max(usedcars $ price)

range(usedcars $ price)

diff(range(usedcars $ price))

IQR(usedcars $ price)

summary(usedcars $ price)

14904 - 10995

quantile(usedcars $ price)

quantile(usedcars $ price, probs = c(0.01, 0.99))

quantile(usedcars $ price, seq(from= 0, to = 1, by = 0.20)) 

boxplot(usedcars $ price, main="Boxplot of Used car Prices", ylab = "Price ($)")

boxplot(usedcars $ mileage, main="Boxplot of Used car mileage", ylab = "Odometer (mi.)")

hist(usedcars $ price, main = "Histogram of Used Cars Prices", xlab = "Price ($)")

hist(usedcars $ mileage, main = "Histogram of Used Cars Mileage", xlab = "Odometer ($)")


# 230327 ~

setwd("C:/Users/user/Desktop/R_BA/Week3_R_Practice")


usedcars <- read.csv("usedcars.csv", stringsAsFactors = FALSE)

usedcars

str(usedcars) # 데이터의 구조 확인

head(usedcars) # 상위 6개 데이터만 출력

var(usedcars $ price)

sd(usedcars $ price)

var(usedcars $ mileage)

sd(usedcars $ mileage)

mean(usedcars $ price)

usedcars $ color

summary(usedcars $ year) # Min, 1st Qu, Median, Mean, 3rd Qu, Max 값 추출

summary(usedcars[c("price", "mileage")])

table(usedcars $ year)

table(usedcars $ model)

table(usedcars $ color)

model_table <- table(usedcars $ model)

prop.table(model_table)

prop.table(table(usedcars $ model))

# 객체를 지정해서 코드를 짜는게 효율적임

color_table <- table(usedcars $ color)

color_pct <- prop.table(color_table) * 100

round(color_pct, digits = 1) # 소수점 첫 자리까지만 출력, 두번째 자리수에서 반올림

plot(x = usedcars $ mileage, y = usedcars $ price,
     main = "Scatteplot of Price vs. Mileage",
     xlab = "Used Car Odometer (mi.)",
     ylab = "Used Car Price ($)")

install.packages("gmodels")
library(gmodels)

usedcars $ conservative <- 
  usedcars $ color %in% c("Black", "Gray", "Silver", "White") # 자주 사용

table(usedcars $ conservative)

CrossTable(x = usedcars $ model, y = usedcars $ conservative)
