#chapter 3, 88p

attach(mydata)

Frequency <- table(mydata$`Mode of Transportation`)
Frequency

View(Frequency)

barplot(Frequency)
barplot(Frequency, horiz=TRUE)
barplot(Frequency, horiz=TRUE, cex.names=0.5)

barplot(Frequency, main="Bar Chart for Transit Survey")


#99p

attach(data1)

intervals <- seq(-50, 100, by =25)

value.cut <- cut(Value, intervals, left=FALSE, right=TRUE)
value.freq <- table(value.cut)
value.freq

View(value.freq)

hist(Value, breaks=intervals, right=TRUE)








