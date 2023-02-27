# function_4.py
# 파일 읽고 쓰기
# 파일 생성하기
f = open("새파일.txt", 'w')
f.close()
# 파일 생성을 위해 파이썬 내장 함수 open을 사용한다. 
# 파일 객체 = open(파일 이름, 파일 열기 모드)

# 파일 열기 모드의 종류
# r : 읽기 모드 - 파일을 읽기만 할 때 사용
# w : 쓰기 모드 - 파일에 내용을 쓸 때 사용
# a : 추가 모드 - 파일의 마지막에 새로운 내용을 추가할 때 사용

# 파일을 쓰기 모드로 열면 해당 파일이 이미 존재할 경우 원래 있던 내용이 모두 사라지고, 해당 파일이 존재하지 않으면 새로운 파일이 생성된다. 
# 위 예에서는 디렉터리에 파일이 없는 상태에서 새파일.txt를 쓰기 모드인 'w'로 열었기 때문에 새파일.txt라는 이름의 새로운 파일이 디렉터리에 생성되는 것이다. 

# 새 파일.txt 파일을 C:/doit 디렉터리에 생성하고 싶다면 다음과 같이 작성해야한다. 
f = open("C:/doit/새파일.txt", 'w')
f.close()

# f.close()는 열려 있는 파일 객체를 닫아 주는 역할을 한다. 생략해도 된다. 하지만 사용해주는 게 좋다. 

# 파일을 쓰기 모드로 열어 출력값 적기
f = open("C:/doit/새파일.txt", 'w')
for i in range(1, 11):
  data = "%d번째 줄입니다.\n" % i
  f.write(data)
f.close()
# 위 아래 비교해보자. 
for i in range(1, 11):
  data = "%d번째 줄입니다.\n" % i
  print(data)

# 차이는 data를 출력하는 방법이다. 
# 위는 파일에 결괏값을 적는 방식이고, 아래는 우리가 늘 사용해오던 모니터에 표시하는 방법이다. 
# 위는 파일 객체 f의 write 함수를 사용했고, 아래는 print를 사용했다. 

# 프로그램의 외부에 저장된 파일을 읽는 여러가지 방법
# 1. readline 함수 사용하기
f = open("C:/doit/새파일.txt", 'r')
line = f.readline()
print(line)
f.close()
# 위 경우 새파일.tx에의 가장 첫번째 줄이 출력될 것이다.

# 모든 줄을 읽어서 화면에 출력하고 싶을때
# while문 사용하기
f = open("C:/doit/새파일.txt", 'r')
while True:
  line = f.readline()
  if not line: break
  print(line)
f.close()
# while True: 무한루프 안에서 f.readline()을 사용해 파일을 계속 읽어내려가는 방식이다. 
# 더 이상 읽을 줄이 없으면 break를 수행한다. 

# 위 프로그램과 비교하기
while 1:
  data = input()
  if not data: break
  print(data)

# 차이점: 입력을 받는 방식이다. 위 예시는 파일을 사용한 입력이고, 아래 예시는 키보드를 사용한 입력방법이다. 
# 2. readline's' 함수 사용하기
f = open("C:/doit/새파일.txt", 'r')
lines = f.readlines()
for line in lines:
  print(line)
f.close()
# readlines 함수는 파일의 모든 줄을 읽어서 각각의 줄을 요소로 갖는 리스트로 돌려준다. 따라서 위 예에서 lines는 리스트 ["1 번째 줄입니다.", "2번째 줄입니다. ... 
# "10번째 줄입니다."] 가 된다. s가 하나 더 붙어있음을 유의하자.

# 3. read 함수 사용하기 
f = open("C:/doit/새파일.txt", 'r')
data = f.read()
print(data)
f.close()
# f.read()는 파일의 내용 전체를 문자열로 돌려준다. 따라서 위 예의 data는 파일의 전체 내용이다. 

# 파일에 새로운 내용 추가하기
# 쓰기 모드('w')로 이미 존재하는 파일을 열면 그 파일의 내용이 모두 사라진다. 따라서 내용을 추가하고 싶을땐,
# 추가모드('a')로 열어야한다. 
f = open("C:/doit/새파일.txt", 'a')
for i in range(11, 20):
  data = "%d 번째 줄입니다.\n" % i
  f.write(data)
f.close()

# with문과 함께 사용하기
# before(지금까지 해오던 방식)
f = open("foo.txt", 'w')
f.write("Life is too short, you need python")
f.close()

# after(with문 사용)
with open("foo.txt", 'w') as f:
  f.write("Life is too short, you need python")
# with문을 사용하면 with 블록을 벗어나는 순간 열린 파일 객체 f가 자동으로 close되어 편리하다. 

# 심화
# sys 모듈로 매개변수 주기
# 파이썬에서는 sys 모듈을 사용하여 매개변수를 직접 줄 수 있다. sys 모듈을 사용하려면 import 명령어를 사용해야 한다. 
import sys

args = sys.argv[1:]
for i in args:
  print(i)

# 입력받은 인수를 for문을 사용해서 차례대로 하나씩 출력하는 예이다. sys 모듈의 argv는 명령 프롬프트 상에서 입력한 인수를 의미한다. 
# 즉 argv[0]은 파일 이름 sys1.py가 되고 argv[1]부터는 뒤에 따라오는 인수가 차례로 argv의 요소가 된다. 
# sys2.py
import sys
args = sys.argv[1:]
for i in args:
  print(i.upper(), end=" ")

