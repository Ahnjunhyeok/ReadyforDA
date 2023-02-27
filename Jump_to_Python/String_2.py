# 문자열 인덱싱과 슬라이싱

# 문자열 인덱싱
# 인덱싱은 무언가를 '가리킨다'라는 의미다. 

a = "Life is too short, You need Python"

print(a[3]) # 파이썬은 0부터 숫자를 센다.

# print(a[x]) : x번째에 오는 문자열을 출력하라.

# 문자열 인덱싱 활용하기
a = "Life is too short, You need Python"

print(a[0])
print(a[12])
print(a[-1]) # 인덱싱에서 '-'가 붙는 경우는 뒤에서 n번째 문자열이라는 뜻인데, 뒤에서부터 셀 경우에는 0부터 세지 않는다. 0 = -0 이기 때문이다.

# 문자열 슬라이싱
a = "Life is too short, You need Python"

print(a[0:4]) # = a[0] + a[1] + a[2] + a[3]과 동일하다. 문장에서 자리번호 0부터 4까지 출력하라.

# 주의 ; 슬라이싱 기법을 사용할때, a[시작번호:끝번호]를 지정할 때 끝 번호에 해당하는 것은 포함하지 않는다. 
# a[0:3]을 수식으로 나타내면 0 <= a < 3이다. 
# 그리고 슬라이싱의 시작번호가 꼭 0일 필요는 없다. 

print(a[0:5]) # 언뜻보면 a[0:4]와 차이가 없는 것 처럼 보이지만 'Life '를 출력한다. 'Life'와 'Life '는 엄연히 다른 문자열이다. 

# 슬라이싱을 할 때, 시작번호를 생략하면 문자열의 처음부터 지정한 끝 번호까지 출력해주고, 끝 번호를 생략하면 지정한 시작번호부터 문자열의 끝까지 출력해준다.
# 둘 다 생략하면, 문자열의 처음부터 끝까지 출력해준다. 

print(a[:9])
print(a[5:])
print(a[:])

# 인덱싱과 마찬가지로 슬라이싱에서도 마이너스 기호(-)를 사용할 수 있다. 
a = "Life is too short, You need Python"
print(a[19:-7]) # 19번째 문자열부터 뒤에서 8번째 문자열까지 출력한다. 

# 슬라이싱으로 문자열 나누기

a = "20220301Cloudy"

date = a[:8]
weather = a[8:]

print(date)
print(weather)

year = a[:4]
day = a[4:8]
weather = a[8:]

print(year, day, weather)

# Pithon이라는 문자열을 Python 으로 바꾸려면?

a = "Pithon"

print(a[:1] + "y" + a[2:]) 
