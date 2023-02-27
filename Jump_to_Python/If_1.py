# 제어문
# 우리 일상생활에서는, 주어진 조건을 판단한 후 그 상황에 맞게 처리해야 할 경우가 생긴다. 

# 프로그래밍에서 조건을 판단하여 해당 조건에 맞는 상황을 수행하는 데 쓰는 것이 바로 if 문이다.
# Example
money = True
if money:
    print("택시를 타고 가라")
else:
    print("걸어가라")
    
# if 문의 기본 구조
# if 조건문:
    # 수행할 문장 1
    # 수행할 문장 2
# ...
# else:
    # 수행할 문장 A
    # 수행할 문장 B

# 조건문을 테스트해서 참이면 if문 바로 다음 문장(if 블록들)들을 수행하고, 조건문이 거짓이면 else문 다음 문장들을 수행하게 된다.

# 중요 point ! : else문은 if문 없이 독립적으로 사용할 수 없다. 
# if 문을 만들 때는 if 조건문: 바로 아래 문장부터 if 문에 속하는 모든 문장에 들여쓰기를 해줘야 한다. 
# 수행할 문장에 들여쓰기를 걸어주는 것이다. 

# 들여쓰기는 언제나 같은 너비로 해야한다. 

# 조건문 뒤에는 반드시 콜론이 붙는다. 어떤 특별한 의미가 있다기보다는 파이썬의 문법 구조니 기억해야한다. 

# 조건문이란 무엇인가?
# if 조건문에서 '조건문'이란 참과 거짓을 판단하는 문장을 말한다. 
# 앞서 등장한 예시에서 조건문은 money가 된다. 

# 비교 연산자 (헷갈릴 만한 것들)
# x == y : x와 y가 같다.
# x != y : x와 y가 같지 않다. 

# ex
x = 3
y = 2
print(x > y)
print(x < y)
print(x == y)
print(x != y)

# 택시 예제 변형해보기
# 만약 3000원 이상의 돈을 가지고 있으면 택시를 타고 그렇지 않으면 걸어가라.
money = 2000
if money >= 3000:
    print("택시를 타고 가라")
else:
    print("걸어가라")
# 조건문이 거짓이 되기 때문에 else문장을 수행할 것이다.

# and, or, not
# 조건을 판단하기 위해 사용하는 다른 연산자

# x or y : x와 y 둘 중에 하나만 참이어도 참이다.
# x and y : x와 y 모두 참이어야 참이다.
# not x : x가 거짓이면 참이다.

# 예시
# 돈이 3000원 이상 있거나 카드가 있다면 택시를 타고 그렇지 않으면 걸어가라.
money = 2000
card = True
if money >= 3000 or card:
    print("택시를 타고 가라")
else:
    print("걸어가라")
    
money = 2000
card = False
if money >= 3000 or card:
    print("택시를 타고 가라")
else:
    print("걸어가라")

# x in s, x not in s
# 파이썬에서만 볼 수 있는 조건문
# x in 리스트, x not in 리스트
# x in 튜플, x not in 튜플
# x in 문자열, x not in 문자열

print(1 in [1, 2, 3])
print(1 not in [1, 2, 3])

print("a" in ("a", "b", "c"))
print("j" not in "python")

# 택시 예제에 적용해보기
pocket = ["paper", "cellphone", "money"]
if "money" in pocket:
    print("택시를 타고 가라")
else:
    print("걸어가라")
        
pocket = ["paper", "cellphone"]
if "money" not in pocket:
    print("걸어가라")
else:
    print("택시를 타고 가라")

# 나혼자 코딩!
# '주머니에 카드가 없다면 걸어가고, 있다면 버스를 타고 가라'는 문장을 조건문으로 만들어라

pocket = ["phone", "cellphone", "card", "money"]
if "card" not in pocket:
    print("걸어가라")
else:
    print("버스를 타고 가라")
    
