##### Chapter 6: Regression Methods -------------------

#### Part 1: Linear Regression -------------------

## Understanding regression ----
## Example: Space Shuttle Launch Data ----
setwd("C:/R_BA/Regression_Dataset_Rcode_v2")
launch <- read.csv("challenger.csv")

# estimate beta manually
b <- cov(launch $ temperature, launch $ distress_ct) / var(launch $ temperature)
b

# estimate alpha manually
a <- mean(launch $ distress_ct) - b * mean(launch $ temperature)
a

# calculate the correlation of launch data
r <- cov(launch $ temperature, launch $ distress_ct) /
        (sd(launch $ temperature) * sd(launch $ distress_ct))
r

cor(launch $ temperature, launch $ distress_ct) # 온도가 증가하면, distress_ct가 감소함.

# computing the slope using correlation
r * (sd(launch $ distress_ct) / sd(launch $ temperature))

# confirming the regression line using the lm function (not in text)
model <- lm(distress_ct ~ temperature, data = launch)
model
summary(model)
 

# confirming the multiple regression result using the lm function (not in text)
model <- lm(distress_ct ~ temperature + pressure + launch_id,
            data = launch)
summary(model)


## Example: Predicting Medical Expenses ----
## Step 2: Exploring and preparing the data ----
insurance <- read.csv("insurance.csv", stringsAsFactors = TRUE)
str(insurance)

# summarize the charges variable
summary(insurance $ charges)

# histogram of insurance charges
hist(insurance $ charges)

# table of region
table(insurance $ region)

# exploring relationships among features: correlation matrix
cor(insurance[c("age", "bmi", "children", "charges")])

# visualing relationships among features: scatterplot matrix
pairs(insurance[c("age", "bmi", "children", "charges")])


## Step 3: Training a model on the data ----
ins_model <- lm(charges ~ age + children + bmi + sex + smoker + region,
                data = insurance)

ins_model <- lm(charges ~ ., data = insurance) # this is equivalent to above, 모든 독립변수를 다 사용

# see the estimated beta coefficients
ins_model

## Step 4: Evaluating model performance ----
# see more detail about the estimated beta coefficients
summary(ins_model) # 자동으로 더미변수로 만들어줌(sex, region, smoker)

## Step 5: Improving model performance ----

# add a higher-order "age" term
insurance $ age2 <- insurance $ age ^ 2

# add an indicator for BMI >= 30
insurance $ bmi30 <- ifelse(insurance $ bmi >= 30, 1, 0)


# create final model
ins_model2 <- lm(charges ~ age + age2 + children + bmi + sex +
                 bmi30 * smoker + region, data = insurance)

summary(ins_model2) # age 변수가 유의성이 없어짐

#Drop bmi                                                                      

ins_model3 <- lm(charges ~ age + children + sex + bmi30 + 
                 bmi30 * smoker + region, data = insurance)

summary(ins_model3)

ins_model4 <- lm(charges ~ age + children + sex + bmi +  
                 bmi * smoker + region, data = insurance)
summary(ins_model4)
