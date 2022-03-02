# 문자열 포매팅

# 문자열 포매팅은 문자열 안의 특정한 값을 바꿔야 할 경우가 있을 때 이것을 가능하게 해주는 것이다.
# 방법론
# 1. 숫자 바로  대입
sen = "I eat %d apples." %3 # 숫자를 넣기 위해서는 %d 를 써야한다. 
print(sen)

# 2. 문자열 바로 대입
sen = "I eat %s apples." % "five"
print(sen) # 문자열을 넣기 위해서는 %s 를 써야한다. 

# 3. 숫자 값을 나타내는 변수로 대입
number = 3
sen = "I eat %d apples." % number
print(sen)

# 4. 2개 이상의 값 넣기
number = 10
day = "three"
sen = "I ate %d apples. so I was sick for %s days." % (number, day)
print(sen)  # 2개 이상의 값을 넣을 때에는 괄호 안에 (,) 로 구분하여 묶어준다. 

# String_3.py
# 문자열 포맷 코드

# %s = string
# %c = 문자 1개(Character)
# %d = 정수(Integer)
# %f = 부동 소수(Floating-point)
# %o = 8진수
# %x = 16진수
# %% = Literal % (문자 '%' 자체)

# 여기서 재밌는건 %s 다. 이 코드는 어떤 형태의 값이든 변환해 넣을 수 있다. 

sen = "I have %s apples" % 3
print(sen)

sen = "rate is %s" % 3.234
print(sen)

# 3을 문자열 안에 삽입하려면 %d 를 사용하고, 3.234를 삽입하려면 %f 를 사용해야 한다. 
# 하지만 %s를 사용하면, 앞의 내용을 고려하지 않아도 된다. 

# 포매팅 연산자 %d와 %를 같이 쓸 때는 %%를 쓴다. 
# sen = "Error is %d%" % 98
# print(sen) #(x)

sen = "Error is %d%%" % 98
print(sen)

# 포맷 코드와 숫자 함께 사용하기

# 1. 정렬과 공백
a = "%10s" % "hi"
print(a)

# %10s 는 전체 길이가 10개인 문자열 공간에서 대입되는 값을 '오른쪽'으로 정렬하고 그 앞의 나머지는 공백으로 남겨두라는 의미다.
# 왼쪽 정렬은 %-10s가 될 것이다. 

a = "%-10sjane" % "hi"
print(a)

# 2. 소수점 표현하기
a = "%0.4f" % 3.42134234
print(a)

# '.'의 의미는 소수점 포인트를 말하고 숫자 4는 소수점 뒤에 나올 숫자의 개수를 말한다. 
a = "%10.4f" % 3.42134234
print(a)