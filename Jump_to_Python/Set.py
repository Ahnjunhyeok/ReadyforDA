# Set.py
# 집합 자료형 만들기
s1 = set([1, 2, 3])
print(s1)

# 괄호 안에 리스트를 입력하여 만들거나 문자열을 입력하여 만들 수 있다. 
s2 = set("hello")
print("s2")

# 집합 자료형의 특징
# 1. 중복을 허용하지 않는다.
# 2. 순서가 없다(unordered). 

# 리스트나 튜플은 순서가 있기 때문에(ordered) 인덱싱을 통해 자료형의 값을 얻을 수 있지만 
# set 자료형은 순서가 없기 때문에 인덱싱으로 값을 얻을 수 없다. 
# set 자료형에 저장된 값을 인덱싱으로 접근하려면 다음과 같이 리스트나 튜플로 변환한 후 해야 한다. 

# 리스트로 변환
s1 = set([1, 2, 3])
l1 = list(s1)
print(l1)
print(l1[0])

# 튜플로 변환
t1 = tuple(s1)
print(t1)
print(t1[0])

# 교집합, 합집합, 차집합 구하기
s1 = set([1, 2, 3, 4, 5, 6])
s2 = set([4, 5, 6, 7, 8, 9])

# 1. 교집합
s1 = set([1, 2, 3, 4, 5, 6])
s2 = set([4, 5, 6, 7, 8, 9])
print(s1 & s2)

print(s1.intersection(s2))

# 2. 합집합
s1 = set([1, 2, 3, 4, 5, 6])
s2 = set([4, 5, 6, 7, 8, 9])

print(s1 | s2)
print(s1.union(s2))

# 3. 차집합
s1 = set([1, 2, 3, 4, 5, 6])
s2 = set([4, 5, 6, 7, 8, 9])

print(s1 - s2)
print(s2 - s1)

print(s1.difference(s2))
print(s2.difference(s1))

# 집합 자료형 관련 함수
# 1. 값 1개 추가하기
s1 = set([1, 2, 3])
s1.add(4)
print(s1)

# 2. 값 여러 개 추가하기(update)
s1 = set([1, 2, 3])
s1.update([4, 5, 6])
print(s1)

# 3. 특정 값 제거하기(remove)
s1 = set([1, 2, 3])
s1.remove(2)
print(s1)
