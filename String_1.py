# 문자열 
# 문자열이란 문자, 단어 등으로 구성된 문자들의 집합을 의미한다.

# ex) "Life is too short, You need Python"
# "a"
# "123"

# How to make string

# 문자열을 만드는 방법은 총 4가지다. 
# 1. 큰 따옴표("")로 양쪽 둘러싸기
print("Hello World")

# 2. 작은 따옴표('')로 양쪽 둘러싸기
print('Python is fun')

# 3. 큰따옴표 3개를 연속으로 사용하기(""")
print("""Life is too short, You need Python""")

# 4. 작은따옴표 3개를 연속으로 사용하기(''')
print('''Life is too short, You need Python''')

print("-" * 100)

# 문자열 안에 작은따옴표나 큰따옴표를 포함시키고 싶을때

# 1. 문자열에 작은따옴표 ('') 포함시키기
food = "Python's favorite food is perl"

print(food) 

# 2. 문자열에 큰따옴표 ("") 포함시키기
sentence = '"Python is very easy." he says.'
print(sentence)

# 3. 백슬래시(\)를 사용해서 작은따옴표와 큰따옴표를 문자열에 포함시키기
# 백슬래시를 작은따옴표나 큰따옴표 '앞'에 삽입하면 백슬래시 뒤의 작은따옴표나 큰따옴표는 문자열을 둘러싸는 기호의 의미가 아닌, 문자 그 자체를 뜻하게 된다. 
food = 'Python\'s favorite food is perl'
print(food)

say = "\"Python is very easy.\" he says."
print(say)

# 여러 줄인 문자열을 변수에 대입하고 싶을 때

# 1. 줄을 바꾸는 탈출 코드(이스케이프 코드) 사용하기
multiline = "Life is too short,\nYou need Python."
print(multiline)

# 2. 연속된 작은따옴표 3개(''') 혹은 큰따옴표 3개 (""") 사용하기
multiline = '''
Life is too short 
You need Python
'''

print(multiline)

multiline_1 = """
Life is too short 
You need Python
"""

print(multiline_1)