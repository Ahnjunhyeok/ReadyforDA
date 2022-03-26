# 6-3. 게시판 페이징하기
# 게시물의 총 건수와 한 페이지에 보여줄 게시물 수를 입력으로 주었을 때 총 페이지 수를 출력하는 프로그램이 필요하다. 
# 함수 이름은? getTotalPage
# 입력받는 값은? 게시물의 총 건수(m), 한 페이지에 보여 줄 게시물 수(n)
# 출력하는 값은? 총 페이지 수

# 게시물의 총 건수가 5이고 한 페이지에서 보여 줄 게시물 수가 10이먄 총 페이지 수는 당연히 1이 된다. 
# 만약 게시물의 총 건수가 15이고 한 페이지에서 보여 줄 게시물의 수가 10이라면 총 페이지 수는 2가 될 것이다. 

# 게시물의 총 건수(m)  페이지 당 보여 줄 게시물 수(n)  총 페이지 수
#       5                   10                          1
#       15                  10                          2
#       25                  10                          3
#       30                  10                          3

# 1. 다음과 같이 총 건수(m)를 한 페이지에 보여 줄 게시물 수(n)로 나누고 1을 더하면 총 페이지 수를 얻을 수 있다. 
# 총 페이지 수 = (총 건수 / 한 페이지당 보여 줄 건수) + 1

# 2. 이러한 공식을 적용했을 경우 총 페이지 수가 표으 값 처럼 구해지는지 확인해 보자(m을 n으로 나눌 때 소수점 아래 자리를 버리기 위해 / 대신 // 연산자를 사용했다.)
def getTotalPage(m, n):
    return m // n + 1

print(getTotalPage(5, 10)) # 첫번째 케이스, 1이 출력됨
print(getTotalPage(15, 10)) # 두 번째 케이스, 2가 출력됨
print(getTotalPage(25, 10)) # 세 번째 케이스, 3이 출력됨
print(getTotalPage(30, 10)) # 네 번째 케이스, 3이 출력되어야 하는데 4가 출력됨

# 1, 2, 3번째 케이스는 공식에 맞게 결과가 출력된다. 하지만 네 번째 케이스는 총 건수가 30이고 한 페이지에 보여 줄 건수가 10인데 4가 출력되어 실패해 버렸다. 
# 총 건수가 30이고 한 페이지에 보여 줄 건수가 10이라면 당연히 총 페이지 수는 3이 되어야 한다. 

# 3. 실패 케이스는 총 게시물 수와 한 페이지에 보여 줄 게시물 수를 나눈 나머지 값이 0이 될 때 발생함을 유추할 수 있다. 
# 이 실패 케이스를 해결하기 위해서는 다음과 같이 코드를 변경해야 한다. 
def getTotalPage(m, n):
    if m % n == 0: # 해당 if 문을 추가해야 함. 
        return m // n
    else:
        return m // n + 1

print(getTotalPage(5, 10)) # 첫번째 케이스, 1이 출력됨
print(getTotalPage(15, 10)) # 두 번째 케이스, 2가 출력됨
print(getTotalPage(25, 10)) # 세 번째 케이스, 3이 출력됨
print(getTotalPage(30, 10)) # 네 번째 케이스, 3이 출력되어야 하는데 4가 출력됨

# 나누었을 때 나머지가 0인 경우는 나누기의 몫만 돌려주고 그 이외의 경우에는 1을 더하여 돌려주도록 변경했다. 

# 6-4. 간단한 메모장 만들기
# 원하는 메모를 파일에 저장하고 추가 및 조회가 가능한 간단한 메모장을 만들어 보자
# 필요한 기능은? 메모 추가하기, 메모 조회하기
# 입력받는 값은? 메모 내용, 프로그램 실행 옵션
# 출력하는 값은? memo.txt

# 가장 먼저 할 일은 메모를 추가하는 것이다. 다음 명령을 실행했을 때 메모를 추가할 수 있도록 만든다. 
# python memo.py -a "Life is too short" 

# memo.py는 우리가 작성할 파이썬 프로그램 이름이다. -a는 이 프로그램의 실행 옵션이고 "Life is too short"는 추가할 메모 내용이 된다. 

# 1. 우선 다음과 같이 입력으로 받은 옵션과 메모를 출력하는 코드를 작성해보자. 
import sys

option = sys.argv[1]
memo = sys.argv[2]

print(option)
print(memo)

# sys.argv는 프로그램을 실행할 때 입력된 값을 읽어 들일 수 있는 파이썬 라이브러리이다.
# sys.argv[0]는 입력받은 값 중에서 파이썬 프로그램 이름인 memo.py 이므로 우리가 만드려는 기능에는 필요없는 값이다. 
# 그리고 순서대로 sys.argv[1]은 프로그램 실행 옵션 값이 되고 sys.argv[2]는 메모 내용이 된다. 

# 2. memo.py를 작성했다면 다음 명령을 수행해보자.
# C:\doit>python memo -a "Life is too short"
# -a
# Life is too short

# 3. 이제 입력으로 받은 메모를 파일에 쓰도록 코드를 변경해보자
import sys

option = sys.argv[1]

if option == "-a":
    memo = sys.argv[2]
    f = open("memo.txt", "a")
    f.write(memo)
    f.write("\n")
    f.close()
    
# 옵션이 -a인 경우에만 memo 값을 읽어 memo.txt 파일에 그 값을 쓰도록 코드를 작성했다. 
# 여기에서 메모는 항상 새로운 내용이 작성되는 것이 아니라 한 줄씩 추가되어야 하므로 파일 열기 모드를 a로 했다. 
# 그리고 메모를 추가할 때마다 다음 줄에 저장되도록 줄바꿈 문자(\n)도 추가로 파일에 쓰게 했다.

# 4. 이제 다음과 같은 명령을 수행해보자
# C:\doit>python memo -a "Life is too short"
# C:\doit>python memo -a "You need python"

# 그리고 파일에 정상적으로 메모가 기입되었는지 다음과 같이 확인해 보자
# C:\doit>type memo.txt
# Life is too short
# You need python

# 추가된 메모가 정상적으로 저장된 것을 볼 수 있다. 

# 5. 이번에는 작성한 메모를 출력하는 부분을 만들 차례이다. 메모 출력은 다음과 같이 동작하도록 만들어 보자
# python memo.py -v

# 메모 추가는 -a 옵션을 사용하고 메모 출력은 -v 옵션을 사용한다. 

# 이제 메모 출력을 위해 다음과 같이 코드를 변경해보자
import sys

option = sys.argv[1]

if option == "-a":
    memo = sys.argv[2]
    f = open("memo.txt", "a")
    f.write(memo)
    f.write("\n")
    f.close()
elif option == "-v":
    f = open("memo.txt")
    memo = f.read()
    f.close()
    print(memo)
    
# 옵션으로 -v가 들어온 경우 memo.txt 파일을 읽어서 출력한다. 

# 6. 코드를 수정한 후 다음과 같은 명령을 수행해 보자
# C:\doit>python memo.py -v
# Life is too short
# You need python

# 입력한 메모가 그대로 출력되는 것을 확인할 수 있다. 
