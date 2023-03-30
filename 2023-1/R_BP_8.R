# 230330 경영프로그래밍

setwd("C:/Users/user/Desktop/R_BP") # 시험시 워킹 디렉토리를 지정한 곳으로 정해야함.

install.packages("tidyverse")
library(tidyverse)

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

y <- read_excel("./r_practice/reservation_r_excel.xlsx")

y

head(y)

# 2) write.csv(), write_excel() 함수: 데이터 내보내기

# 데이터를 내보낼 때는 write.csv()와 write_excel() 함수를 사용한다. 
# 먼저 write.csv() 함수로 데이터 프레임을 csv 파일로 내보내보자. 

write.csv(x, "csv_output.csv") # x에 객체로 저장했기 때문에 책과 다르게 x로 불러와야함.

write.csv(y, "csv_ouput_by_excel.csv")

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

# 데이터프레임 만들기

# 3행 이상, 열에는 이름, 지역, 학점, 취미

# 위와 같이 데이터 프레임을 만들고 class.xlsx라는 이름으로 엑셀 파일을 생성하시오

name <- c("이수민", "안준혁", "안범진", "최정원")
city <- c("Seoul", "Busan", "Jinju", "Guri")
grade <- c("A-", "A+", "A0", "A0")
hobby <- c("fitness", "Baseball", "Basketball", "Soccer")

df1 <- data.frame(name, city, grade, hobby)

write_xlsx(df1, "class.xlsx")
