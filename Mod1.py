# Module_1.py
# 모듈이란 함수나 변수 또는 클래스를 모아 놓은 파일이다.
# 모듈은 다른 파이썬 프로그램에서 불러와 사용할 수 있게끔 만든 파이썬 파일이라고도 할 수 있다. 
# 다른 사람들이 이미 만들어 놓은 모듈을 사용할 수도 있고 우리가 직접 만들어서 사용할 수도 있다. 

# 모듈 만들기
def add(a, b):
  return a + b

def sub(a, b):
  return a - b

if __name__ == "__main__":
    print(add(1, 4))
    print(sub(4, 2))

# add와 sub만 있는 파일 Module_1.py를 만들고 C:\doit 디렉토리에 저장하자. 
# 파이썬 확장자 .py로 만든 파이썬 파일은 모두 모듈이다. 

# 모듈 불러오기
import Mod1

print(Mod1.add(3, 4))
print(Mod1.sub(4, 2))

# import는 이미 만들어 놓은 파이썬 모듈을 사용할 수 있게 해주는 명령어이다. 
# Mod1.py 파일에 있는 add 함수를 사용하기 위해서는 위 예와 같이 Mod1.add처럼 모듈 이름 뒤에 '.'를 붙이고 함수 이름을 쓰면 된다. 
# import의 사용 방법은 다음과 같다. 
# import 모듈 이름
# 여기에서 모듈 이름은 Mod1.py에서 확장자를 제거한 Mod1만을 가리킨다. 

# 때로는 Mod1.add, Mod1.sub처럼 쓰지 않고 add, sub처럼 모듈 이름 없이 함수 이름만 쓰고 싶은 경우에는 'from 모듈 이름 import 모듈 함수'를 사용하면 된다. 
# from 모듈 이름 import 모듈 함수

from Mod1 import add
from Mod1 import sub
print(add(3, 4))
print(sub(5, 4))

# 둘다 사용하려면 아래와 같이 쓸 수 있다. 

from Mod1 import add, sub
from Mod1 import *

# 첫 번째 방법은 위와 같이 from 모듈 이름 import 모듈 함수1, 모듈 함수2처럼 사용하는 것이다. 콤마로 구분하여 필요한 함수를 불러올 수 있다. 
# 두 번째 방법은 위와 같이 * 문자를 사용하는 방법이다. 07장에서 배울 정규 표현식에서 * 문자는 '모든 것'이라는 뜻인데 파이썬에서도 마찬가지 의미로 사용한다. 
# 따라서 from Mod1 import *는 Mod1.py의 모든 함수를 불러서 사용하겠다는 뜻이다. 
# Mod1.py 파일에는 함수가 2개밖에 없기 때문에 위 2가지 방법은 동일하게 적용된다. 

# Mod1_1를 만들어서 Mod1.py 파일의 add와 sub 함수를 사용하기 위해 mod1 모듈을 import할 때는 문제가 생긴다. 
# 엉뚱하게도 import Mod1을 수행하는 순간 Mod1.py가 실행이 되어 결괏값을 출력한다. 
# 단지 add와 sub 함수만 사용하려고 했는데 말이다. 
# 이러한 문제를 방지하려면 Mod1.py를 다음처럼 변경해야 한다. 

# if __name__ == "__main__"를 사용하면 직접 이 파일을 실행했을 때는 __name__ == "__main__"이 참이 되어 if문 다음 문장이 수행된다. 
# 반대로 대화형 인터프리터나 다른 파일에서 이 모듈을 불러서 사용할 때는 __name__ == "__main__"이 거짓이 되어 if문이 다음 문장이 되지 않는다. 

# __name__ 변수는 파이썬 내부적으로 사용하는 특별한 변수 이름이다. 만약 직접 Mod1.py 파일을 실행할 경우 Mod1.py의 __name__ 변수에는 __main__ 값이 저장된다. 
# 하지만 파이썬 셀이나 다른 파이썬 모듈에서 Mod1을 import 할 경우에는 Mod1.py의 __name__ 변수에는 Mod1.py의 모듈 이름 값 Mod1이 저장된다. 

