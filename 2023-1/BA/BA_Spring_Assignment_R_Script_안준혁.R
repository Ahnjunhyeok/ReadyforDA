# Part 1

# 1.1

GDP.rate <- c(3.2, 2.9, 2.2, -0.7, 4.1, 2.6)            # 경제성장률 지표를 GDP.rate 객체에 할당
years <- c(2017, 2018, 2019, 2020, 2021, 2022)          # 해당년도를 years 객체에 할당

for (i in 1:length(GDP.rate)) {                         # for 명령문 시작, x는 1부터 GDP.rate 객체의 벡터 길이인 6까지 반복.
  cat(years[i], "년도 경제성장률", GDP.rate[i], "%\n")  # 년도(2017 ~ 2022)와 "년도 경제성장률" 문자열, 성장률(숫자형), "%" 기호를 cat() 함수로 결합하여 출력, \n은 줄바꿈 정규식
  }                                                     # 명령문 종료


# 1.2

# (1) for문만을 이용해서 2단 ~ 9단 구구단 만들기

for (x in 2:9) {                     # x에 대한 for 명령문 시작, x는 2부터 9까지 반복 
  cat("--", x, "단---", "\n")         # 새로운 단이 시작될 때마다 "--n단--" 출력
  for (y in 1:9) {                   # y에 대한 for 명령문 시작, y는 1부터 9까지 반복     
    cat(x, "*", y, "=", x * y, "\n") # 실행문 입력, x와 "*" 문자열, y, "=" 문자열, x * y 결과값을 cat() 함수를 활용하여 순서대로 결합, \n은 줄바꿈 정규식 
  }                                 
}                                    # 명령문 종료


# (2) while문만을 이용해서 구구단 만들기

x <- 2                               # x에 초깃값 2를 할당(2단부터 시작하기 때문이다)
y <- 1                               # y에 초깃값 1을 할당(구구단 값이 2 * 1 ~ 2 * 9와 같은 구성이기 때문이다)

while (x <= 9) {                     # x는 기존에 할당된 2부터 9까지만 출력되도록 while 명령문 구성
  cat("--", x, "단---", "\n")        # 새로운 단이 시작될 때마다 "--n단--" 출력
  while (y <= 9) {                   # y는 기존에 할당된 1부터 9까지만 출력되도록 while 명령문 구성
    cat(x, "*", y, "=", x * y, "\n") # x와 "*" 문자열, y, "=" 문자열, x * y의 결괏값을 cat() 함수를 활용하여 순서대로 결합
    y <- y + 1   }                   # y는 초깃값 1부터 1씩 증가하여 9까지 증가
  x <- x + 1                         # x는 초깃값 2부터 1씩 9까지 증가
  y <- 1                             # 내부 while 루프가 끝나면 y를 다시 1로 초기화
  }


# 1.3 

# 문제가 중의적이라고 판단하여 두 가지 측면에서 해석해보았습니다.

# (1) 돼지갈비 5인분 당 음료 1개를 서비스로 주는 경우(즉 돼지갈비 5n인분을 주문하면 서비스 음료 n개)

# by Chatgpt

total_price <- function(n, k) {                 # 전체 가격을 계산하는 사용자 정의 함수 할당, n은 돼지갈비 주문량, k는 음료 주문량
  pork_price <- 15000 * n                       # 돼지고기의 가격 pork_price 객체 할당
  free_drink <- (n %/% 5)                       # 무료 음료 free_drink 객체 할당, 5인분 당 1개 제공, %/% 연산자 활용(나누기의 몫 출력)
  drink_price <- 3000 * (k - free_drink)        # 음료 가격 drink_price 객체 할당, free_drink 음료 갯수는 제외
    if (drink_price < 0)                        # 음료 가격이 음수인 경우 (무료 음료가 주문한 음료보다 많을 때)
        drink_price <- 0                        # 음료 가격을 0으로 설정 (음료 가격이 음수가 되지 않도록)    
        total_price <- pork_price + drink_price # 돼지갈비 가격과 음료 가격을 더해 total_price 객체에 할당
    return(total_price)                         # 총 가격(total_price) 반환
    }

total_price(13, 4)
           
# revising chatgpt's code

total_price <- function(n, k) {                          # 전체 가격을 계산하는 사용자 정의 함수 할당, n은 돼지갈비 주문량, k는 음료 주문량
  pork_price  <- n * 15000                               # 돼지고기의 가격 pork_price 객체 할당
  drink_price <- k * 3000                                # 음료 가격 drink_price 객체 할당, chatgpt 코드와 달리 무료 제공 음료의 값은 포함하지 않음
  free_drinks <- floor(n / 5)                            # 무료 음료 개수 계산 (돼지갈비 주문량 / 5), 정수값만 출력하는 floor() 함수 활용
  return (pork_price + drink_price - free_drinks * 3000) # 돼지갈비 가격 + 음료 가격 - 무료 음료 할인 금액 반환
  }

total_price(13, 4)

# chatgpt에서는 if 명령문을 활용하여 사용자 정의 함수 코드를 작성했다.
# 완전한 오답이라고 생각하지는 않지만, if문을 사용하지 않고 내장함수인 floor()를 활용해서 코드를 수정했다.

# (2) 돼지갈비 5인분 이상을 시키면 서비스 음료수 1개를 주는 경우(즉 돼지갈비 5n인분을 주문하면 서비스 음료 n개가 아님. 5인분 이상을 먹었다면 음료를 오로지 1개 제공한다는 뜻)
# by Chatgpt

pork_price <- 15000                         # 돼지갈비 가격 설정(1인분에 15000원)
drink_price <- 3000                         # 음료 가격 설정(1개에 3000원)

total_price <- function(n, k) {             # 전체 가격을 계산하는 사용자 정의 함수 할당, n은 돼지갈비 주문량, k는 음료 주문량
  if (n >= 5) {                             # 돼지갈비 주문량이 5 이상인 경우
    k <- k + 1                              # 음료 주문량에 1을 더함 (무료 음료 1개 추가)
  }
  return (n * pork_price + k * drink_price) # 돼지갈비 가격 + 음료 가격을 계산하여 반환
}

total_price(13, 4)

# revising chatgpt's code

pork_price <- 15000                                # 돼지갈비 가격 설정(1인분에 15000원)
drink_price <- 3000                                # 음료 가격 설정(1개에 3000원)

total_price <- function(n, k) {                    # 전체 가격을 계산하는 사용자 정의 함수 할당, n은 돼지갈비 주문량, k는 음료 주문량    
  free_drink <- 0                                  # 돼지갈비를 몇인분 주문했는지 모르기에 우선 초깃값을 0으로 설정
  if (n >= 5) {                                    # 돼지갈비 주문량이 5 이상인 경우
    free_drink <- 1                                # 무료 음료 개수를 1로 설정
  }
  k <- k + free_drink                              # 음료 주문량에 무료 음료 개수를 더함
  return (n * pork_price + k * drink_price - 3000) # 돼지갈비 가격 + 음료 가격 - 무료 음료 할인 금액 반환
}

total_price(13, 4)

# 1.4 
# by Chatgpt

# 함수 정의

support_clubs <- function(requests, budget) {
  # 지원할 수 있는 동아리 개수 초기화
  supported_clubs <- 0
  # 동아리 요청 금액 정렬
  sorted_requests <- sort(requests)
  # 총 지원 금액
  total_expenses <- 0
  
  # 각 동아리의 요청 금액을 순회하며
  for (i in 1:length(sorted_requests)) {
    # 총 지원 금액을 갱신
    total_expenses <- total_expenses + sorted_requests[i]
    # 총 지원 금액이 예산 이하이면
    if (total_expenses <= budget) {
      # 지원할 수 있는 동아리 개수 증가
      supported_clubs <- supported_clubs + 1
    } else {
      # 예산을 초과하면 반복문 종료
      break
    }
  }
  
  # 지원할 수 있는 동아리 개수 반환
  return(supported_clubs)
}

supported_clubs

# revising chatgpt's code 

a <- c(1, 4, 5, 3, 2)                                                    # 각 동아리 별 운영비 신청금액이 담긴 벡터
b <- 12                                                                  # 예산

n_clubs <- length(club_funds)                                            # 동아리의 수
supported_clubs <- 0                                                     # 지원할 수 있는 동아리의 수
sorted_clubs <- sort(club_funds)                                         # 벡터를 오름차순으로 정렬
current_budget <- budget                                                 # 현재 예산

while (current_budget > 0 && supported_clubs < n_clubs) {                # while 문을 사용하여 예산이 남아있는 한 계속 동아리를 지원
  current_budget <- current_budget - sorted_clubs[supported_clubs + 1]   
  if (current_budget >= 0) {
    supported_clubs <- supported_clubs + 1
  }
}

cat(paste("최대", supported_clubs, "개 동아리 지원 가능"))               # 최대 지원 가능한 동아리의 수 출력

 
# Part 2

# 2.1 
# by Chatgpt

total_bakkas_cans <- function(n, a, b) {       # total_bakkas_cans 함수 정의, 입력 인자는 n(빈 박카스 병의 수), a(필요한 빈 병 갯수), b(새로 받은 병 갯수)
  received_cans <- 0                           # 받을 수 있는 병 갯수를 0으로 초기화
   
  while (n >= a) {                             # 빈 병 수(n)가 필요한 빈 병 수(a) 이상인 동안 while 문을 실행
    new_cans <- n %/% a * b                    # 새로운 병 수(new_cans)를 계산하기 위해 현재 빈 병 수(n)를 a로 나눈 몫에 b를 곱함
    n <- new_cans + (n %% a)                   # n을 업데이트하며, 새로운 병 수(new_cans)와 현재 빈 병 수(n)을 a로 나눈 나머지를 더함
    received_cans <- received_cans + new_cans  # 받을 수 있는 병의 수(received_cans)에 새로운 병 수(new_cans)를 누적하여 더함
  }
  
  return(received_cans)                        # 받을 수 있는 병의 총 갯수(received_cans)를 반환
}

total_bakkas_cans(21, 10, 5)


# revising chatgpt's code 
 
total_bakkas_cans <- function(n, a, b) {                    # total_bakkas_cans 함수 정의, 입력 인자는 n(빈 박카스 병의 수), a(필요한 빈 병 갯수), b(새로 받은 병 갯수)
  if (a < 2) {                                              # 빈 병의 갯수가 2 미만일 경우 오류 처리
    stop("오류! 병의 갯수가 2보다 크거나 같아야 합니다.")   # stop() 함수로 if 명령문 실행을 멈춤
  }
  
  received_cans <- 0                                        # 총 받을 수 있는 박카스 병의 수 초기화
  
  while (n >= a) {                                          # 빈 병의 수가 a 이상인 동안 반복
    new_cans <- n %/% a * b                                 # 교환 가능한 빈 병의 수에 따라 새로운 박카스 병 갯수 계산
    n <- new_cans + (n %% a)                                # 새로운 박카스 병 갯수와 교환하지 못한 빈 병의 수를 합해 n 갱신
    received_cans <- received_cans + new_cans               # 총 받을 수 있는 박카스 병의 수에 새로운 박카스 병 갯수 누적
  }
  
  return(received_cans)                                     # 총 받을 수 있는 박카스 병 갯수 반환
}

total_bakkas_cans(200, 100, 30)

# 2.2
# by Chatgpt

tictactoe_winner <- function(board) {                                                                # 틱택토 승자를 결정하는 함수 정의
  if (length(board) != 9) {                                                                          # 보드의 요소가 9개가 아닌 경우
    stop("Error: The board should have exactly 9 elements.")                                         # 오류 메시지 출력 후 함수 종료
  }
                                                              
  winning_positions <- list(c(1, 2, 3), c(4, 5, 6), c(7, 8, 9),                                      # 승리 조건 위치 리스트 생성
                            c(1, 4, 7), c(2, 5, 8), c(3, 6, 9),
                            c(1, 5, 9), c(3, 5, 7))
  
  for (positions in winning_positions) {                                                             # 각 승리 조건 위치에 대해 반복
    if (board[positions[1]] == board[positions[2]] && board[positions[2]] == board[positions[3]]) {  # 같은 기호가 연속되는지 확인
      if (board[positions[1]] == "O") {                                                              # 기호가 'O'인 경우
        return("O")                                                                                  # 'O' 반환
      } else if (board[positions[1]] == "X") {                                                       # 기호가 'X'인 경우
        return("X")                                                                                  # 'X' 반환
      }
    }
  }
  
  return("")                                                                                         # 승자가 없는 경우 빈 문자열 반환
}

board <- c("O", "X", "O",          # 임의의 경우의 수를 board 객체에 할당
           "O", "X", "",
           "X", "X",  "")

winner <- tictactoe_winner(board)  # 승자를 알기 위해 winner 객체에 tictactoe_winner 함수 할당

winner                             # 결괏값: "X"


# revising chatgpt's code 

tictactoe_winner <- function(board) {                                                                # 틱택토 승자를 결정하는 함수 정의
  if (length(board) != 9) {                                                                          # 보드의 요소가 9개가 아닌 경우
    stop("오류! 보드의 요소가 9개가 아닙니다.")                                                      # 오류 메시지 출력 후 함수 종료
  }
  
  winning_positions <- list(                                                                         # 승리 조건 위치 목록 생성
    c(1, 2, 3), c(4, 5, 6), c(7, 8, 9),
    c(1, 4, 7), c(2, 5, 8), c(3, 6, 9),
    c(1, 5, 9), c(3, 5, 7)
  )
  
  num_O <- sum(board == "O")                                                                         # 'O'의 개수를 계산
  num_X <- sum(board == "X")                                                                         # 'X'의 개수를 계산
  
  if (abs(num_O - num_X) > 1) {                                                                      # 'O'와 'X'의 개수 차이가 1보다 큰 경우
    return("해당 게임은 규칙을 어긴 게임입니다.")                                                    # 규칙을 어긴 게임임을 반환
  }
  
  winner <- ""                                                                                       # 승자를 저장할 변수 초기화
  for (positions in winning_positions) {                                                             # 각 승리 조건 위치에 대해 반복
    if (board[positions[1]] == board[positions[2]] && board[positions[2]] == board[positions[3]]) {  # 같은 기호가 연속되는지 확인
      if (board[positions[1]] == "O") {                                                              # 기호가 'O'인 경우
        winner <- "O"                                                                                # 'O'를 승자로 저장
      } else if (board[positions[1]] == "X") {                                                       # 기호가 'X'인 경우
        winner <- "X"                                                                                # 'X'를 승자로 저장
      }
    }
  }
  
  if (winner == "O") {                                                                               # 승자가 'O'인 경우
    return("승자는 O 입니다.")                                                                       # "승자는 O 입니다." 반환
    } else if (winner == "X") {                                                                      # 승자가 'X'인 경우
    return("승자는 X 입니다.")                                                                       # "승자는 X 입니다." 반환
    } else {                                                                                         # 승자가 없는 경우
    return("아직 승자가 정해지지 않았습니다.")                                                       # "아직 승자가 정해지지 않았습니다." 반환
    }
}

board1 <- c("O", "O", "O", "X", "X", "O", "X", "*", "*")  # 임의의 경우의 수를 board1 ~ 4 객체에 할당
result1 <- tictactoe_winner(board1)                       # result1에 tictactoe_winner() 함수 할당
result1  # 출력값: "승자는 O 입니다."                     # 결괏값 출력

board2 <- c("O", "X", "O", "O", "X", "*", "*", "X", "*")  # 이하 해당 과정을 반복
result2 <- tictactoe_winner(board2)
result2  # 출력값: "승자는 X 입니다."

board3 <- c("O", "X", "O", "*", "X", "*", "*", "*", "*")
result3 <- tictactoe_winner(board3)
result3  # 출력값: "아직 승자가 정해지지 않았습니다."

board4 <- c("O", "O", "O", "O", "X", "O", "X", "*", "*")
result4 <- tictactoe_winner(board4)
result4  # 출력값: "해당 게임은 규칙을 어긴 게임입니다."

