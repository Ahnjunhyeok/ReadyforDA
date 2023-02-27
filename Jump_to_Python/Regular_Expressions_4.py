# MULTILINE, M
# re.MULTILINE 또는 re.M 옵션은 조금 후에 설명할 메타 문자인 ^, $와 연관된 옵션이다. 
# ^은 문자열의 처음을 의미하고, $는 문자열의 마지막을 의미한다. 
# 예를 들어 정규식이 "^python"인 경우 문자열의 처음은 항상 python으로 시작해야 매치되고, 만약 정규식이 "python$"라면 문자열의 마지막은 항상 python으로 끝나야 매치된다는 의미이다. 

import re
p = re.compile("^python\s\w+")

data = """python one
life is too short
python two
you need python
python three"""

print(p.findall(data))

# 정규식 "^python\s\w+"은 python이라는 문자열로 시작하고 그 뒤에 whitespace, 그 뒤에 단어가 와야 한다는 의미이다. 검색할 문자열 data는 여러 줄로 이루어져 있다. 

# 이 스크립트를 실행하면 다음과 같은 결과를 돌려준다. 
# ["python one"]

# ^ 메타 문자에 의해 python이라는 문자열을 사용한 첫 번째 줄만 매치된 것이다. 

# 하지만 ^ 메타 문자를 문자열 전체의 처음이 아니라 각 라인의 처음으로 인식시키고 싶은 경우도 있을 것이다. 
# 이럴 때 사용할 수 있는 옵션이 바로 re.MULTILINE 또는 re.M이다. 위 코드를 수정해보자.

import re
p = re.compile("^python\s\w+", re.MULTILINE)

data = """python one
life is too short
python two
you need python
python three"""

print(p.findall(data))

# re.MULTILINE 옵션으로 인해 ^ 메타 문자가 문자열 전체가 아닌 각 줄의 처음이라는 의미를 갖게 되었다. 
# ["python one", "python two", "python three"]

# 즉, re.MULTILINE 옵션은 ^, $ 메타 문자를 문자열의 각 줄마다 적용해 주는 것이다. 

# VERBOSE, X 
# re.VERBOSE 또는 re.X 옵션을 사용하면 어려운 정규식을 주석 또는 줄 단의로 구분할 수 있다. 
charref = re.compile(r"&[#](0[0-7]+|[0-9]+|x[0-9a-fA-F]+);")

# 위 정규식은 정말 이해하기 어렵다
# 다음 예시를 보자

charref = re.compile("""
&[#]                    # Start of a numeric entity reference
( 
  0[0-7]+               # Octal form 
| [0-9]+                # Decimal form
| x[0-9a-fA-F]+         # Hexadecimal form
)
;                       # Trailing semicolon
""", re.VERBOSE)

# 첫 예시와 두 번째 예시를 비교해보면 컴파일된 패턴 객체인 charref는 모두 동일한 역할을 한다. 
# 하지만 정규식이 복잡할 경우 두번째 처럼 주석을 적고 여러 줄로 표현하는 것이 가독성이 좋다는 것을 알 수 있다. 
# re.VERBOSE 옵션을 사용하면 문자열에 사용된 whitespace는 컴파일할 때 제거된다. 
# 그리고 줄 단위로 # 기호를 사용하여 주석문을 작성할 수 있다. 

# 백슬래시 문제
# 정규 표현식을 파이썬에서 사용할 때 혼란을 주는 요소가 한 가지 있는데, 바로 백슬래시(\)이다.

# 예를 들어 어떤 파일 안에 있는 "\section" 문자열을 찾기 위한 정규식을 만든다고 가정해보자. 
# \section

# 이 정규식은 \s 문자가 whitespace로 해석되어 의도한 대로 매치가 이루어지지 않는다. 

# 위 표현은 다음과 동일한 의미이다. 
# [ \t\n\r\f\v]ection # \s 문자가 이스케이프 코드 \t, \n, \r, \f, \v로 해석됨.

# 의도한 대로 매치하고 싶다면 다음과 같이 변경해야한다. 
# \\section

# 즉 위 정규식에서 사용한 \ 문자가 문자열 자체임을 알려주기 위해 백슬래시 2개를 사용하여 이스케이프 처리를 해야 한다. 

# 따라서 위 정규식을 컴파일 하려면 다음과 같이 작성해야 한다. 
p = re.compile("\\section")

# 근데 여기서 위처럼 정규식을 만들어서 컴파일하면 실제 파이썬 정규식 엔진에는 파이썬 문자열 리터럴 규칙에 따라 \\이 \로 변경되어 \section이 전달된다. 
# 결국 정규식 엔진에 \\ 문자를 전달하려면 파이썬은 \\\\처럼 백슬래시를 4개나 사용해야 한다. 정규식 엔진은 정규식을 해석하고 수행하는 모듈이다.  
p = re.compile("\\\\section")

# 이렇게 해야만 원하는 결과를 얻을 수 있다. 너무 복잡하다. 

# 만약에 위와 같이 \를 사용한 표현이 계속 반복되는 정규식이라면 너무 복잡해서 이해하기 쉽지 않을 것이다. 
# 이러한 문제로 인해 파이썬 정규식에는 Raw String 규칙이 생겨나게 되었다. 
# 즉 컴파일해야하는 정규식이 Raw String임을 알려 줄 수 있도록 파이썬 문법을 만든 것이다. 
# 그 방법은 다음과 같다. 
p = re.compile(r"\\section")

# 위와 같이 정규식 문자열 앞에 r 문자를 삽입하면 이 정규식은 Raw String 규칙에 의하여 백슬래시 2개 대신 1개만 써도 2개를 쓴 것과 동일한 의미를 갖게 된다. 
# 백슬래시를 사용하지 않는 정규식이라면 r의 유무에 상관없이 동일한 정규식이 될 것이다. 

# 7-3 강력한 정규 표현식의 세계로

# 메타 문자
# 앞에서 살펴본 +, *, [], {} 등의 메타 문자는 매치가 진행될 때 현재 매치되고 있는 문자열의 위치가 변경된다.(보통 소비된다고 표현한다)
# 하지만 이와 달리 문자열을 소비시키지 않는 메타 문자도 있다. 
# 이번에는 문자열 소비가 없는 메타 문자에 대해 살펴보자. 

# | 
# | 메타 문자는 or과 동일한 의미로 사용된다. A|B라는 정규식이 있다면 A 또는 B라는 의미가 된다. 
p = re.compile("Crow|Servo")
m = p.match("CrowHello")
print(m)

# ^
# ^ 메타 문자는 문자열의 맨 처음과 일치함을 의미한다. 앞에서 살펴본 컴파일 옵션 re.MULTILINE을 사용할 경우에는 여러 줄의 문자열일 때 각 줄의 처음과 일치하게 된다. 
print(re.search("^Life", "Life is too short"))
print(re.search("^Life", "My Life"))

# "^Life" 정규식은 Life 문자열이 처음에 온 경우에는 매치하지만 처음 위치가 아닌 경우에는 매치되지 않음을 알 수 있다. 

# $
# $ 메타 문자는 ^ 메타 문자와 반대의 경우다. 즉 $는 문자열의 끝과 매치함을 의미한다. 
print(re.search("short$", "Life is too short"))
print(re.search("short$", "Life is too short, you need python"))

# "short$" 정규식은 검색할 문자열이 short로 끝난 경우에는 매치되지만 그 이외의 경우에는 매치되지 않음을 알 수 있다.
# ^ 또는 $ 문자를 메타 문자가 아닌 문자 그 자체로 매치하고 싶은 경우에는 \^, \$ 로 사용하면 된다. 

# \A
# \A는 문자열의 처음과 매치됨을 의미한다. ^ 메타 문자와 동일한 의미이지만 re.MULTILINE 옵션을 사용할 경우에는 다르게 해석된다. 
# re.MULTILINE 옵션을 사용할 경우 ^은 각 줄의 문자열의 처음과 매치되지만 \A는 줄과 상관없이 전체 문자열의 처음하고만 매치가 된다. 

# \Z 
# \Z는 문자열의 끝과 매치됨을 의미한다. 이것 역시 \A와 동일하게 re.MULTILINE 옵션을 사용할 경우 $ 메타 문자와는 달리 전체 문자열의 끝과 매치된다. 

# \b
# \b는 단어 구분자(word boundary)이다. 보통 단어는 whitspace에 의해 구분된다. 
p = re.compile(r"\bclass\b")
print(p.search("no class at all"))

# "\bclass\b" 정규식은 앞뒤가 whitespace로 구분된 class라는 단어와 매치됨을 의미한다. 
# 따라서 no class at all의 class라는 단어와 매치됨을 확인할 수 있다. 

print(p.search("the declassified algorithm"))

# 위 예의 "the declassified algorithm" 문자열 안에도 class 문자열이 포함되어 있긴 하지만 whitespace로 구분된 단어가 아니므로 매치되지 않는다. 

print(p.search("one subclass is"))

# subclass 문자열 역시 class 앞에 sub 문자열이 더해져 있으므로 매치되지 않음을 알 수 있다. 

# \b 메타 문자를 사용할 때 주의할 점이 있다. \b는 파이썬 리터럴 규칙에 의하면 백스페이스를 의미하므로 백스페이스가 아닌 단어 구분자임을 알려 주기 위해 
# r"\bclass\b"처럼 Raw String임을 알려주는 기호 r을 반드시 붙여 주어야 한다. 

# \B
# \B 메타 문자는 \b 메타 문자와 반대의 경우이다. 즉 whitespace로 구분된 단어가 아닌 경우에만 매치된다. 
p = re.compile(r"\Bclass\B")
print(p.search("no class at all"))

print(p.search("the declassified algorithm"))
print(p.search("one subclass is"))

# class 단어의 앞뒤에 whitespace가 하나라도 있는경우에는 매치가 안되는 것을 확인할 수 있다. 
