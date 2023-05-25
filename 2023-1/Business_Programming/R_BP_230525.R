#### 230523 경영프로그래밍####

#### 1. 파이프 라인 #### 
# 매우 중요!

setwd("C:/R_BP")

install.packages("tidyverse")
library(tidyverse)

install.packages("readxl")
library(readxl)


customer_r <- read_xlsx("customer_r.xlsx")
colnames(customer_r) <- tolower(colnames(customer_r))

reservation_r <- read_xlsx("reservation_r.xlsx")
colnames(reservation_r) <- tolower(colnames(reservation_r))

order_info_r <- read_xlsx("order_info_r.xlsx")
colnames(order_info_r) <- tolower(colnames(order_info_r))

item_r <- read_xlsx("item_r.xlsx")
colnames(item_r) <- tolower(colnames(item_r))

library(dplyr)

customer_r %>% count() #ctrl shift m

count(customer_r)

tolower(colnames(order_info_r))

order_info_r %>% colnames() %>%  tolower()
a <- colnames(order_info_r)
tolower(a)


summarise(order_info_r, avg = mean(sales, na.rm = T))
summarise(order_info_r, mean = mean(sales))


summarise(order_info_r, min_value = min(sales),
          max_value = max(sales))

order_info_r %>%
  summarise(min_value = min(sales),
            max_value = max(sales))

reservation_r %>% 
  group_by(customer_id) %>%
  summarise(avg = mean(visitor_cnt))


#### 230525 경영프로그래밍 ####

#### 1. filter() : 조건으로 행 선택하기####

order_info_r %>% 
  filter(item_id == "M0001")

# 아래 두 코드는 결과값이 같다.

order_info_r %>% 
  filter(item_id == "M0001", sales >= 150000)

order_info_r %>% 
  filter(item_id == "M0001" & sales >= 150000)

# filter 함수는 여러 가지 조건을 계속해서 추가할 수 있다.

#### 2. distinct() ~ ####

# p.243 ~ p.250은 시험출제 x

#### 4. select() : 열 선택하기 ####

order_info_r %>% 
  select(reserv_no, sales)

order_info_r %>% 
  filter(item_id == "M0002") %>% 
  select(sales) 

# 번외

order_info_r %>% 
  names()

order_info_r %>% 
  select(-quantity) %>% 
  names()

# - 기호를 사용하면 원하지 않는 변수는 제외할 수 있다.
