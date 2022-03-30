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


