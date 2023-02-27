# String_4.py
# format 함수를 사용한 포매팅

# 1. 숫자 바로 대입하기
a = "I eat {0} apples.".format(3)
print(a)

# 2. 문자열 바로 대입하기
a = "I eat {0} apples.".format("five")
print(a)

# 3. 숫자 값을 가진 변수로 대입하기
number = 3
a = "I eat {0} apples.".format(number)
print(a)

# 4. 2개 이상의 값 넣기
number = 10
day = "three"
a = "I eat {0} apples. so I was sick for {1} days.".format(number, day)

# 5. 이름으로 넣기
a = "I eat {number} apples. so I was sick for {day} days.".format(number=10, day=3)
print(a)

# 6. 인덱스와 이름을 혼용해서 넣기
a = "I eat {0} apples. so I was sick for {day} days.".format(10, day=3)
print(a)

# 왼쪽 정렬
a = "{0:<10}".format("hi")
print(a)

# 오른쪽 정렬
a = "{0:>10}".format("hi")
print(a) # 어느쪽으로 정렬되는지 화살표 방향을 통해 파악할 것.

# 가운데 정렬
a = "{0:^10}".format("hi")
print(a)

# 공백 채우기
a = "{0:=^10}".format("hi")
print(a)

a = "{0:!<10}".format("hi")
print(a)

# 소수점 표현하기
y = 3.42134234
a = "{0:0.4f}".format(y)
print(a)

y = 3.42134234
a = "{0:10.4f}".format(y)
print(a)

# { 또는 } 문자 표현하기
a = "{{ and }}".format()
print(a)
