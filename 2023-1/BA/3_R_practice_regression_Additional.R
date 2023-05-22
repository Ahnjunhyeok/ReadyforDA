# Regression Practice---------

setwd("C:/R_BA/Regression_Dataset_Rcode_v2")

roe <- read.table("ROE.IT.txt", header=T)
roe

head(roe, n=10)

plot(x=roe $ IT, y=roe $ ROE,
     xlab="IT", ylab="ROE")
cor(roe $ ROE, roe $ IT)
cor(roe)


result <- lm(ROE ~ IT, data = roe)
summary(result)

coef(result)
resid(result) # 잔차값
fitted(result) # y의 추정값
print(roe $ ROE) # 실제값

plot(x = roe $ IT, y= roe $ ROE, 
     xlab="IT", ylab="ROE", main="IT and ROE")

abline(result) # 회귀식이 그어짐, 회귀식 모델링 직후에 해야 잘 적용된다.

plot(x = roe $ IT, y = roe $ ROE)

abline(result)


# OLS Practice---------

inter <- read.csv(file = "ols_practice.csv", header=T, row.names=1)

head(inter, n=5)

lnwage <- log(inter $ wage)

plot(x = inter $ union, y = inter $ lnwage) # 오류발생

plot(x = as.factor(inter $ union), y = inter $ lnwage)

plot(x = inter $ ttl_exp, y = inter $ lnwage) # 근속년수와 임금의 관계


res <- lm(lnwage ~ union + ttl_exp,
          data = inter)
summary(res)

res <- lm(lnwage ~ union + ttl_exp + union : ttl_exp,
          data=inter) # union : ttl_exp는 분석에서 제외해도 된다.

summary(res)

plot(x = inter $ ttl_exp, y = inter $ lnwage)
abline(res)

install.packages("effects")

library(effects)

result <- lm(lnwage ~ union + ttl_exp + union : ttl_exp, data = inter)

model <- allEffects(result)

summary(model)

plot(model $ union)
plot(model)
plot(model $ union, multiline = T)

install.packages("car")
library(car)

result <- lm(lnwage ~ union + ttl_exp + union:ttl_exp,
             data = inter)
vif(result) # 다중공선성을 판단할 수 있는 지표; 10이 넘으면 다중공선성이 있다.




