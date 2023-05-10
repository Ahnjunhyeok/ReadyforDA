setwd("C:/Users/ahnjh/Desktop/2023-1/비즈니스어낼리틱스")

# Part III 

# 1번

library(tidyverse)
library(tree)
library(C50)
bank_data <- read.csv("bank_additional_sample.csv")        

table(bank_data $ y)

bank_data $ y <- as.factor(bank_data $ y) # 데이터 형태 변환

# 1. 카테고리 하나 선택 후 그 안의 모든 속성 선택
# (1) 은행 고객 데이터 선택

bank_1 <- bank_data[ , c('age','job','marital','education','default','housing','loan','y')]

model_1 <- C5.0(bank_1[ , -8], bank_1 $ y) # 트리 만들기

model_1 # 트리 간단한 정보 확인하기


summary(model_1) # 트리 세부 정보 확인, summary 함수 사용


# 2. 모든 카테고리에서 일부 속성 선택

bank_2 <- bank_data[c('age', 'job', 'marital', 'education', 'default', 'housing', 
                      'loan','emp.var.rate', 'cons.price.idx', 'cons.conf.idx',
                      'euribor3m', 'nr.employed', 'y')]


model_2 <- C5.0(bank_2[ , -13], bank_2 $ y) # 트리 만들기

model_2 # 트리 간단 정보 확인하기
 
summary(model_2) # 트리 세부 정보 확인 

# 3. 모든 카테고리의 모든 속성 선택

bank_3 <- bank_data

model_3 <- C5.0(bank_3[ , -21], bank_3 $ y) # 트리 만들기

model_3 # 트리 간단 정보 확인하기

summary(model_3) # 트리 세부 정보 확인하기

# 4. 모델 비교하여 최적의 모델 찾기
summary(model_1)
summary(model_2)
summary(model_3)

tree_pred_1 <- predict(model_1, newdata = bank_1[ , -8])
tree_pred_2 <- predict(model_2, newdata = bank_2[ , -13])
tree_pred_3 <- predict(model_3, newdata = bank_3[ , -21])

# confusion matrix 사용
conf_mat_1 <- table(tree_pred_1, bank_1 $ y)
conf_mat_2 <- table(tree_pred_2, bank_2 $ y)
conf_mat_3 <- table(tree_pred_3, bank_3 $ y)

# 정확도 계산
accuracy_1 <- sum(diag(conf_mat_1)) / sum(conf_mat_1)
accuracy_2 <- sum(diag(conf_mat_2)) / sum(conf_mat_2)
accuracy_3 <- sum(diag(conf_mat_3)) / sum(conf_mat_3)

# 1종 오류 및 2종 오류 계산
type1_error_1 <- conf_mat_1[1, 2] / sum(conf_mat_1[1, ])
type1_error_2 <- conf_mat_2[1, 2] / sum(conf_mat_2[1, ])
type1_error_3 <- conf_mat_3[1, 2] / sum(conf_mat_3[1, ])

type2_error_1 <- conf_mat_1[2, 1] / sum(conf_mat_1[2, ])
type2_error_2 <- conf_mat_2[2, 1] / sum(conf_mat_2[2, ])
type2_error_3 <- conf_mat_3[2, 1] / sum(conf_mat_3[2, ])

# 해석: 
# 3번의 에러율, 1종 오류, 2종 오류 등이 제일 낮기 때문에 model3가 가장 최적의 모델이라고 생각한다.

# 5. 

# 주어진 정보에 기반하여 최적의 모델 선택
Profit_1 = (conf_mat_1[2, 2] * 100) - (sum(conf_mat_1) * 1)
Profit_2 = (conf_mat_2[2, 2] * 100) - (sum(conf_mat_2) * 1)
Profit_3 = (conf_mat_3[2, 2] * 100) - (sum(conf_mat_3) * 1)

best_model <- which.max(c(Profit_1, Profit_2, Profit_3))
best_model

