####  Logistic Regression -------------------

setwd("C:/R_BA")

####  Logistic Regression  -------------------
# Description: https://www.kaggle.com/c/titanic/data

training.data.raw <- read.csv('train.csv', header=T,
                              na.strings=c(""))

install.packages("Amelia")
library(Amelia)

# 결측치 찾기 시각화
missmap(training.data.raw, main = "Missing values vs observed")
data <- subset(training.data.raw,
               select = c(2, 3, 5, 6, 7, 8, 10, 12))

data $ Age[is.na(data $ Age)] <- mean(data $ Age,na.rm = T)

# 데이터셋 구분(train_set, test_set)

train <- data[1:800, ]
test <- data[801:889, ]
model <- glm(Survived ~ ., family = binomial(link = 'logit'),
             data = train)
summary(model)

install.packages("pscl")
library(pscl)
pR2(model)

# For Predictive Regression model
fitted_results <- predict(model, 
                          newdata = subset(test, select = c(2,3,4,5,6,7,8)),
                          type = 'response')
fitted_results

fitted.results <- ifelse(fitted.results > 0.5, 1, 0)

table(fitted.results)

# 이후에 confusion matrix를 통해 확인