# 230504 경영프로그래밍

# p.204 데이터 계산

x <- c(1, 2, 3, 4, 5) / 4 # 벡터의 각 값을 4로 나눔

round(x, 0) # 소수점 첫째 자리에서 반올림

floor(x) # 소수점 이하를 "내림"

ceiling(x) # 소수점 이하를 "올림"

trunc(x) # 소수점 아래 값 "버림"

abs(-10) # 절댓값

log(10, base = 2) # 밑이 2인 로그

sqrt(10) # 제곱근

exp(10) # 지수로 변환

x <- c(1, 2, 3, 4, 5)

sum(x) # 합계

mean(x) # 평균

median(x) # 중앙값

max(x) # 최댓값

min(x) # 최솟값

range(x) # 범위

sd(x) # 표준편차

var(x) # 분산

# p.207 데이터 그리기

plot(iris $ Sepal.Length) # 산점도 그래프

plot(iris $ Sepal.Length, iris $ Petal.Width,
     main = "iris data", xlab = "Petal Length",
     ylab = "Petal Width", col = iris $ Species)


pairs(~ Sepal.Width + Sepal.Length + Petal.Width + Petal.Length, 
      data = iris, col = iris $ Species) # 행렬 산점도 그래프: 산점도 그래프를 변수 여러 개로 조합하여 나타내는 행렬 형태의 그래프

# 그래프 해석방법: 대각선의 각 열 이름(= 변수 이름, Sepal.Width 등)을 기준으로 상호 교차하는 지점의 그래프를 x축과 y축으로 생각하고
#################  그래프를 해석하면 된다.

# 예를 들어 그래프는 Petal.Width를 y축, Petal.Length를 x축으로 그린 그래프로, 앞서 살펴본 산점도와 같은 결과를 나타내고 있다.
# 반대쪽 대칭 부분의 그래프는 x축과 y축만 바뀌었지 같은 그래프이다.

hist(iris $ Sepal.Width) # 히스토그램 그래프; 값의 범위마다 빈도를 표현한 것이 히스토그램이다. 히스토그램은 데이터가 모여 있는 정도(분포)를 확인하기에 좋다.

# 기본적으로 히스토그램은 데이터 갯수, 즉 빈도(frequency)를 출력한다.
# 확률밀도로 확인하고 싶다면 freq = False 옵션을 추가한다.
# 이렇게 하면 각 구간에 얼만큼 데이터가 속해 있는지 나타난다. 각 구간을 합친 확률 밀도의 합은 1이다.

hist(iris $ Sepal.Width, freq = F)

x <- aggregate(Petal.Length ~ Species, iris, mean)
barplot(x $ Petal.Length, names = x $Species) # 막대그래프 이름으로 품종 지정

x <- aggregate(Petal.Length ~ Species, iris, sum)
pie(x $ Petal.Length, labels = x $ Species) # 파이차트; 데이터 비율 표현하기 좋음



