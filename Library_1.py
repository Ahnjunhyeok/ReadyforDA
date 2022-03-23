# 내장함수_4, 라이브러리
# 내장함수 파트를 좀 마무리하고 라이브러리 내용을 공부해보자.
# str
# str(object)는 문자열 형태로 객체를 변환하여 돌려주는 함수이다. 
print(str(3))
print(str("hi"))
print(str("hi".upper()))

# sum
# sum(iterable)은 입력받은 리스트나 튜플의 모든 요소의 합을 돌려주는 함수이다. 
print(sum([1, 2, 3]))
print(sum([4, 5, 6]))

# tuple
# tuple(iterable)은 반복 가능한 자료형을 입력받아 튜플 형태로 바꾸어 돌려주는 함수이다. 
# 튜플이 입력으로 들어오면 그대로 돌려준다.
print(tuple("abc"))
print(tuple([1, 2, 3]))
print(tuple((1, 2, 3)))

# zip
# zip(*iterable)은 동일한 개수로이루어진 자료형을 묶어 주는 역할을 하는 함수이다. 
print(list(zip([1, 2, 3], [4, 5, 6])))
print(list(zip([1, 2, 3], [4, 5, 6], [7, 8, 9])))
print(list(zip("abc", "def")))

# 라이브러리
# 전 세계의 파이썬 사용자들이 만든 유용한 프로그램을 모아 놓은 것이 바로 파이썬 라이브러리이다. 
# 모든 라이브러리를 다 알 필요는 없지만 어떤 일을 할때 어떤 라이브러리를 사용해야 한다는 정도만 알고 있으면 된다. 

# sys
# sys 모듈은 파이썬 인터프리터가 제공하는 변수와 함수를 직접 제어할 수 있게 해주는 모듈이다. 

# 명령 창에서 인수 전달하기 - sys.argv
import sys
print(sys.argv)

# 강제로 스크립트 종료하기 - sys.exit
# sys.exit()

# 자신이 만든 모듈 불러와 사용하기 - sys.path
import sys
print(sys.path)

# Library_test.py
# import sys
# sys.path.append("C:/doit/Mymod")

# 위와 같이 파이썬 프로그램 파일에서 sys.path.append를 사용해 경로 이름을 추가할 수 있다. 
# 이렇게 하고 난 이후에는 C:/doit/Mymod 디렉터리에 있는 파이썬 모듈을 불러와서 사용할 수 있다. 
# pickle
# pickle은 객체의 형태를 그대로 유지하면서 파일에 저장하고 불러올 수 있게 하는 모듈이다. 
# 다음 예는 pickle 모듈의 dump 함수를 사용하여 딕셔너리 객체인 data를 그대로 파일에 저장하는 방법을 보여 준다. 
# import pickle
# f = open("test.txt", "rb")
# data = {1: "python", 2: "you need"}
# pickle.dump(data, f)


# 다음은 pickle.dump로 저장한 파일을 pickle.load를 사용해서 원래 있던 딕셔너리 객체(data) 상태 그대로 불러오는 예이다. 
# import pickle
# f = open("test.txt", "rb")
# data = pickle.load(f)
# print(data)

# 위 예에서는 딕셔너리 객체를 사용했지만 어떤 자료형이든 저장하고 불러올 수 있다. 

# OS
# OS 모듈은 환경 변수나 디렉터리, 파일 등의 OS 자원을 제어할 수 있게 해주는 모듈이다. 
# 내 시스템의 환경 변수 값을 알고 싶을 때 - os.environ
# 시스템은 제각기 다른 환경 변수 값을 가지고 있는데, os.environ은 현재 시스템의 환경 변수 값을 보여준다. 
import os
print(os.environ)

# 아래 나타나는 결괏값은 필자의 시스템 정보이다. os.environ은 환경 변수에 대한 정보를 딕셔너리 객체로 돌려준다. 
# 돌려받은 객체가 딕셔너리이기 때문에 다음과 같이 호출할 수 있다. 다음은 필자 시스템의 PATH 환경 변수 내용이다. 
print(os.environ["PATH"])

# 디렉터리 위치 변경하기 - os.chdir
# os.chdir를 사용하면 다음과 같이 현재 디렉터리 위치를 돌려준다. 
print(os.chdir("C:\WINDOWS"))

# 디렉터리 위치 돌려받기 - os.getcwd
# os.getcwd는 현재 자신의 디렉터리 위치를 돌려준다. 
print(os.getcwd())

# 시스템 명령어 호출하기 - os.system
# 시스템 자체의 프로그램이나 기타 명령어를 파이썬에서 호출할 수 있다. os.system("명령어")처럼 사용한다. 
# 다음은 현재 디렉터리에서 시스템 명령어 dir을 실행하는 예이다. 
print(os.system("dir"))

# 실행한 시스템 명령어의 결괏값 돌려받기 - os.popen
# os.popen은 시스템 명령어를 실행한 결괏값을 읽기 모드 형태의 파일 객체로 돌려준다. 
f = os.popen("dir")

# 읽어 들인 파일 객체의 내용을 보기 위해서는 다음과 같이 하면 된다. 
print(f.read())

# 기타 유용한 os 관련 함수
# 디렉터리 생성 - os.mkdir
# 디렉터리 삭제(단 디렉터리가 비어있어야 삭제가능) - os.rmdir
# 파일 삭제 - os.unlink


# src라는 읾의 파일을 dst라는 이름으로 바꿈 - os.rename(src, dst)