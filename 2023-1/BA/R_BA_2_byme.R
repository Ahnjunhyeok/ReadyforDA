# 230320 BA 

# 1. vector
subject_name <- c("John Doe", "Jane Doe", "Steve Graves")
subject_name

temperature <- c(98.1, 98.6, 101.4)

flu_status <- c(FALSE, FALSE, TRUE)

temperature[2]

temperature[2:3]

temperature[1:3]

temperature

temperature[-2]

temperature[c(TRUE, TRUE, FALSE)] # 처음 두 개의 temperature 판독 값은 포함하고 세 번째는 제외함.
# TRUE라고 되어있는 위치의 값만 불러옴.

# 2. factor
gender <- factor(c("MALE", "FEMALE", "MALE")) # vector로 만들고, factor로 저장
gender

blood <- factor(c("O", "AB", "A"),
                levels = c("A", "B", "AB", "O"))
blood

# factor는 Levels 값을 따로 생성해줌

help("levels")

# 3. list; 항목의 순서 집합을 저장하는 데 사용된다는 점에서 vector와 매우 유사함

subject1 <- (list(fullname = subject_name[1],
                  temperature = temperature[1],
                  flu_status = flu_status[1],
                  gender = gender[1], 
                  blood = blood[1]))

subject1[2]

subject1 $temperature

subject1[c("temperature", "flu_status")]

# $는 하위 구조 표시할 때 사용 - 하위 구조 직접 불러올 수 있음

subject1[]
