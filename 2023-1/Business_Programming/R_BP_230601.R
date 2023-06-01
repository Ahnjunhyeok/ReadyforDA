#### 230523 경영프로그래밍####

#### 1. 파이프 라인 #### 
# 매우 중요!

setwd("C:/R_BP")

library(ggplot2)

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

head(customer_r)

library(dplyr)

customer_r %>% # ctrl shift m
  count() 

count(customer_r)

tolower(colnames(order_info_r))

order_info_r %>% colnames() %>% 
  tolower()

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

#### distinct() ~ ####

# p.243 ~ p.250은 시험출제 x

#### 2. select() : 열 선택하기 ####

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

#### 230530 경영프로그래밍 ####

#### P.252~ Unit 4 ####

#### 1. mutate() 함수: 새로운 열 생성하기, 파생변수 만들기 #### 

# 예약번호를 기준으로 그룹핑
order_info_r %>% 
  group_by(reserv_no) %>% 
  mutate(avg = mean(sales))

dim(order_info_r)

# 위 코드를 다른 형태로 표현
order_info_r %>% 
  mutate(plus = sales + 1000)

# mutate() 구조
# mutate(변수명 = 동작할 함수)

mean_order <- mean(order_info_r $ sales)

# 그룹을 2개로 나눌때----

order_info_r %>% 
  mutate(group = ifelse(order_info_r $ sales >= mean_order, "Good", "Bad")) # 더 자주 사용

# 그룹을 3개로 나누고 싶을때는 ifelse() 안에 ifelse를 한번 더----

# 1. 기본식
# ifelse(<조건>, <조건에 부합할 경우>, <조건에 부합하지 않을 경우>))

# 2. 중첩 조건문

# 조건이 3가지인 경우
# ifelse(<조건>, <조건에 부합할 경우>,
# ifelse(<조건>, <조건에 부합할 경우>, <조건에 부합하지 않을 경우>))


#### 2. rename(): 열 이름(변수 이름)을 바꾸고 싶어! ####
#### 형태: rename(바꾸고자하는 변수명 = 기존의 변수명) ####
order_info_r %>% 
  rename(amt = sales)

#### Unit 5. 테이블 조작 ####

#### 1. bind_cols() : 테이블에 열 붙이기 ####

tmp_order_info_r <- order_info_r
bind_cols(order_info_r, tmp_order_info_r)

# 행 개수가 다르면 오류가 발생
bind_cols(order_info_r, reservation_r)

#### bind_rows() : 테이블에 행 붙이기 ####
bind_rows(order_info_r, tmp_order_info_r)
bind_rows(order_info_r, reservation_r) # 열 이름이나 개수가 같지 않더라도 테이블끼리 붙임

# 주의! 컬럼의 개수가 맞아야 한다. 

#### 2. inner_join(): 일치하는 데이터 연결하기 ####
# 조인 조건이 정확히 일치하는 경우 결과 출력(동등 조인)
inner_join(reservation_r, order_info_r,
           by = "reserv_no") %>%
  arrange(reserv_no, item_id)

#### 3. left_join(): 왼쪽 기준 모든 데이터 연결 ####

#### 4. right_join() : 오른쪽 기준 모든 데이터 연결 ####

#### Unit 6. dplyr 패키지 고빈도 사용 함수 ####
# 1. group_by()
# 2. summarise()
# 3. filter()
# 4. mutate()
# 5. select()
# 6. arrange()

reservation_r %>% 
  group_by(customer_id) %>% # customer_id 별로 그룹핑
  summarise(avg = mean(visitor_cnt)) %>% # 열 전체를 입력값으로 mean() 함수 적용
  filter(avg >= 3) %>% # avg가 3 이상인 행 필터링  
  arrange(desc(avg)) # avg 열로 내림차순으로 정렬

# 230601 경영프로그래밍-----

# ggplot2 기본 문법

# ggplot(data = 데이터 형, aes(x = , y = )) +
#        geom_col() - 레이어를 추가하는 방식

df_cfm_order <- inner_join(reservation_r,
                           order_info_r,
                           by = "reserv_no") %>% 
  select(customer_id, reserv_no, visitor_cnt,
         cancel, order_no, item_id, sales) %>% 
  arrange(customer_id, reserv_no, item_id)

head(df_cfm_order)

df_sch_graph <- df_cfm_order %>% 
  group_by(customer_id) %>% 
  summarise(vst_cnt = sum(visitor_cnt),
            cust_amt = sum(sales / 1000))

head(df_sch_graph)


df_sch_graph %>% 
  ggplot(aes(x = vst_cnt, y = cust_amt)) +
  geom_point() +
  xlim(0, 40) + ylim(0, 500) +
  labs(title = "Scatter Plot of vst_cnt vs cust_amt")
  
