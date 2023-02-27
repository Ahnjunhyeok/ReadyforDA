# String_6.py

# 문자 개수 세기(count)
a = "hobby"
a.count("b")
print(a.count("b"))

# 위치 알려주기 1(find)
a = "Python is the best choice"
print(a.find("b"))
print(a.find("k")) # 찾는 문자나 문자열이 존재하지 않는다면 -1을 반환한다. 

# 위치 알려주기 2(index)
a = "Life is too short."
print(a.index("t"))
# print(a.index("k")) # index는 찾는 문자나 문자열이 없으면 '오류'를 발생시킨다.

# 문자열 삽입(join)
print(",".join("abcd"))

# join 함수는 문자열 뿐만 아니라 앞으로 배울 리스트나 튜플도 입력으로 사용할 수 있다. 
print(",".join(["a", "b", "c", "d"])) 

# 소문자를 대문자로 바꾸기(upper)
a = "hi"
print(a.upper())

# 대문자를 소문자로 바꾸기(lower)
a = "HI"
print(a.lower())

# 왼쪽 공백 지우기(lstrip)
a = " hi "
print(a.lstrip()) # l은 left를 의미한다.

# 오른쪽 공백 지우기(rstrip)
a = " hi "
print(a.rstrip())

# 양쪽 공백 지우기(strip)
a = "Life is too short"
print(a.replace("Life", "Your leg"))

# 문자열 나누기(split)
a = "Life is too short"
print(a.split())

b ="a:b:c:d"
print(b.split(':'))

# split 함수는 a.split()처럼 괄호 안에 아무 값도 넣어주지 않으면 공백(스페이스, 탭, 엔터 등)을 기준으로 문자열을 나누어 준다. 

