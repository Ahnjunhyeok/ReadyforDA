# Package.py
# 패키지는 도트(.)를 사용하여 파이썬 모듈을 계층적(디렉터리 구조)으로 관리할 수 있게 해준다. 
# 예를 들어 모듈 이름이 A.B인 경우에 A는 패키지 이름이 되고 B는 A 패키지의 B 모듈이 된다. 

# 파이썬 패키지는 디렉터리와 파이썬 모듈로 이루어지며 구조는 다음과 같다. 
# game/
  # __init__.py
  # sound/
    # __init__.py
    # echo.py
    # wav.py
  # graphic/
    # __init__.py
    # screen.py
    # render.py
  # play.py
    # __init__.py
    # run.py
    # test.py

# game, sound, graphic, play는 디렉터리 이름이고 확장자가 .py인 파일은 파이썬 모듈이다. 
# game 디렉터리가 이 패키지의 루트 디렉터리이고 sound, graphic, play는 서브 디렉터리이다. 
# 간단한 파이썬 프로그램이 아니라면 이렇게 패키지 구조로 파이썬 프로그램을 만드는 것이 공동 작업이나 유지 보수 측면에서 유리하다. 
# 또한 패키지 구조로 모듈을 만들면 다른 모듈과 이름이 겹치더라도 더 안전하게 사용할 수 있다. 

# 패키지 만들기
# 1. 패키지 기본 구성요소 준비하기

# 1) C 드라이브 디렉터리 밑에 game 및 기타 서브 디렉터리를 생성하고 .py 파일들을 다음과 같이 만든다. 

# 노트북에서 game 폴더를 만들고 그 하위에 폴더를 만든다. 
# C:/doit/game/__init__.py
# C:/doit/game/sound/__init__.py
# C:/doit/game/sound/echo.py
# C:/doit/game/graphic/__init__.py
# C:/doit/game/graphic/render.py

# 2) 각 디렉터리에 __init__.py 파일을 만들어 놓기만 하고 내용은 일단 비워둔다. 
# 3) echo.py 파일은 다음과 같이 만든다. 
def echo_test():
  print("echo")

# 4) render.py 파일은 다음과 같이 만든다. 
def render_test():
  print("render")

# 5) 다음 예제 수행 전 직접 만든 game 패키지를 참조할 수 있도록 명령 프롬프트 창에서 set 명령어로 PYTHONPATH 환경 변수에 C:doit 디렉터리를 추가한다. 
# PYTHONPATH 환경변수 사용법
# C:\doit>set PYTHONPATH=C:\doit\pythonworkspace
# C:\doit>python
# import Mod2
# print(Mod2.add(3, 4))

# C:\> set PYTHONPATH=C:/doit
# C:\> python

# 2. 패키지 안의 함수 실행하기
# echo.py 파일의 echo_test 함수를 실행해볼건데, 이는 import 예제이므로 하나의 예제를 실행하고 나서 다음 예제 실행 전에 종료를 하고 다시 실행해야 한다. 
# 패키지 안의 함수 실행 방법은 총 3가지이다.

# 1) echo 모듈을 import 하여 실행하는 방법
# import game.sound.echo
# game.sound.echo.echo_test()

# 2) echo 모듈이 있는 디렉터리까지를 from ... import하여 실행하는 방법
# from game.sound.echo import echo
# echo.echo_test()

# 3) echo 모듈의 echo_test 함수를 '직접' import 하여 실행하는 방법
# from game.sound.echo import echo_test
# echo_test()

# 4) 오류가 발생하는 경우(이 방법으로는 불가능함)
# import game
# game.sound.echo.echo_test()
# import game을 수행하면 game 디렉터리의 모듈 또는 game 디렉터리의 __init__.py에 정의한 것만 참조할 수 있다. 

# 4-1) 오류가 발생하는 경우2
# 또 다음처럼 echo_test 함수를 사용하는 것도 불가능하다. 
# import game.sound.echo.ecoh_test
# 도트 연산자(.)를 사용해서 import a.b.c처럼 import할 때 가장 마지막 항목인 c는 '반드시' 모듈 또는 패키지여야만 한다.

# __init__.py의 용도
# __init__.py 파일은 해당 디렉터리가 '패키지의 일부'임을 알려주는 역할을 한다. 
# 만약 game, sound, graphic 등의 패키지에 포함된 디렉터리에 __init__.py 파일이 없다면 패키지로 인식하지 않는다. 

# 예시 하나를 보자
# from game.sound import *
# echo.echo_test()

# 위와 같이 실행하면 오류가 발생하는데, 이유는 echo 라는 이름이 정의되지 않았기 때문이다. 그래서 이름 오류(NameError)가 발생했다. 
# 분명 game.sound 패키지에서 모든 것(*)을 import 하였으니까 echo 모듈을 사용할 수 있을거 같은데 오류가 발생한 것이다. 

# 이렇게 특정 디렉터리의 모듈을 *를 사용해서 import 할 때는 다음과 같이 해당 디렉터리의 __init__.py 파일에 __all__ 변수를 설정하고 import 할 수 있는 모듈을 정의해줘야 한다. 
# C:/doit/game/sound/__init__.py
# __all__ = ["echo"]
# 여기에서 __all__ 이 의미하는 것은 sound 디렉터리에서 * 기호를 사용하여 import 할 경우 이곳에 정의된 echo 모듈만 import 된다는 의미이다. 
# * 착각하기 쉬운 내용인데 from game.sound.echo import * 는 __all__ 과 상관없이 무조건 import 된다. 
# * 이렇게 __all__과 상관없이 무조건 import 되는 경우는 from a.b.c import * 에서 from의 마지막 항목인 c가 '모듈'인 경우이다. 

# 위와 같이 변경하고 나면 정상적으로 출력되는 것을 알 수 있다. 
# from game.sound import *
# echo.echo_test()

# relative 패키지
# 만약 graphic 디렉터리의 render.py 모듈이 sound 디렉터리의 echo.py 모듈을 사용하고 싶다면 다음과 같이 수정해야한다. \
  
