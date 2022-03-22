# max
# max(iterable)는 인수로 반복가능한 자료형을 입력 받아 그 최댓값을 돌려주는 함수이다. 
print(max([1, 2, 3]))
print(max("python"))

# min
# min(iterable)은 max 함수와 반대로, 인수로 반복 가능한 자료형을 입력받아 그 최솟값을 돌려주는 함수이다. 
print(min([1, 2, 3]))
print(min("python"))

# oct
# oct(x)는 정수 형태의 숫자를 8진수 문자열로 바꾸어 돌려주는 함수이다. 
print(oct(34))
print(oct(12345))

# open
# open(filename, [mode])은 '파일 이름'과 '읽기 방법'을 입력받아 파일 객체를 돌려주는 함수이다. 
# 읽기 방법(mode)을 생력하면 기본값인 읽기 전용 모드(r)로 파일 객체를 만들어 돌려준다. 

# 모드
# 1. w : 쓰기 모드로 파일 열기
# 2. r : 읽기 모드로 파일 열기
# 3. a : 추가 모드로 파일 열기
# 4. b : 바이너리 모드로 파일 열기

# b는 w, r, a와 함께 사용한다. 
f = open("binary_file", "rb")
# 위 예의 rb는 "바이너리 읽기 모드"를 의미한다. 

# 다음 예의 fread와 fread2는 동일한 방법이다. 
fread = open("read_mode.txt", "r")
fread2 = open("read_mode.txt")
# 모드 부분을 생략하면 기본값으로 읽기 모드 r을 갖게 된다. 

# 다음은 추가모드(a)로 파일을 여는 예이다. 
fappend = open("append_mode.txt", "a")

# ord
# ord(c)는 문자의 아스키 코드 값을 돌려주는 함수이다. chr 함수와 반대이다. 
print(ord("a"))
print(ord("0"))

# pow 
# pow(x, y)는 x의 y 제곱한 결괏값을 돌려주는 함수이다. 
print(pow(2, 4))
print(pow(3, 3))

# range
# range는 for문과 함께 자주 사용하는 함수이다. 이 함수는 입력받은 숫자에 해당하는 범위 값을 반복 가능한 객체로 만들어 준다. 
# 1. 인수가 하나일 경우
# 시작 숫자를 지정하지 않으면 range 함수는 0부터 시작한다. 
print(list(range(5)))

# 2. 인수가 2개일 경우
# 입력으로 주어지는 2개의 인수는 시작 숫자와 끝 숫자를 나타낸다. 단 끝 숫자는 해당 범위에 포함되지 않는다는 것에 주의하자. 
print(list(range(5, 10)))

# 인수가 3개일 경우
# 세 번째 인수는 숫자 사이의 거리를 말한다. 
print(list(range(1, 10, 2)))
print(list(range(0, -10, -1)))

# round
# round(number[, ndigits]) 함수는 숫자를 입력받아 반올림해 주는 함수이다. 
print(round(4.6))
print(round(4.2))

# 다음과 같이 실수 5.678을 소수점 2자리까지만 반올림하여 표시할 수 있다. 
print(round(5.678, 2)) 
# round 함수의 두 번째 매개변수는 반올림하여 표시하고 싶은 소수점의 자릿수(ndigits)이다.      

# sorted
# sorted(iterable) 함수는 입력값을 정렬한 후 그 결과를 리스트로 돌려주는 함수이다. 
print(sorted([3, 1, 2]))
print(sorted(["a", "c", "b"]))
print(sorted("zero"))
print(sorted((3, 2, 1)))

# 리스트 자료형에도 sort 함수가 있다. 하지만 리스트 자료형의 sort 함수는 리스트 객체 그 자체를 정렬만 할 뿐 정렬한 결과를 돌려주지는 않는다.     