# 내장 함수_2
# hex 
# hex(x)는 정수 값을 입력받아 16진수로 변환하여 돌려주는 함수이다. 
print(hex(234))
print(hex(3))

# id
# id(object)는 객체를 입력받아 객체의 고유 주소 값(레퍼런스)을 돌려주는 함수이다.
a = 3
print(id(3))
print(id(a))
b = a
print(id(b))

# 위 예의 3, a, b는 고유 주소 값이 모두 동일하다. 즉 3, a, b가 모두 같은 객체를 가리키고 있다. 
# 만약 print(id(4))라고 입력하면 다른 고유 주소 값이 출력된다. 

# input
# input([prompt])은 사용자 입력을 받는 함수이다. 
# 매개변수로 문자열을 주면 다음 세 번째 예에서 볼 수 있듯이 그 문자열은 프롬프트가 된다. 

a = input() # 사용자가 입력한 정보를 변수 a에 저장
print(a)
b = input("Enter: ") # Enter: 프롬프트를 띄우고 사용자 입력을 받음 
print(b)

# int
# int(x)는 문자열 형태의 숫자나 소수점이 있는 숫자 등을 정수 형태로 돌려주는 함수로, 정수를 입력으로 받으면 그대로 돌려준다. 
print(int("3")) # 문자열 형태 '3' 
print(int(3.4))

# int(x, radix)는 radix 진수로 표현된 문자열 x를 10진수로 변환하여 돌려준다. 
# 2진수로 표현된 11의 10진수 값은 다음과 같다. 
print(int("11", 2))

# 16진수로 표현된 1A의 10진수 값은 다음과 같이 구한다. 
print(int("1A", 16))

# isinstance
# isinstance(object, class)는 첫번째 인수로 인스턴스, 두번째 인수로 클래스 이름을 받는다. 
# 입력으로 받은 인스턴스가 그 클래스의 인스턴스인지를 판단하여 참이면 True, 거짓이면 False를 돌려준다. 

class Person: pass 

a = Person()
print(isinstance(a, Person))

# 위 예는 a가 Person 클래스가 만든 인스턴스임을 확인시켜준다. 

b = 3
print(isinstance(b, Person))
# b는 Person 클래스가 만든 인스턴스가 아니므로 False를 돌려준다. 

# len
# len(s)는 입력값 s의 길이(요소의 전체 개수)를 돌려주는 함수이다. 
print(len("Python"))
print(len([1, 2, 3]))
print(len((1, "a")))

# list
# list(s)는 반복 가능한 자료형 s를 입력받아 리스트로 만들어 돌려주는 함수이다. 
print(list("python"))
print(list((1, 2, 3)))

# list 함수에 리스트를 입력으로 주면 똑같은 리스트를 복사하여 돌려준다. 
a = [1, 2, 3]
b = list(a)
print(b)

# map
# map(f, iterable)은 함수(f)와 반복 가능한(iterable) 자료형을 입력으로 받는다.
# map은 입력받은 자료형의 각 요소를 함수 f가 수행한 결과를 묶어서 돌려주는 함수이다. 
def two_times(numberList):
    result = []
    for number in numberList:
        result.append(number*2)
    return result

result = two_times([1, 2, 3, 4])
print(result)

# two_times 함수는 리스트 요소를 입력받아 각 요소에 2를 곱한 결괏값을 돌려준다. 

# 위 예제는 map 함수를 사용하면 다음처럼 바꿀 수 있다. 
def two_times(x): return x*2

print(list(map(two_times, [1, 2, 3, 4])))

# lambda를 사용하면 다음처럼 간략하게 만들 수 있다. 
print(list(map(lambda a: a*2, [1, 2, 3, 4])))
