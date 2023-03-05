# 조건문과 반복문

a <- 10

# R에서는 중괄호를 사용

if (a>5) {
  print(" a는 5보다 크다")
} else {
  print(" a는 5보다 작다")
}

b <- c(readline("Insert Number: "))
if (b>=90){
  print("A")
} else if (b >= 80){
  print("B")
} else if (b >= 70){
  print("C")
} else {
  print("F")
}

# while : 특정 조건이 만족되는 동안 종속문장 실행
y <- 0

while( y<5 ){
  print("Hi")
  y <- y + 1
}

# For : 특정 범위가 만족되는 동안 종속문장 실행
for (i in 1:10){
  print(i)
}

v1 <- c(1:10)
sum1 <- 0
for (i in v1){
  sum1 <- sum1 + v1[i]
}
print(sum1)

# 1+2 = 3 / 3+3 = 6 / 6+4 = 10 ....

sum(v1)
mean(v1)