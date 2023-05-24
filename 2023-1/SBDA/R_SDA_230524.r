# 230524 통계기반데이터분석 ------

setwd("C:/R_SDA")

install.packages("readxl")
library(readxl)
Wages <- read_excel("ba_ch07_data.xlsx", 
                    sheet = "Wages")
View(Wages)

Linear <- lm(Wage ~ Educ + Age, data = Wages)

summary(Linear)


Quad <- lm(Wage ~ Educ + Age + I(Age ^ 2),
           data = Wages)

summary(Quad)

predict(Quad, data.frame(Educ = 16, Age = 30))

predict(Quad, data.frame(Educ = 16, Age = 50))

predict(Quad, data.frame(Educ = 16, Age = 70))

Age2 <- 20:80
Pwage <- predict(Quad, data.frame(Educ = 16, Age = Age2))
Pwage

plot(Age2, Pwage)
plot(Age2, Pwage, type = "l")

Mortgage <- read_excel("ba_ch07_data.xlsx", 
                       sheet = "Mortgage")
View(Mortgage)

Linear_M <- lm(y ~ x1 + x2, data = Mortgage)
Logit <- glm(y ~ x1 + x2, family = binomial, data = Mortgage)

summary(Linear_M)
summary(Logit)

predict(Linear_M, data.frame(x1 = c(20, 30),
                             x2 = c(30, 30)))

predict(Logit,
        data.frame(x1 = c(20, 30), x2 = c(30, 30)),
        type = "response")

Pred_Lin <- predict(Linear_M)
Pred_Logit <- predict(Logit, type = "response")

Pred_Lin
Pred_Logit

Binary_Lin <- round(Pred_Lin)
Binary_Logit <- round(Pred_Logit)

100 * mean(Mortgage $ y == Binary_Lin)

100 * mean(Mortgage $ y == Binary_Logit)
