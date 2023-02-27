# 2.2.4 자기관찰
# 변수 이름 앞이나 뒤에 ? 기호를 붙이면 그 객체에 대한 일반 정보를 출력한다. 

b = [1, 2, 3]

b?

print?

# 이 기능은 객체의 자기관찰(인트로스펙션-instropection)이라고 한다.
# 만약 객체가 함수이거나 인스턴스 메서드라면 정의되어 있는 문서를 출력해준다. 
# IPython이나 주피터에서 사용가능한 아래와 같은 함수를 작성했다고 하자.

def add_numbers(a, b):
    """
    Add two numbers together
    
    Returns
    -------
    the_sum : type of arguments
    """
    return a + b

add_numbers?

# ??를 사용하면 가능한 경우 함수의 소스 코드도 보여준다.

add_numbers??

# 또한 ?는 표준 유닉스나 윈도우 명령행에서와 마찬가지로 IPython의 네임스페이스를 검색하는 데 사용할 수도 있다.
# 와일드카드(*) 기호와 함께 사용한 문자와 일치하는 모든 이름을 보여준다. 
# 예를 들어 NumPy의 최상단 네임스페이스 안에서 load를 포함하는 모든 함수 목록을 가져올 수 있다. 

import numpy as np
np.*load*?

# 2.2.5 %run 명령어

# %run 명령어를 사용하면 IPython 세션 안에서 파이썬 프로그램 파일을 불러와서 실행할 수 있다. 
# 다음과 같은 ipython_script_test.py 스크립트 파일이 있다고 하자. 

def f(x, y, z):
    return (x + y) / z
a = 5
b = 6
c = 7.5

result = f(a, b, c)

# 이 스크립트 파일은 %run 명령을 사용해서 다음처럼 실행할 수 있다.

# %run ipython_script_test.py

# 스크립트 파일은 빈 네임스페이스 (다른 변수가 선언되지 않았거나 아무것도 임포트되지 않은 상태)에서 실행되므로
# 명령행에서 python script.py 명령을 실행한 것과 동일하게 동작한다.
# 스크립트 파일에 정의된 모든 변수(임포트, 함수, 전역 변수)는 실행된 후에 IPython에서 접근이 가능하다. 

c

result

