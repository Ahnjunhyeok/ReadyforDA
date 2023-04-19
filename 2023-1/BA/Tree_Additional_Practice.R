# tree 실습

setwd("C:/")
# * ??ü ?????? Ȱ?? ??
require(MASS)
# require(tree)
install.packages("tree")
library(tree)

credit <- read.csv("GermanCredit.csv", header=T)

ir.tr <- tree(RESPONSE ~., credit) # ~. 은 모든 데이터를 쓰겠다는 의미
summary(ir.tr)
ir.tr

plot(ir.tr)
text(ir.tr, all=T)

pred.tr <- predict(ir.tr)

pred.tr # information gain과 entropy를 이용해 확률을 구함

pred <- rep(0, length(pred.tr))

pred

pred[pred.tr > 0.5] = 1

pred

table(credit $ RESPONSE, pred)

#??ü ?????ͷ? ???? tree model?? ??ü ?????Ϳ? ???? ��Ȯ??
#1-(153+71)/1000 = 77.6%

#pruning
ir.tr1<-sn <- .tree(ir.tr, nodes=c(9, 20))
plot
plot(ir.tr1)

text(ir.tr1, all = T)
tr1

#pruned ?????? ?????ս?
pred.tr1<-predict(ir.tr1)
pred
pred<-rep(0, length(pred.tr1))

pred

pred[pred.tr1>0.5]=1

pred
le(credit$RES $ ONSE, pre )
#?? # 테스트셋이 아닌 전체 데이터로 돌림?
??? accuracy?? ???δ? -> ȿ?????? ????ġ??


## training set?? test set ?????? ????

#* Training data Ȱ??: ??ü ???????? 70%

tr.ind<-sa <- le(1000,700) 
tr.german<-cr <- it[tr.ind,]
ts.german<-cr <- it[-tr.ind,]

#????�� training set��?? ??????
ir.tra<-tree
(RESPO <- E~., tr.german)
plot(ir.tra)
plot(ir.tra)

text(ir.tra, all=T)

summary(ir.tra)
���? test set��??
pred.ts<-predict
pred.ts <- predict(ir.tra, ts.german)
ength( <- ed.ts))
pred1
pred1[pred
pred1
.5]=1
pred1
ta > le(t = .g
pred1
$RESPONSE, pred1 $ 
#1-(43+37)/300 =
 73.33%?? ��Ȯ???? ???δ?


