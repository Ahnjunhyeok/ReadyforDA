setwd("C:/R_BA/Regression_Dataset_Rcode_v2")

#### data import ####
df <- read.csv("ToyotaCorolla.csv", stringsAsFactors = F)


#### preproc ####

# remove NA

df <- df[complete.cases(df), ] # 결측치 제거의 한 방법

# fuel type dummy(더미변수화하기)

df $ Diesel <- 0
df $ Diesel[df $ Fuel_Type == "Diesel"] <- 1
df $ CNG <- 0
df $ CNG[df $ Fuel_Type == "CNG"] <- 1
summary(df)

 
#### sample data ####

# train : 60%
num_rows <- round(nrow(df) * 0.6) # 데이터의 60퍼센트만 사용
train_index <- sample(1:nrow(df), num_rows) # 전체 데이터 샘플링
train_df <- df[train_index, ] # training set
validation_df <- df[-train_index, ] # validation set


#### Regression Model ####


model <- lm(Price ~ # DV
              + Age_08_04
              + KM
              + Diesel # base: petrol
              + CNG # base: petrol
              + HP # horse power
              + Met_Color # metallic color
              + Automatic 
              + CC # cylinder volume
              + Doors 
              + Quarterly_Tax # road tax
              + Weight # kg
              , df)

summary(model)


#### prediction using regression results

# price prediction

validation_df $ predicted <- predict(model, validation_df) # 예측값을 객체에 할당
validation_df $ residuals <- validation_df $ Price - validation_df $ predicted 
View(validation_df[ ,c("Id", "Price", "predicted", "residuals")])


# MSE
mse <- mean( (validation_df $ Price - validation_df $ predicted)^2 )

# RMSE
rmse <- sqrt(mse)
rmse

#### Backward regression ####

# model reduce
reduced_model <- step(model, direction = "backward") # 필요성 없는 변수 날리기(CC와 Met_color 삭제됨)

# view best model
summary(reduced_model) # reduced_model의 rmse 구하기 

# rmse 구하는 것이 굉장히 중요함

