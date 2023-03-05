# 데이터 구조란? (Vector / Matrix / DataFrame ..)
# *혼동주의!* 데이터 타입이란? (연속형 / 범주형)

# Vector
v1 <- c(1:10)
print(v1)
class(v1)
is.vector(v1)

v2 <- c(letters[1:10])
print(v2)
class(v2)
is.vector(v2)

length(v2) # vector의 길이
range(v2) # vector의 범위

v3 <- seq(1, 10)
print(v3)
class(v3)

v4 <- seq(1, 10, by=2)
print(v4)

v5 <- seq(1, 10, length=5)
print(v5)


# Matrix 
m1 <- matrix(1:12, ncol=3)
print(m1)

m2 <- matrix(1:12, nrow=3)
print(m2)

# DataFrame (정형 데이터)
# index - column - values 이 3가지 형태로 구성된 데이터
x <- matrix(1:12, nrow=4)
colnames(x) <- c("데이터1", "데이터2", "데이터3")
rownames(x) <- c("index1", "index2", "index3", "index4")

df1 <- as.data.frame(x)
df1
