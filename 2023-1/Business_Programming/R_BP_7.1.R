# 230328 경영프로그래밍

# Chapter 5. 변수와 함수, 그리고 패키지

# 4) 패키지 업데이트와 삭제하기

# 패키지의 업데이트와 삭제는 다음과 같다.

install.packages("tidyverse")
library(tidyverse)

update.packages("tidyverse")
remove.packages("tidyverse")

summarise(iris, avg = mean(Sepal.Length))

# Chapter 6. R 연산자와 함수

# 산술 연산자

4 %/% 2  # 나머지 출력
4 %% 3 # 몫 출력

# 비교 연산자

x <- c(1, 2, 3)

y <- c(4, 5, 6) 

x < y

x > y

x >= y

x <= y 

x == y

# 6장; R 연산자와 함수

# 3)  데이터 가져오기와 데이터 내보내기

# 1) read.csv(), read.excel(): 데이터 가져오기

# read.csv() 함수로 CSV 파일 가져오기

# kaggle.com에서 오픈소스로 공개된 데이터를 구할 수 있다.

# R에서 다룰 수 있는 수많은 파일 형식 중에서, 가장 많이 사용하는 CSV 파일에서 데이터를 가져와보자.
# 다음은 예제로 제공하는 reservation_r_csv.csv에서 데이터를 가져오는 예시이다. 

setwd("C:/Users/user/Desktop/R_BP") # 시험시 워킹 디렉토리를 지정한 곳으로 정해야함.

x <- read.csv("C:/Users/user/Desktop/R_BP/r_practice/reservation_r_csv.csv") # 인코딩 필요(인코딩 코드를 작성하거나, 파일에 들어가서 직접 바꾸거나.)

x1 <- read.csv("./r_practice/reservation_r_csv.csv") # setwd를 지정하면, ./를 쓰고 이후 경로만 적어주면 코드를 더 줄일 수 있다.

x

x1

head(x) # 데이터 앞부분을 확인

# read.csv() 함수 뒤에 경로는 파일의 경로를 적어준다. 경로를 잘못 적으면 오류가 발생한다.

# read_excel() 함수로 CSV 파일 가져오기

# read.excel() 함수의 사용법도 비슷하다. 단 read.excel() 함수를 사용하려면 먼저 readxl 패키지를 설치해야한다. 
# readxl 패키지를 설치하고 library() 함수로 패키지를 로드하자. 

install.packages("readxl") # 패키지 설치(한번만 수행하면 됨)
library(readxl) # 패키지 로딩(R을 실행할 때마다 수행)

# 이후에는 CSV 파일에서 데이터를 가져올 때와 마찬가지로 read_excel() 함수를 사용하여 엑셀 파일에서 데이터를 가져오면 된다. 

y <- read_excel("C:/Users/user/Desktop/R_BP/r_practice/reservation_r_excel.xlsx")

y

head(y)

# 데이터를 잘 가져온 것을 알 수 있다. 

# RStudio 메뉴로 CSV 파일 가져오기

# RStudio 메뉴를 사용하여 문서 파일 데이터를 가져올 수 있다. 
# RStudio 메뉴를 사용해서 데이터를 가져오는 방법이 함수를 직접 사용하는 것보다 편리하다.

# 먼저 앞과 동일하게 CSV 예제 파일을 RStudio 메뉴를 사용해서 가져오는 방법이다. 
# 오른쪽 위의 환경 창에서 Import Dataset을 클릭하고 From Text(base)를 선택한다. 

# Import를 눌러 데이터 가져오기가 성공하면, 자동으로 콘솔 창에 지금까지 내용이 코드로 입력되고 실행된다.
# 그리고 소스 창에는 가져온 데이터 내용이 출력된다. 
# 개인 노트북 환경에서는 Error in type.convert.default(data[[i]], as.is = as.is[i], dec = dec,  : invalid multibyte string at '<b8><b6><c6><f7>' 오류 발생

# RStudio 메뉴로 엑셀 파일 가져오기
# 환경 창에서 Import Dataset > From Excel을 선택한다. 

# reservation_r_excel이라는 데이터프레임을 생성한 것을 확인할 수 있다.

# 2) write.csv(), write_excel() 함수: 데이터 내보내기

# 데이터를 내보낼 때는 write.csv()와 write_excel() 함수를 사용한다. 
# 먼저 write.csv() 함수로 데이터 프레임을 csv 파일로 내보내보자. 

write.csv(x, "csv_output.csv") # x에 객체로 저장했기 때문에 책과 다르게 x로 불러와야함.

# 파일이 만들어진 것을 확인할 수 있다.

# 이제 write_excel() 함수로 엑셀 파일 내보내기를 해보자. 
# 우선 패키지 설치가 필요하다. 

install.packages("writexl") # y에 객체로 저장했기 때문에 책과 다르게 y로 불러와야함. 
library(writexl)

write_xlsx(y, "excel_output.xlsx")

# 데이터프레임의 내용이 엑셀 파일로 만들어진 것을 확인할 수 있다.

# 3) sink() 함수: 분석 결괏값 저장하기

# sink() 함수는 편집 창이나 콘솔 창에서 실행한 R 코드의 결과를 콘솔 창에 출력하는 대신 외부 파일로 출력한다. 
# 분석한 결괏값만 출력하여 정리하고 싶을 때 유용하게 사용할 수 있다. 

# 구조
# sink("만들 파일 이름")으로 파일을 만든 후 코드를 실행하여 결과 출력 기록 작업을 수행하고, sink()로 파일 기록을 마친다.

# 파일은 워킹 디렉토리에 만들어진다. 

sink("output.txt") # 출력을 output.txt에 기록 시작

x <- 1
y <- 2

x
y

x * y 
x + y
x - y
x ^ 2
x ^ y
x %in% 2
sink()

# 워킹 디렉토리에 저장된 파일 내역을 열어보면 다음 그림과 같이 콘솔 창에 출력될 경과가 파일로 저장되어 있다.

# 4) save() 함수와 load() 함수

# save()와 load() 함수는 생성한 변수를 저장하거나 불러온다. 
# R에서 변수를 만들면 해당 변수는 R에 저장된다. 
# R을 종료한 후에도 변수를 사용하길 원하면 RStudio의 워크 스페이스를 저장하면 된다. 
# 변수를 별도로 관리해야 한다면 수동으로 파일에 저장하고 불러올 수 있다. 
# 이때 사용하는 함수가 save()와 load() 함수다. save()는 변수를 파일에 저장하는 함수고, load()는 변수를 불러오는 함수다. 

# 다음은 x, y 변수를 save.Rdata 파일에 저장하고 불러오는 예시다. 

x <- c(1, 2, 3)
y <- c(4, 5, 6)

save(x, y, file = "save.Rdata") # save.Rdata 파일에 x와 y 변수 내용 저장

# save() 함수를 사용하여 x와 y 변수를 save.Rdata 파일에 저장했다.

# rm(list = ls())를 사용하여 R 메모리에 있는 모든 변수를 삭제해보자. 
# rm()은 변수를 삭제하는 함수고, ls()는 모든 목록 이름을 반환하는 함수다. 

rm(list = ls()) # 메모리의 변수를 모두 삭제

# 환경 창을 보면 변수가 모두 사라진 것을 확인할 수 있다. 
# 그럼 이번에는 load() 함수를 사용하여 파일로 저장된 변수들을 메모리로 불러와보자.

load("save.Rdata")

# load() 함수를 사용하니 다시 환경 창에 직전에 저장했던 변수들이 생성되었다. 
# 현재 사용 중인 변수를 모두 저장하려면 list = ls() 구문을 응용한다.

x <- c(1, 2, 3)
y <- c(4, 5, 6)
z <- c(7, 8, 9)

save(list = ls(), file = "save2.Rdata") # 현재 변수들을 저장

# NOTE; sink() 함수와 비슷한 cat() 함수

# cat() 함수는 숫자나 문자를 결합하여 출력하는데, 다음과 같이 외부 결과 출력용으로도 응용할 수 있다.

connect <- file("result.txt", "w") # 파일 설정

x1 <- iris $ Sepal.Length

cat(summary(x1), file = connect)

close(connect)

# sink() 함수는 콘솔 창에 출력되는 모든 결과가, cat() 함수는 출력을 원하는 변수의 결과가 외부 파일로 만들어진 것을 알 수 있다. 
# 상황에 따라 적절히 선택하자!

# 4. 데이터 확인

# 데이터를 분석하려면 어떤 데이터로 데이터셋이 어떻게 구성되어 있는지 확인하는 작업이 중요하다. 
# R은 데이터셋을 쉽게 확인할 수 있는 다양한 함수를 제공하는데, 주요 함수는 페이지 179에서 확인가능하다.

# UNIT 4부터 실습은 R에 기본으로 포함된 데이터셋인 iris를 사용할 예정이다.
# iris는 데이터 프레임 구조로 되어 있으며, 붓꽃(iris)의 세 가지 종(species)에 대한 꽃받침(sepal), 꽃입(petal)의 넓이(width)와 길이(length)를 정리한 데이터다(행 150개).
# iris 데이터셋을 자세히 확인해보면 다음 표와 같습니다. 책 페이지 180

# 1) head()와 tail() 함수: 데이터 앞부분과 끝부분 확인하기

# head() 함수: 데이터 앞부분 확인

# head() 함수는 데이터셋의 맨 앞부분을 출력한다. 기본은 6행까지 출력하지만, 옵션을 통해 n행까지 출력이 가능하다. 
# 데이터셋(dataset)이란 데이터가 모여 있는 집합을 의미한다. 
# 즉, 벡터와 데이터 프레임 등 데이터 구조와 관계없이 정보 하나를 이루는 덩어리다. 

head(iris) # 데이터셋의 앞부분을 출력

# 데이터셋의 맨 앞쪽 10행을 보고 싶다면 다음과 같이 입력한다.

head(iris, 10)

# iris 데이터 중 맨 앞쪽 10행이 출력되었다. 

# tail(): 데이터 끝부분 확인

# tail() 함수는 head() 함수와 반대로 데이터셋의 맨 뒤쪽 6행이 기본으로 출력된다. 

tail(iris) # 데이터셋의 뒷부분을 출력

# 출력 행의 조절은 head() 함수와 동일하다. 

tail(iris, 15)

# summary() 함수: 요약 통계량 확인

# summary() 함수는 데이터의 요약 통계량을 출력한다. 
# 요약통계량이란 요약된 통계 값을 의미한다. 
# summary 함수는 데이터를 사전 분석할 때 데이터의 특성을 알고자 자주 사용한다. 

summary(iris)

# 요약 통계량의 의미는 책 페이지 182에서 확인할 수 있다. 

summary(iris $ Sepal.Length)

# 특정 열에 대한 요약 통계량 출력도 $ 기호를 통해서 가능하다. 

# 2) str() 함수: 데이터셋 구조 확인하기

# str() 함수는 데이터셋의 구조를 출력한다. 

str(iris)

# str(iris) 함수를 통해 iris는 열 5개와 행 150개로 구성되어 있으며, 데이터 프레임 구조라는 것을 알 수 있다.
# 각 열 이름과 클래스 데이터 값들도 확인할 수 있다.

# 이처럼 head(), tail(), str() 함수를 조합해서 사용하면 데이터가 어떤 구조로 데이터셋을 구성하는지 알기 쉽다.
# 위 3개의 함수는 사용 빈도가 매우 높다.

# 3) View() 함수: 데이터셋 창을 띄워 확인하기

# View() 함수는 데이터셋 내용을 소스 창 화면에 별도로 띄워준다. 

View(iris)

# 4) dim(), nrow(), ncol() 함수: 데이터 차원, 행, 열 확인하기
# dim(), nrow(), ncol() 함수를 사용하면 각각 차원과 행 개수, 열 개수를 확인할 수 있다.
# 각 함수를 사용해보자.

dim(iris) # 차원을 셈, 150행 5열

nrow(iris) # 행 개수를 셈

ncol(iris) # 열 개수를 셈

# R에서 기본 출력 기준은 행부터라는 사실을 잊지 말자.

# 5) length() 함수: 데이터 길이 세기

# length() 함수는 데이터셋 길이를 센다. 
# 벡터나 리스트 등에서도 사용할 수 있다. 
# 데이터 프레임에서 사용하면 열 길이를 세서 출력한다.

length(iris) # iris 열의 길이를 셈

# 벡터에 대해서 사용하면 벡터 길이를 세어 출력한다. 

x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

x

length(x) # x의 길이를 셈

# 6) ls() 함수: 변수 목록 확인하기

# ls() 함수는 현재 지정된 변수 목록을 반환한다. 해당 내용은 RStudio의 환경설정에서도 확인할 수 있다.

# 변수를 콘솔 창에 출력시켜보자

ls()

# ls() 함수는 단독으로 사용하기도 하지만, 앞서 살펴본 rm() 함수와 조합하여 변수(객체)를 삭제하는 명령어인 rm(list = ls())로도 응용해서 자주 사용한다.

# 7) object.size() 함수: 변수 크기 확인하기

# object.size() 함수를 사용하면 변수 크기를 확인할 수 있다. 
# R은 데이터를 메모리에 올려놓고 작업하기 때문에 동작 능률이나 메모리 한계 등을 이유로 간혹 데이터 크기를 확인해서 작업해야 하는 경우가 있다. 
# 이 경우 object.size() 함수를 사용한다. 

x <- c(1, 2, 3, 4, 5)

object.size(x) # 변수 크기를 확인

# x 변수의 크기는 96바이트로 확인된다. 

# 8) 데이터의 자료형과 데이터 구조를 확인하는 함수들

# 데이터의 자료형이나 데이터 구조를 확인하는 데 is. ~ 계열 함수들을 사용한다. 
# 종류가 많이 있는데 하나씩 살펴보자. 

x <- c(1, 2, 3, 4, 5, 6, 7, 8, NA, 10)

x

is.na(x) # 개별 데이터가 NA인지 확인

is.null(x) # 데이터셋이 null인지 확인

is.numeric(x) # 데이터셋이 숫자형인지 확인

is.character(x) # 데이터셋이 문자형인지 확인

is.logical(x) # 데이터셋이 논리형인지 확인

is.factor(x) # 데이터셋이 팩터 구조인지 확인

is.data.frame(x) # 데이터셋이 데이터 프레임 구조인지 확인

# 변형 예시

y <- c(1, 2, 3, 4, NULL, 6, 7, 8, 9, 10)

y

is.na(y)

is.null(y)

is.character(y)

is.numeric(y)

is.logical(y)

is.factor(y)

is.data.frame(y)

# 예시에서 객체 x는 결측치 하나를 포함한 숫자형 벡터 변수다. 
# 다양한 is.~ 계열 함수를 사용하여 자료형이나 데이터 구조가 어떤 것인지 확인했다. 
# NA 값은 결측치이므로 무시하고 확인한다. 
# 따라서 is.numeric(x)는 TRUE로 결과가 출력된다.

# 출력 결과로 결괏값을 반환하기에, 결괏값을 변수에 할당하거나 함수에 적용하면 데이터 처리 과정에도 응용할 수 있다.
