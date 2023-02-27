# for.py
# for문의 기본구조
# for 변수 in 리스트(또는 튜플, 문자열):
  # 수행할 문장 1
  # 수행할 문장 2

# 예제
# 1. 전형적인 for문
test_list = ["one", "two", "three"]
for i in test_list: # one, two, three를 순서대로 i에 대입
  print(i) # 리스트의 마지막 요소까지 이것을 반복한다. 

# 2. 다양한 for문의 사용
a = [(1, 2), (3, 4), (5, 6)]
for (first, last) in a:
  print(first + last)
# a 리스트의 요솟값이 튜플이기 때문에 각각의 요소가 자동으로 (first, last) 변수에 대입된다. 

# 3. for문의 응용
# 예시
# 총 5명의 학생이 시험을 보았는데, 시험 점수가 60점이 넘으면 합격이고 그렇지 않으면 불합격이다. 합격인지 불합격인지 결과를 보여 주시오.
marks = [90, 25, 67, 45, 80] # 학생들의 시험 점수 리스트
number = 0 # 학생들에게 붙여줄 번호
for mark in marks: # 90, 25, 67, 45, 80을 순서대로 mark에 대입
  number = number + 1
  if mark >= 60:
    print("%d번 학생은 합격입니다." % number)
  else:
    print("%d번 학생은 불합격입니다." % number)

# for문과 continue문
# while문에서 살펴본 continue문을 for문에서도 사용할 수 있다. 
# 앞선 예제에서 60점 이상인 사람에게는 축하 메시지를 보내고 나머지 사람에게는 아무 메시지도 전하지 않는 프로그램을 만들어본다.
marks = [90, 25, 67, 45, 80] 
number = 0 
for mark in marks: 
  number = number + 1
  if mark < 60: continue
  print("%d번 학생 축하합니다. 합격입니다. " % number) 

# for문과 함께 자주 사용하는 range 함수
# for문은 숫자 리스트를 자동으로 만들어 주는 range 함수와 함께 사용하는 경우가 많다. 
# range의 간단한 사용법
a = range(10)
print(a)

# range(10)은 0부터 10 미만의 숫자를 포함하는 range 객체를 만들어준다. 

# 시작 숫자와 끝 숫자를 지정하려면 range(시작 숫자, 끝 숫자) 형태를 사용하는데, 이때 끝 숫자는 포함되지 않는다. 
a = range(1, 11)
print(a)

# range 함수의 예시 
add = 0
for i in range(1, 11):
  add = add + i
  print(add)
# range(1, 11)은 숫자 1부터 10까지(1 이상 11 미만)의 숫자를 데이터로 갖는 "객체"이다.
# 따라서 위 예에서 i 변수에 리스트의 숫자가 1부터 10까지 하나씩 차례로 대입되면서 add = add + i 문장을 반복적으로 수행하고 add는 최종적으로 55가 된다.

# 점수 예시에 내용 추가
marks = [90, 25, 67, 45, 80] 
for number in range(len(marks)):
  if marks[number] < 60: continue # 점수가 60점 미만이면 맨 처음으로 돌아간다. 
  print("%d번 학생 축하합니다. 합격입니다." % (number + 1))

# len 함수는 리스트 안의 요소 개수를 돌려주는 함수이다. 
# 따라서 len(marks)는 5가 될 것이다. 그리고 range(len(marks))는 range(5)가 될 것이다.
# number 변수에는 차례로 0부터 4까지의 숫자가 대입될 것이고, marks[number]는 차례대로 90, 25, 67, 45, 80 값을 갖게 된다. 

# for와 range를 사용한 구구단
for i in range(2, 10): # 1번 for문
  for j in range(1, 10): # 2번 for문
    print(i*j, end=" ")
  print("")
# 1번 for문에서 2부터 9까지의 숫자가 차례로 i에 대입된다. i가 처음 2일때 2번 for문을 만난다. 2번 for문에서 1부터 9까지의 숫자가 j에 대입되고 그 다음 문장 print(i*j)를 수행한다.

# 리스트 내포 사용하기
# 리스트 안에 for문을 포함하는 리스트 내포를 사용하면 좀 더 편리하고 직관적인 프로그램을 만들 수 있다.
# before
a = [1, 2, 3, 4]
result = []
for num in a:
  result.append(num*3)
print(result)

# after 
a = [1, 2, 3, 4]
result = [num * 3 for num in a]
print(result)

# 짝수에만 3을 곱하여 담고 싶다면 다음과 같이 리스트 내포 안에 'if 조건'을 사용할 수 있다.
a = [1, 2, 3, 4]
result = [num * 3 for num in a if num % 2 == 0]
print(result)

# 리스트 내포의 일반 문법
# [표현식 for 항목 in '반복 가능 객체' if 조건]
# for문을 여러 번 사용하는 것도 가능하다. 
# [표현식 for 항목1 in '반복 가능 객체1' if 조건1]
# [표현식 for 항목2 in '반복 가능 객체2' if 조건2]
# [표현식 for 항목3 in '반복 가능 객체3' if 조건3]
# ...
# [표현식 for 항목n in '반복 가능 객체n' if 조건n]

# 구구단 예시에 리스트 내포 사용하기
result = [x*y for x in range(2, 10)
  for y in range(1, 10)]
print(result)

# for문을 while문으로, while문을 for문으로 바꿀 수 있다. 

