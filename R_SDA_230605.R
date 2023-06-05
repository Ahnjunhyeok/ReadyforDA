setwd("C:/R_SDA")

install.packages(c("tidyverse", "ggplot2", "ggcorrplot",
                   "corrplot", "leaps", "car", "Metrics",
                   "reshape2", "ggpubr", "moments"))

library(tidyverse)
library(ggplot2)
library(ggcorrplot)
library(corrplot)
library(leaps)
library(car)
library(Metrics)
library(reshape2)
library(ggpubr)
library(moments)

library(readxl)
data <- read_excel("ba_ch08_data.xlsx",
                   sheet = "Health")

cor_table <- cor(data[, -1])
data.st <- scale(data[, -1])
pca <- prcomp(data.st)
summary(pca)

pca $ rotation
pca $ x

newdata <- data.frame(data, pca $ x)
head(newdata)

cor_table

# 대각성분 0으로 지정
diag(cor_table) <- 0

# 상관계수 table을 롱 포맷으로 변환
cor_table_melted <- reshape2 :: melt(cor_table)


# 변환된 상관계수 table에서 가장 높은 절댓값을 가진 상관계수의 행 찾기(새로운 변수에 할당)
highest_correlation <- cor_table_melted[which.max(abs(cor_table_melted $ value)), ]

ggplot(data = cor_table_melted, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1, 1), space = "Lab", 
                       name = "Pearson \nCorrelation") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1),
        axis.text.y = element_text(size = 12)) +
  coord_fixed()
