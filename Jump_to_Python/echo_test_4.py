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
