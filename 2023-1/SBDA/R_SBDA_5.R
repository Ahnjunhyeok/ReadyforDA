

#주사위 던지기

D <- sample(1:6, 10, replace=T)
barplot(table(D))

Dice <- function(n) {sample(1:6, n, replace=T)}
D10 <- Dice(10)
D30 <- Dice(30)
D100 <- Dice(100)
D1000 <- Dice(1000)


par(mfrow=c(2,2))
barplot(table(D10)); barplot(table(D30))
barplot(table(D100)); barplot(table(D1000))

dice_t <- function(n) {
  D <- sample(1:6, n, replace=T)
  barplot(table(D))
}

dice_t(30)
dice_t(150)
dice_t(500)
dice_t(1000)


D1 <- sample(1:6, 10000000, replace=T)
barplot(table(D1))

par(mfrow=c(1,1))

str(mtcars)
attach(mtcars)
dim(mtcars)
help(mtcars)

table(am)
pie(table(am))

table(cyl)
pie(table(cyl))

summary(mpg)
hist(mpg)
boxplot(mpg)

aggregate(x=mpg, by=list(am), FUN=mean)
t.test(mpg~am)
boxplot(mpg~am)

aggregate(x=mpg, by=list(cyl), FUN=mean)
boxplot(mpg~cyl)


m <- aov(mpg~cyl)
summary(m)

plot(wt, mpg)
cor.test(mpg, wt)
m <- lm(mpg~wt)
summary(m)
abline(m)

#조건부실행: if, ifelse
#반복적실행: for, while

x <- 65
if(x<=70){group <- "A"}
group

if(x>70){group <- "A"} else{group <- "B"}
if(x>70){group <- "A"} else if(x > 65){group <- "B"} else{group <- "C"}

group <- ifelse(x>60, 1, 2)

