# 230613 경영프로그래밍

setwd("C:/R_BP")

install.packages("readxl")
install.packages("tidyverse")
install.packages("ggplot")
library(ggplot2)
library(readxl)
library(dplyr)


# 데이터 불러오기----
customer_r <- read_xlsx("customer_r.xlsx")
colnames(customer_r) <- tolower(colnames(customer_r))

reservation_r <- read_xlsx("reservation_r.xlsx")
colnames(reservation_r) <- tolower(colnames(reservation_r))

order_info_r <- read_xlsx("order_info_r.xlsx")
colnames(order_info_r) <- tolower(colnames(order_info_r))

item_r <- read_xlsx("item_r.xlsx")
colnames(item_r) <- tolower(colnames(item_r))


# 파이차트 데이터 준비하기----
df_pie_graph <- inner_join(order_info_r, item_r, by = "item_id") %>% 
  group_by(item_id, product_name) %>% 
  summarise(amt_item = sum(sales / 1000)) %>% 
  select(item_id, amt_item, product_name)

df_pie_graph

# 누적 막대 그래프로 그리기
ggplot(df_pie_graph, aes(x = "",
       y = amt_item, fill = product_name)) +
  geom_bar(stat = "identity")

# 파이 차트 그리기
gg <- ggplot(df_pie_graph,
             aes(x = " ",
                 y = amt_item,
                 fill = product_name)) +
  geom_bar(stat = "identity") +
  coord_polar("y", start = 0)

gg  

# 자동으로 파이 차트에 팔레트 색상 채우기

gg <- gg + scale_fill_brewer(
  palette = "Spectral")

gg

# direction = -1 이라는 옵션을 사용하면 색상 순서를 반대로 채운다. 

# 선 그래프 데이터 준비하기----

total_amt <- order_info_r %>% 
  group_by(reserv_no) %>% 
  summarise(amt_daily = sum(sales / 1000)) %>% 
  arrange(reserv_no)

total_amt

# 예역번호를 순서로 x축으로 해서 선 그래프를 그림
ggplot(total_amt, 
       aes(x = reserv_no, 
           y = amt_daily, 
           group = 1)) +
  geom_line()

# 월별 매출 선 그래프 그리기----

total_amt <- order_info_r %>% 
  mutate(month = substr(reserv_no, 1, 6)) %>% 
  group_by(month) %>% 
  summarise(amt_monthly = sum(sales / 1000))

total_amt

# 월별 전체 매출 선 그래프
ggplot(total_amt,
       aes(x = month, 
           y = amt_monthly, 
           group = 1)) +
  geom_line()

# 점 그리기
ggplot(total_amt,
       aes(x = month, 
           y = amt_monthly, 
           group = 1)) +
  geom_line() +
  geom_point()

# 선 그래프 색상 추가, 레이블(텍스트 데이터 추가)
ggplot(total_amt,
       aes(x = month, 
           y = amt_monthly, 
           group = 1,
           label = amt_monthly)) +
  geom_line(color = "red",
            size = 1) +
  geom_point(color = "darkred",
             size = 3) + 
  geom_text(vjust = 1.5,
            hjust = 0.5)

# boxplot 데이터 준비
df_boxplot_graph <- inner_join(order_info_r, 
                               item_r, by = "item_id")

# boxplot 그리기
ggplot(df_boxplot_graph, 
       aes(x = product_name,
           y = sales / 1000)) +
  geom_boxplot(width = 0.8,
               outlier.size = 2,
               outlier.colour = "red") +
  labs(title = "Menu_item_Boxplot",
       x = "Menu",
       y = "profit")
