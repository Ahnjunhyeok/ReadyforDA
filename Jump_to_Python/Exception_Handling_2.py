# Exception_Handling_2.py
# 오류 일부러 발생시키기
# 프로그래밍을 하다 보면 종종 오류를 일부러 발생시켜야 할 경우도 생긴다. 
# 파이썬은 raise 명령어를 사용해 오류를 강제로 발생시킬 수 있다. 

# 예시
class Bird:
  def fly(self):
    # raise NotImplementedError
    print("very fast") 

# NotImplementedError는 파이썬 내장 오류로, 꼭 작성해야하는 부분이 구현되지 않았을 경우 일부러 오류를 일으키기 위해 사용한다. 
# 위 예제는 Bird 클래스를 상속받는 자식 클래스는 반드시 fly 함수를 구현해야 한다는 의지를 보여 준다. 

# 만약 자식 클래스가 fly 함수를 구현하지 않은 상태로 fly 함수를 호출한다면?
class Eagle(Bird): # Eagle 클래스는 Bird 클래스를 '상속' 받음
  pass 

eagle = Eagle()
eagle.fly()

# Eagle 클래스에서는 fly 함수를 구현하지 않았기 때문에 Bird 클래스의 fly 함수가 호출된다. 
# 그리고 raise문에 의해 NotImplementedError가 발생할 것이다. 
# 추가설명: 상속받는 클래스에서 함수를 재구현하는 것을 메서드 오버라이딩이라고 한다. 

# NotImplementedError가 발생되지 않게 하려면 다음과 같이 Eagle 클래스에 fly 함수를 반드시 구현해야 한다. 
class Eagle(Bird): # Eagle 클래스는 Bird 클래스를 '상속' 받음
  def fly(self):
    print("very fast") 

eagle = Eagle()
eagle.fly()

# 위 예처럼 fly 함수를 구현한 후 프로그램을 실행하면 오류 없이 출력되는 것을 알 수 있다. 

# 예외 만들기
# 프로그램 수행 도중 특수한 경우만 예외 처리를 하기 위해서 종종 예외를 만들어서 사용한다. 
# 예외는 파이썬 내장 클래스인 Exception 클래스를 '상속'하여 만들 수 있다. 
class MyError(Exception):
  pass

def say_nick(nick):
  if nick == "바보":
    raise MyError()
  print(nick)

say_nick("천사")
say_nick("바보")

# 예외처리 기법을 통해 MyError 발생을 예외 처리한다. 
try:
  say_nick("천사")
  say_nick("바보")
except MyError:
  print("허용되지 않는 별명입니다.")

# 오류 메시지를 사용하고 싶다면 다음처럼 예외 처리를 하면 된다. 
try:
  say_nick("천사")
  say_nick("바보")

except MyError as e:
  print(e)

# 오류 메시지를 출력했을 때 오류 메시지가 보이게 하려면 오류 클래스에 다음과 같은 __str__ 메서드를 구현해야한다. __str__ 메서드는 print(e)처럼 오류 메시지를 print문으로
# 출력할 경우에 호출되는 메서드이다. 
