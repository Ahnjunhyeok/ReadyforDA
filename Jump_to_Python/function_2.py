# function_2.py
# 매개변수 지정하여 호출하기
def add(a, b):
  return a + b

result = add(a=3, b=7)
print(result)

# 매개변수를 지정하면 순서에 상관없이 사용할 수 있다는 장점이 있다. 
result = add(b=5, a=3)
print(result)

# 입력값이 몇 개가 될지 모를때
# 일반적으로 볼 수 있는 함수 형태에서 괄호 안의 매개변수 부분이 *매개변수로 바꾼다.
# def 함수이름(*매개변수):
#   수행할 문장
#   ...

# 여러 개의 입력값을 받는 함수 만들기
def add_many(*args):
  result = 0
  for i in args:
    result = result + i # *args에 입력받은 모든 값을 더한다. 
  return result

result = add_many(1, 3, 4, 5, 6) # add_many 함수의 결괏값을 result 변수에 대입
print(result)

# 여러 개의 입력값을 받는 함수 만들기 2
def add_mul(choice, *args):
  if choice == "add":
    result = 0
    for i in args:
      result = result + i
  elif choice == "mul":
    result = 1
    for i in args:
      result = result * i
  return result

result = add_mul("add", 1, 2, 3, 4, 5)
print(result)

result = add_mul("mul", 1, 2, 3, 4, 5)
print(result)

# 함수의 결괏값은 언제나 하나이다. 
def add_and_mul(a, b):
  return a+b, a*b

result = add_and_mul(3, 4)
print(result) # 결괏값 a+b와 a*b의 값을 튜플 값 하나인 (a+b, a*b)로 돌려준다. 

result1, result2 = add_and_mul(3, 4)
print(result1, result2)

def add_and_mul(a, b):
  return a + b
  return a * b

result = add_and_mul(2, 3)
print(result)

# add_and_mul(2, 3)의 결괏값은 5 하나 뿐이다. 두 번째 return문인 a * b는 실행되지 않았다. 

# 함수는 return문을 만나는 순간 결괏값을 돌려준 다음 함수를 빠져나가게 된다. 

# 매개변수에 초깃값 미리 설정하기
def say_myself(name, old, man=True):
  print("나의 이름은 %s입니다." % name)
  print("나이는 %d살입니다." % old)
  if man:
    print("남자입니다.")
  else:
    print("여자입니다.")
# say_myself 함수는 3개의 매개변수를 받아서 마지막 인수인 man이 True이면 "남자입니다.", False이면 "여자입니다."를 출력한다.
# man=True가 매개변수에 미리 값을 넣어준 것이다. 

say_myself("박응용", 27)
say_myself("박응용", 27, False)

# 매개변수 초깃값 설정시 주의 사항
# 초깃값을 설정해 놓은 매개변수 뒤에 초깃값을 설정해놓지 않은 매개변수는 사용할 수 없다. 
# 초기화 시키고 싶을 때는 시키고 싶은 매개변수를 항상 뒤쪽에 놓는 것을 잊지말자.

# 함수 안에서 선언한 변수의 효력 범위 
a = 1 # 함수 밖의 변수 a
def vartest(a): # vartest 함수 선언
  a = a + 1

vartest(a) # vartest 함수의 입력값으로 a를 줌
print(a) # a 값 출력

# 함수 안에서 사용하는 매개변수는 함수 밖의 변수 이름과는 전혀 상관이 없다. 
def vartest(a):
  a = a + 1

vartest(3)
print(a)

# 위 같이 실행하게 되면 print(a) 문장은 오류가 발생한다. 그 이유는 print(a)에서 입력받아야 하는 a 변수를 찾을 수 없기 때문이다. 
# 정리하자면, 함수 안에서 선언한 매개변수는 함수 안에서만 사용될 뿐 함수 밖에서는 사용되지 않는다. 

# 함수 안에서 함수 밖의 변수를 변경하는 방법
# 1. return 사용하기
a = 1
def vartest(a):
  a = a + 1
  return a

a = vartest(a) # vartest(a)의 결괏값을 함수 밖의 변수 a에 대입
print(a)

# global 명령어 사용하기(전역변수로 만들기)
a = 1
def vartest():
  global a
  a = a + 1

vartest()
print(a)

# lambda
# lambda는 함수를 생성할 때 사용하는 예약어로 def와 동일한 역할을 한다. 보통 함수를 한줄로 간결하게 만들 때 사용한다. 
# lambda 매개변수1, 매개변수2, ... : 매개변수를 사용한 표현식

add = lambda a, b: a + b
result= add(3, 4)
print(result)

def add(a, b):
  return a + b

result = add(3, 4)
print(result)

# 위 두 함수는 완전히 동일하다. 
