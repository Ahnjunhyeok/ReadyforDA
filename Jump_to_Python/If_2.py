# 다양한 조건을 판단하는 elif

# 주머니에 돈이 있으면 택시를 타고, 주머니에 돈은 없지만 카드가 있으면 택시를 타고, 돈도 없고 카드도 없으면 걸어가라

# 1. if와 else로만 표현하기
pocket = ["paper", "cellphone"]
card = True
if "money" in pocket:
    print("택시를 타고 가라")
else:
    if card:
        print("택시를 타고 가라")
    else:
        print("걸어가라")

# 2. elif를 사용해서 표현하기
pocket = ["paper", "cellphone"]
card = True
if "money" in pocket:
    print("택시를 타고 가라")
elif card:
    print("택시를 타고 가라")
else:
    print("걸어가라")

# 즉, elif는 이전 조건문이 거짓일 때 수행된다. if, elif, else를 모두 사용할 때 기본 구조는 오른쪽과 같다. 
# if 조건문:
    # 수행할 문장 1-1
    # 수행할 문장 1-2

# elif 조건문2:
    # 수행할 문장 2-1
    # 수행할 문장 2-2
# ...

# elif 조건문N:
   # 수행할 문장 N-1
   # 수행할 문장 N-2
   
# elif는 개수에 제한 없이 사용할 수 있다.

# 조건부 표현식
# 아래 코드는 score가 60 이상일 경우 message에 문자열 "success"를, 아닐 경우에는 "failure"를 대입하는 코드다.

score = 90
if score >= 60:
    message = "success"
else:
    message = "failure"
    print(message)
# 파이썬의 조건부 표현식(conditional expression)을 사용하면 위 코드를 다음과 같이 간단히 표현할 수 있다. 
message = "success" if score >= 60 else "failure"
print(message)

# 조건부 표현식은 다음과 같이 정의한다. 
# 조건문이 참인 경우 if 조건문 else 조건문이 거짓인 경우

