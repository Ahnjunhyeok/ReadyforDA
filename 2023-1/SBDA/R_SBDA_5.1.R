D <- sample(1:6, 10, replace = T) # 주사위 10회 던지기(복원추출)
barplot(table(D))  

Dice <- function(n) {sample(1:6, n, replace = T)} # 주사위 n회 던지기 함수(복원추출)
D10 <- Dice(10) # 주사위 던지기 10회  
D30 <- Dice(30) # 주사위 던지기 30회 
D100 <- Dice(100) # 주사위 던지기 100회
D1000 <- Dice(1000) # 주사위 던지기 1000회

# 주사위 던지기 결과를 그래프로 시각화
par(mfrow = c(2, 2)) # 그래프를 2개의 행, 2개의 열 형태로 배열

barplot(table(D10))
barplot(table(D30))
barplot(table(D100))
barplot(table(D1000))

Dice_t <- function(n) {
  D <- sample(1:6, n, replace = T)
  barplot(table(D))
}

Dice_t(30)
Dice_t(150)
Dice_t(500)
Dice_t(1000)

D1 <- sample(1:6, 10000000, replace = T)
barplot(table(D1))

# 3. 데이터셋을 활용한 함수(Functions) 연습
# mtcars 데이터셋을 이용한 함수 연습
par(mfrow=c(1, 1))

str(mtcars)
attach(mtcars) # mtcars 데이터셋을 고정시켜 사용(데이터셋 이름 $ 변수명 => 변수명만으로 사용)
dim(mtcars)  
help(mtcars)

table(am)  # 질적자료의 빈도표 및 그래프
pie(table(am))

table(cyl)  
pie(table(cyl))  

summary(mpg) # 양적자료의 요약통계량 및 그래프
hist(mpg)    
boxplot(mpg)  

aggregate(x = mpg, by = list(am), FUN = mean)  # 그룹별 평균 비교(2 groups), # aggregate에서는 반드시 리스트 사용!
boxplot(mpg~am)  
t.test(mpg~am)  

aggregate(x=mpg, by=list(cyl), FUN = mean) # 그룹별 평균 비교(3 groups)    
boxplot(mpg~cyl)  
m <- aov(mpg~cyl)  
summary(m)  

plot(wt, mpg)          # 양적자료 간의 관계  
cor.test(mpg, wt)
lm(mpg ~ wt)  
m <- lm(mpg~wt)  
summary(m)  
abline(m)  