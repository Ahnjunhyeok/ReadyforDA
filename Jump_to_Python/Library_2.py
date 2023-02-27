# 라이브러리_2
# shutil
# shutil은 파일을 복사해 주는 파이썬 모듈이다. 
# 다음 예시는 src라는 이름의 파일을 dst로 복사한다. 만약 dst가 디렉터리 이름이라면 src는 파일 이름으로 dst 디렉터리에 복사하고 동일한 파일 이름이 있을 경우에는 덮어쓴다. 

import shutil
shutil.copy("src.txt", "dst.txt")

# 실행해보면 src.txt 파일과 동일한 내용의 파일이 dst.txt로 복사되는 것을 알 수 있다. 

# glob
# 가끔 파일을 읽고 쓰는 기능이 있는 프로그램을 만들다 보면 특정 디렉터리에 있는 파일 이름 모두를 알아야 할 때가 있다. 
# 이럴 때 사용하는 모듈이 바로 glob이다. 

# 디렉터리에 있는 파일들을 리스트로 만들기 - glob(pathname)
# glob 모듈은 디렉텅리 안의 파일들을읽어서 돌려준다. *, ? 등 메타 문자를 써서 원하는 파일만 읽어 들일 수도 있다. 
import glob
print(glob.glob("c:/doit/mark*"))

# 위 예시는 C:doit 디렉터리에 있는 파일 중 이름이 mark로 시작하는 파일을 모두 찾아서 읽어들이는 예이다. 

# tempfile
# 파일을 임시로 만들어서 사용할 떄 유용한 모듈이 바로 tempfile이다. tempfile.mkstemp()는 중복되지 않는 임시 파일의 이름을 무작위로 만들어서 돌려준다. 
import tempfile 
filename = tempfile.mkstemp()
print(filename)

# tempfile.TemporaryFile()은 임시 저장 공간으로 사용할 파일 객체를 돌려준다. 이 파일은 기본적으로 바이너리 쓰기 모드(wb)를 갖는다. 
# f.close()가 호출되면 이 파일 객체는 자동으로 사라진다. 
import tempfile
f = tempfile.TemporaryFile()
f.close()

# time
# 시간과 관련된 time 모에는 함수가 굉장히 많다. 
# 1. time.time
# time.time()은 UTC(Universal Time Coordinated 협정 세계 표준시)를 사용하여 현재 시간을 실수 형태로 돌려주는 함수이다. 
# 1970년 1월 1일 0시 0분 0초를 기준으로 지난 시간을 초 단위로 돌려준다. 
import time
print(time.time())

# 2. time.localtime
# time.localtime은 time.time()이 돌려준 실수 값을 사용해서 연도, 월, 일, 시, 분, 초 ... 등의 형태로 바꾸어 주는 함수이다. 
print(time.localtime((time.time())))

# 3. time.asctime
# 위 time.localtime에 의해서 반환된 튜플 형태의 값을 인수로 받아서 날짜와 시간을 알아보기 쉬운 형태로 돌려주는 함수이다. 
print(time.asctime(time.localtime(time.time())))

# 4. time.ctime()
# time.asctime(time.localtime(time.time()))은 time.ctime()을 사용해 간편하게 표시할 수 있다. asctime과 다른 점은 ctime은 항상 현재 시간만을 돌려준다는 점이다. 
print(time.ctime())

# 5. time.strtime
# time.strtime("출력할 형식 포맷 코드", time.localtime(time.time()))
# strtime 함수는 시간에 관계된 것을 세밀하게 표현하는 여러 가지 포맷 코드를 제공한다. 

# 점프 투 파이썬 포맷코드 p.254 확인하기

# 다음은 time.strtime을 사용하는 예이다. 
import time
print(time.strtime("%x", time.localtime(time.time())))
print(time.strtime("%c", time.localtime(time.time())))

# 6. time.sleep
# time.sleep 함수는 주로 루프 안에서 많이 사용한다. 이 함수를 사용하면 일정한 시간 간격을 두고 루프를 실행할 수 있다. 
import time
for i in range(10):
  print(i)
  time.sleep(1)
# time.sleep 함수의 인수는 실수 형태를 쓸 수 있다. 

# Calendar
# calendar는 파이썬에서 달력을 볼 수 있게 해주는 모듈이다. 
# calendar.calendar(연도)로 사용하면 그 해의 전체 달력을 볼 수 있다. 결괏값은 달력이 너무 길어 생략하겠다. 
import calendar
print(calendar.calendar(2022))

# calendar.prcal(연도)를 사용해도 위와 똑같은 결괏값을 얻을 수 있다. 
print(calendar.prcal(2022))

# 다음 예는 지정년도, 지정 월의 달력만 보여준다. 
# print(calendar.prmonth(int1, int2))
print(calendar.premonth(2022, 12))

# calendar.weekday
# calendar 모듈의 또 다른 유용한 함수를 보자. weekday(연도, 월, 일) 함수는 그 날짜에 해당하는 요일 정보를 돌려준다. 
# 월요일은 0, 화요일은 1, 수요일은 2, 목요일은 3, 금요일은 4, 토요일은 5, 일요일은 6이라는 값을 돌려준다. 
print(calendar.weekday(2022, 12, 21))

# calendar.monthrange
# monthrange(연도, 월) 함수는 입력받은 달의 1일이 무슨 요일인지와 그 달이 며칠까지 있는지를 튜플 형태로 돌려준다. 
print(calendar.monthrange(2022, 12))

# random
# random은 난수(규칙이 없는 임의의 수)를 발생시키는 모듈이다. random과 randint에 대해 알아보자. 

# 다음은 0.0에서 1.0 사이의 실수 중에서 난수 값을 돌려주는 예를 보여준다. 
import random
print(random.random())

# 다음 예는 1에서 10 사이의 정수 중에서 난수 값을 돌려준다. 
print(random.randint(1, 10))

# 다음 예는 1에서 55 사이의 정수 중에서 난수 값을 돌려준다. 
print(random.randint(1, 55))

# random 모듈을 사용해서 재밌는 함수를 하나 만들어본다. 
import random
def random_pop(data):
  number = random.randint(0, len(data)-1)
  return data.pop(number)

if __name__ == "__main__":
  data = [1, 2, 3, 4, 5]
  while data: print(random_pop(data))

# 위 random_pop 함수는 리스트의 요소 중에서 무작위로 하나를 선택하여 꺼낸 다음 그 값을 돌려준다. 물론 꺼낸 요소는 pop 메서드에 의해 사라진다. 
# random_pop 함수는 random 모듈의 choice 함수를 사용하여 다음과 같이 좀 더 직관적으로 만들 수 있다. 
def random_pop(data):
  number = random.choice(data)
  data.remove(number)
  return number

# random.choice 함수는 입력으로 받은 리스트에서 무작위로 하나를 선택하여 돌려준다. 

# 리스트의 항목을 무작위로 섞고 싶을 때는 random.shuffle 함수를 사용하면 된다. 
import random 
data = [1, 2, 3, 4, 5]
random.shuffle(data)
print(data)

# webbrowser
# webbrowser는 자신의 시스템에서 사용하는 기본 웹 브라우저를 자동으로 실행하는 모듈이다. 
import webbrowser
webbrowser.open("http://google.com")

# webbrowser의 open 함수는 웹 브라우저가 이미 실행된 상태라면 입력 주소로 이동한다. 
# 만약 웹 브라우저가 실행되지 않은 상태라면 새로 웹 브라우저를 실행한 후 해당 주소로 이동한다. 

# open_new 함수는 이미 웹 브라우저가 실행된 상태이더라도 새로운 창으로 해당 주소가 열리게 한다. 
webbrowser.open_new("http://google.com")

# 스레드를 다루는 threading 모듈
# 스레드를 프로그래밍은 초보 프로그래머가 구현하기느는 매우 어려운 기술이다. 
# 컴퓨터에서 동작하고 있는 프로그램을 프로세스라고 한다. 보통 1개의 프로세스는 한 가지 일만 하지만 스레드(Thread)를 사용하면 한 프로세스 안에서 2가지 또는 그 이상의 일을 동시에 수행할 수 있다. 

# thread_test.py
import time

def long_task():
  for i in range(5):
    time.sleep(1)
    print("working:%s\n" % i)

print("Start")

for i in range(5):
  long_task()

print("End")

# long_task 함수는 수행하는 데 5초의 시간이 걸리는 함수이다. 위 프로그램은 이 함수를 총 5번 반복해서 수행하는 프로그램이다. 
# 이 프로그램은 5초가 5번 반복되니 총 25초의 시간이 걸린다. 
# 하지만 앞에서 설명했듯이 스레드를 사용하면 5초의 시간이 걸리는 long_task 함수를 동시에 실행할 수 있다. 
# 다음과 같이 수정해보자

# thread_test.py
import time
import threading # 스레드를 생성하기 우ㅐ해서는 threading 모듈이 필요하다. 

def long_task():
  for i in range(5):
    time.sleep(1)
    print("working:%s\n" % i)

print("Start")

threads = []
for i in range(5):
  t = threading.Thread(target=long_task) # 스레드를 생성한다. 
  threads.append(t)

for t in threads:
  t.start() # 스레드를 실행한다. 

print("End")

# 이렇게 수정하면 25초 정도 걸리던 작업이 5초 정도에 수행되는 것을 확인할 수 있다. 
# threading.Thread를 사용하여 만든 스레드 객체가 동시 작업을 가능하게 해 주기 때문이다. 
# 하지만 위 프로그램을 실행해보면 "Start" 와 "End"가 먼저 출력되고 그 이후에 스레드의 결과가 출력되는 것을 확인할 수 있다. 
# 그리고 프로그램이 정상 종료되지 않는다. 우리가 기대하는 것은 "Start"가 출력되고 그 다음에 스레드의 결과가 출력된 후 마지막으로 "End"가 출력되는 것이다. 

# 이 문제를 해결하기 위해서는 다음과 같이 프로그램을 수정해야 한다. 

# thread_test.py
import time
import threading  

def long_task():
  for i in range(5):
    time.sleep(1)
    print("working:%s\n" % i)

print("Start")

threads = []
for i in range(5):
  t = threading.Thread(target=long_task) # 스레드를 생성한다. 
  threads.append(t)
for t in threads:
  t.start() 
for t in threads:
  t.join() # join으로 스레드가 종료될 때까지 기다린다.  

print("End")
# 스레드의 join 함수는 해당 스레드가 종료될 때까지 기다리게 한다. 따라서 위와 같이 수정하면 우리가 원하던 출력을 보게 된다. 
