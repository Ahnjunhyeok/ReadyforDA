a = 1
b = "python"
c = [1, 2, 3]

# 변수를 만들때
# 변수 이름 = 변수에 저장할 값

# 파이썬에서 변수는, 객체를 가리키는 것.

# a 변수가 가리키는 메모리의 주소는 다음과 같이 확인 가능하다. 
# a = [1, 2, 3]
# print(id(a))

# 리스트를 복사할 때
# 리스트 자료형에서 가장 혼동하기 쉬운 '복사' 영역
a = [1, 2, 3]
b = a
print(id(a))
print(id(b))

print(a is b)

a[1] = 4
print(a)
print(b)

# b 변수를 생성할 때 a 변수의 값을 가져오면서 a와는 다른 주소를 가리키도록 만들 수 있다(두가지 방법이 있다).
# 1. [:] 사용
a = [1, 2, 3]
b = a[:]
a[1] = 4
print(a)
print(b)

# 2. copy 모듈 사용
from copy import copy
a = [1, 2 ,3]
b = copy(a)

# 위 예시에서 b = copy(a)는 b = a[:]과 동일하다. 
# 그리고 두 변수가 같은 값을 가지면서 다른 객체를 제대로 생성했는지 확인한다. 
print(a)
print(b)
print(b is a)

# False가 출력되는 걸 통해 b와 a가 가리키는 객체는 서로 다르다는 것을 알 수 있다. 

# 변수를 만드는 여러 가지 방법
a, b = ("python", "life")

(a, b) = "python", "life"

[a, b] = ["python", "life"]

a = b = "python"

a = 3
b = 5
a, b = b , a
print(a)
print(b)

