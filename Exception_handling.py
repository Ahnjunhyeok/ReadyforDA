# 오류는 어떨 때 발생하는가?
# 1. 디렉터리 안에 없는 파일을 열려고 시도했을 때 발생하는 오류
# f = open("나없는 파일", 'r')

# FileNotFoundError가 발생한다. 

# 2. 0으로 다른 숫자를 나누는 경우
# print(4 / 0)

# ZeroDivisionError가 발생한다. 

# 3. 리스트에서 얻을 수 없는 값을 불러오는 경우
# a = [1, 2, 3]
# print(a[4])

# IndexError가 발생한다. 

# 오류 예외 처리 기법
# 1. try, except문 
# 구조:
# try:  
    # ...
# except [발생 오류[as 오류 메세지 변수]]:
    # ...
    
# try 블록 수행 중 오류가 발생하면 except 블록이 수행된다. 하지만 try 블록에서 오류가 발생하지 않는다면 except 블록은 수행되지 않는다. 

# except [발생 오류[as 오류 메세지 변수]]:
# 위 구문을 보면 [] 기호를 사용하는데, 이 기호는 괄호 안의 내용을 생략할 수 있다는 관례 표현 기법이다. 즉 except 구문은 다음 3가지 방법으로 사용할 수 있다.

# 1) try, except만 쓰는 방법
# 이 경우에는 오류 종류에 상관없이 오류가 발생하면 except 블록을 수행한다. 
# 구조
# # try:  
    # ...
# except:
    # ...
 

# 2) 발생 오류만 포함한 except문
# 이 경우는 미리 오류가 발생했을 때 except 문에 미리 정해놓은 오류 이름과 일치할 때만 except 블록을 수행한다는 것이다. 
# 구조
# try:  
    # ...
# except 발생 오류:
    # ...

# 3) 발생 오류와 오류 메시지 변수까지 포함한 except문
# 두 번째 경우에서 오류 매ㅔ시지의 내용까지 알고 싶을 때 사용하는 방법이다.
# 구조
# try:  
    # ...
# except 발생 오류 as 오류 메세지 변수:
    # ...

# example

try:
    4 / 0
except ZeroDivisionError as e:
    print(e)
    
# 2. try ... finally
# try 문에는 finally 절을 사용할 수 있다. finally 절은 try문 수행 도중 예외 발생 여부와 상관없이 항상 수행된다. 
# 보통 finally 절은 사용한 리소스를 close해야 할 때에 많이 사용한다. 
f = open("foo.txt", "w")
try:
    print("a")
finally:
    f.close()
    
# 여러 개의 오류 처리하기 
# try문 안에서 여러 개의 오류를 처리하기 위해 다음 구문을 사용한다. 
# try:
    # ...
# except 발생 오류 1:
    # ...
# except 발생 오류 2:
    # ... 

# 0으로 나누는 오류와 인덱싱 오류를 동시에 처리할 수 있다. 
try:
    a = [1, 2]
    print(a[3])
    print(4 / 0) 
except ZeroDivisionError:
    print("0으로 나눌 수 없습니다.")
except IndexError: 
    print("인덱싱할 수 없습니다.")

# 오류 메시지도 다음과 같이 가져올 수 있다. 
try:
    a = [1, 2]
    print(a[3])
    print(4 / 0) 
except ZeroDivisionError as e:
    print(e)
except IndexError as e: 
    print(e)

# 다음과 같이 ZeroDivisionError, IndexError를 함께 처리할 수 있다. 
try:
    a = [1, 2]
    print(a[3])
    print(4 / 0) 
except (ZeroDivisionError, IndexError) as e:
    print(e)
# 2개 이상 오류처리 시에는 반드시 괄호를 사용해서 함께 묶어 처리해야한다. 

# 오류 회피하기
# 특정 오류가 발생할 때 그냥 통과시켜야 하는 경우에 사용
try:
    f = open("나없는파일.txt", "r")
except FileNotFoundError:
    pass
# try문 안에서 FileNotFoundError가 발생할 경우에 pass를 사용하여 오류를 그냥 회피하도록 작성한 예제이다. 

 