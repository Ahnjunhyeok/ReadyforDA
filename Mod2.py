# 클래스나 변수 등을 포함한 모듈
PI = 3.141592

class Math:
    def solv(self, r):
        return  PI * (r ** 2)
    
def add(a, b):
    return a + b

# 이 파일은 원의 넓이를 계산하는 Math 클래스와 두 값을 더하는 add 함수 그리고 원주율 값에 해당되는 PI 변수처럼 클래스, 함수, 변수 등을 모두 포함하고 있다. 

import Mod2

print(Mod2.PI)

a = Mod2.Math()
print(a.solv(2))

# 위 예는 Mod2.py에 있는 Math 클래스를 사용하는 방법을 보여준다. 위 예처럼 모듈 안에 있는 클래스를 사용하려면 '.'로 클래스 이름 앞에 모듈 이름을 먼저 입력해야 한다. 
print(Mod2.add(Mod2.PI,4.4))

# Mod2.py에 add 함수 역시 당연히 사용할 수 있다. 

# 다른 파일에서 모듈 불러오기

# 모듈을 불러오는 또 다른 방법

# 1. sys.path.append(모듈을 저장한 디렉터리) 사용하기
# 2. PYTHONPATH 환경변수 사용하기

