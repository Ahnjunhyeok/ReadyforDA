# 파이썬에서 정규 표현식을 지원하는 re 모듈
# 파이썬은 정규 표현식을 지원하기 위해 re 모듈을 제공한다. 
# re 모듈은 파이썬을 설치할 때 자동으로 설치되는 기본 라이브러리로 사용방법은 다음과 같다. 

import re
p = re.compile("ab*")

# re.compile을 사용하여 정규 표현식을 컴파일한다. 
# re.compile의 결과로 돌려주는 객체 p(컴파일된 패턴 객체)를 사용하여 그 이후의 작업을 수행할 것이다. 

# 정규식을 컴파일할 때 특정 옵션을 주는 것도 가능하다. 
# 패턴이란 정규식을 컴파일한 결과이다. 

# 정규식을 사용한 문자열 검색
# 이제 컴파일된 패턴 객체를 사용하여 문자열 검색을 수행해 보자. 컴파일된 패턴 객체는 다음과 같은 4가지 메서드를 제공한다. 

# 1) match() ; 문자열의 처음부터 정규식과 매치되는지 조사한다. 
# 2) search() ; 문자열 전체를 검색하여 정규식과 매치되는지 조사한다. 
# 3) findall() ; 정규식과 매치되는 모든 문자열(substring)을 리스트로 돌려준다. 
# 4) finditer() ; 정규식과 매치되는 모든 문자열(substring)을 반복 가능한 객체로 돌려준다. 

# match, search는 정규식과 매치될 때는 match 객체를 돌려주고, 매치되지 않을 때는 None을 돌려준다. 
# match 객체란 정규식의 검색 결과로 돌려주는 객체이다. 
# 예시로 살펴보자.

# 우선 다음과 같은 패턴을 만들어보자.

import re
p = re.compile("[a-z]+")

# match
# match 메서드는 문자열의 처음부터 정규식과 매치되는지 조사한다. match를 수행해보자

m = p.match("python")
print(m)

# "python" 문자열은 [a-z]+ 정규식에 부합되므로 match 객체를 돌려준다.

m = p.match("3 python")
print(m)

# "3 python" 문자열은 처음에 나오는 문자 3이 정규식 [a-z]+에 부합하지 않으므로 None을 돌려준다. 

# match의 결과로 match 객체 또는 None을 돌려주기 때문에 파이썬 정규식 프로그램은 보통 다음과 같은 흐름으로 작성한다. 

# p = re.compile(정규 표현식)
# m = p.match("조사할 문자열")
# if m:
    # print("Match found: ", m.group())
# else:
    # print("No match")
    
# 즉 match의 결괏값이 있을 때만 그다음 작업을 수행하겠다는 것이다. 

# search
# 컴파일된 패턴 객체 p를 가지고 이번에는 search 메서드를 수행해 보자
m = p.search("python")
print(m)

# "python" 문자열에 search 메서드를 수행하면 match 메서드를 수행했을 때의 동일하게 매치된다. 

m = p.search("3 python")
print(m)

# "3 python" 문자열의 첫 번째 문자는 "3"이지만 search는 문자열의 처음부터 검색하는 것이 아니라 문자열 전체를 검색하기 때문에 "3" 이후의 "python" 문자열과 매치된다. 

# 이렇듯 match 메서드와 search 메서드는 문자열의 처음부터 검색할지의 여부에 따라 다르게 사용해야 한다. 

# findall

result = p.findall("life is too short")
print(result)

# "life is too short" 문자열의 "life", "is", "too", "short" 단어를 각각 [a-z]+ 정규식과 매치해서 리스트로 돌려준다. 

# finditer

result = p.finditer("life is too short")
print(result)

for r in result: print(r)

# finditer는 findall과 동일하지만 그 결과로 반복 가능한 객체를 돌려준다. 
# 반복 가능한 객체가 포함되는 각각의 요소는 match 객체이다. 

# match 객체의 메서드
# match 메서드와 search 메서드를 수행한 결과로 돌려준 match 객체에 대해 알아볼 것이다. 

# 생길 수 있는 의문점 2가지

# 1. 어떤 문자열이 매치되었는가?
# 2. 매치된 문자열의 인덱스는 어디부터 어디까지인가?

# match 객체의 메서드를 사용하면 이 같은 궁금증을 해결할 수 있다. 
# 1) group() : 매치된 문자열을 돌려준다. 
# 2) start() : 매치된 문자열의 시작 위치를 돌려준다. 
# 3) end() : 매치된 문자열의 끝 위치를 돌려준다. 
# 4) span() : 매치된 문자열의 (시작, 끝)에 해당하는 튜플을 돌려준다. 

# 다음 예로 확인해보자
import re
p = re.compile("[a-z]+")
m = p.match("python")

print(m.group())
print(m.start())
print(m.end())
print(m.span())

# match 메서드를 수행한 결과로 돌려준 match 객체의 start()의 결괏값은 항상 0일 수 밖에 없다. 왜냐하면 match 메서드는 항상 문자열의 시작부터 조사하기 때문이다. 

# 만약이 search 메서드를 사용했다면 start() 값은 다음과 같이 다르게 나올 것이다. 
m = p.search("3 python")

print(m.group())
print(m.start())
print(m.end())
print(m.span())

# 모듈 단위로 수행하기
# 지금까지 우리는 re.compile을 사용하여 컴파일된 패턴 객체로 그 이후의 작업을 수행했다. 

# before
# p = re.compile("[a-z]+")
# m = p.match("python")

# after
# m = re.match("[a-z]+", "python")

# 위 예처럼 사용하면 컴파일과 match 메서드를 한 번에 수행할 수 있다. 보통 한 번 만든 패턴 객체를 여러 번 사용해야 할 때는 이 방법보다 re.compile을 사용하는 것이 편하다. 

# 컴파일 옵션
# 정규식을 컴파일할 때 다음 옵션을 사용할 수 있다. 

# 1) DOTALL : 약어; S, dot문자(.)가 줄바꿈 문자를 포함하여 모든 문자와 매치한다.  
# 2) IGNORECASE : 약어; I, 대소문자에 관계 없이 매치한다. 
# 3) MULTILINE : 약어; M, 여러 줄과 매치한다. (^, $ 메타 문자의 사용과 관계가 있는 옵션이다.) 
# 4) VERBOSE : 약어; X, verbose 모드를 사용한다. (정규식을 보기 편하게 만들 수도 있고 주석 등을 사용할 수도 있다.)

# 옵션을 사용할 때는 re.DOTALL처럼 전체 옵션 이름을 써도 되고 re.S처럼 약어를 써도 된다. 

# DOTALL, S
# . 메타 문자는 줄바꿈 문자(\n)를 제외한 모든 문자와 매치되는 규칙이 있다. 
# 만약 \n 문자도 포함하여 매치하고 싶다면 re.DOTALL 또는 re.S 옵션을 사용해 정규식을 컴파일하면 된다. 
import re
p = re.compile("a.b")
m = p.match("a\nb")
print(m)

# 정규식이 a.b인 경우 문자열 a\nb는 매치되지 않음을 알 수 있다. 왜냐하면 \n은 .메타 문자 와 매치되지 않기 때문이다. 
# \n 문자와도 매치되게 하려면 다음과 같이 re.DOTALL 옵션을 사용해야 한다. 
import re
p = re.compile("a.b", re.DOTALL)
m = p.match("a\nb")
print(m)

# 보통 re.DOTALL 옵션은 여러 줄로 이루어진 문자열에서 \n에 상관없이 검색할 때 많이 사용한다. 

# IGNORECASE, I
# re.IGNORECASE 또는 re.I 옵션은 대소문자 구별 없이 매치를 수행할 때 사용하는 옵션이다. 
import re
p = re.compile("[a-z]", re.I)
print(p.match("python"))
print(p.match("python"))
print(p.match("PYTHON"))

