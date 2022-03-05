# Boolean.py

# 불 자료형이란?
a = True
b = False

print(type(a))
print(type(b))

print(1 == 1)
print(2 > 1)
print(2 < 1)

# 자료형의 참과 거짓
# 문자열, 리스트, 튜플, 딕셔너리 등의 값이 비어있으면("", [], (), {}) 거짓이 된다. 당연히 비어있지 않으면 참이 된다. 
# 숫자형 자료형에서는 그 값이 0일때 거짓이 된다. 위 표를 보면 None이 있는데, 이것에 대해서는 뒷부분에서 배움.

a = [1, 2, 3, 4]
while a: # a가 참인 동안
  a.pop() # 리스트의 마지막 요소를 하나씩 꺼낸다. 
  print(a)

# 조건문이 참인 동안 조건문 안에 있는 문장을 반복해서 수행한다. 
# While 조건문:
  # 수행할 문장
  
# a.pop()을 a가 참인 경우에 a.pop()을 계속 실행하라는 의미다. 
# a.pop() 함수는 리스트 a의 마지막 요소를 끄집어내는 함수이므로 리스트 안에 요소가 존재하는 한(a가 참인 동안)
# 마지막 요소를 계속해서 끄집어낼 것이다. 
# 결국 더 이상 끄집어낼 것이 없으면 a가 빈 리스트([])가 되어 거짓이 된다. 
# 따라서 while문에서 조건이 거짓이 되므로 중지된다. 

if []:
  print("참")
else:
  print("거짓")

# []은 앞의 표에서 볼 수 있듯이 '비어 있는 리스트'이므로 거짓이다. 
# 따라서 '거짓'이란 문자열이 출력된다. 

if [1, 2, 3]:
  print("참")
else:
  print("거짓")

# 코드 해석: 만약 [1, 2, 3]이 참이면 "참"이라면 문자열을 출력하고 그렇지 않으면 "거짓"이라는 문자열을 출력하라. 

# 불 연산
# bool 내장 함수를 사용하면 자료형의 참과 거짓을 식별할 수 있다. 

print(bool("python"))
print(bool(""))

print(bool([1, 2, 3]))
print(bool([]))
print(bool(0))
print(bool(3))