# Class_4.py
# 생성자
# FourCal 클래스의 인스턴스 a에 setdata 메서드를 수행하지 않고 add 메서드를 수행하면 오류가 발생한다. setdata 메서드를 수행해야 객체 a의 객체변수 first와 second가 생성되기 때문이다. 
# 이렇게 객체에 초깃값을 설정해야 할 필요가 있을 때는 setdata와 같은 메서드를 호출하기 보다는 생성자를 구현하는 것이 안전하다. 
# 생성자란 객체가 생성될 때 자동으로 호출되는 메서드를 의미한다. 
# 파이썬 이름으로 __init__를 사용하면 이 메서드는 생성자가 된다. 
class FourCal:
  def __init__(self, first, second):
    self.first = first
    self.second = second
  def setdata(self, first, second):
    self.first = first
    self.second = second
  def add(self):
    result = self.first + self.second
    return result
  def mul(self):
    result = self.first * self.second
    return result
  def sub(self):
    result = self.first - self.second
    return result
  def div(self):
    result = self.first / self.second
    return result
# a = FourCal()을 수행할 때 생성자 __init__이 호출되어 오류가 발생했다. 오류가 발생ㄹ한 이유는 생성자의 매개변수 first와 second에 해당하는 값이 전달되지 않았기 때문이다. 
# 오류를 해결하려면 first와 second에 해당되는 값을 전달하여 객체를 생성해야 한다. 
a = FourCal(4, 2)
print(a.first)
print(a.second)  
print(a.add())
print(a.div())

# 클래스의 상속
# 어떤 클래스를 만들 때 다른 클래스의 기능을 물려받을 수 있게 만드는 것이다. 
class MoreFourCal(FourCal):
  pass
# 클래스를 상속하기 위해서는 다음처럼 클래스 이름 뒤 괄호 안에 상속할 클래스 이름을 넣어주면 된다. 
# class 클래스 이름(상속할 클래스 이름)
# MoreFourCa 클래스는 FourCal 클래스를 상속했으므로 FourCal 클래스의 모든 기능을 사용할 수 있어야 한다. 
a = MoreFourCal(4, 2)
print(a.add())
print(a.sub())
print(a.div())
print(a.mul())
# 기존 클래스가 라이브러리 형태로 제공되거나 수정이 허용되지 않는 상황이라면 상속을 사용해야 한다. 
class MoreFourCal(FourCal):
  def pow(self):
    result = self.first ** self.second
    return result

a = MoreFourCal(4, 2)
print(a.pow())

# 메서드 오버라이딩
# a = FourCal(4, 0)
# print(a.div())
# 위 같이 실행하면 제로디비젼 에러가 발생한다. 
# 0으로 나눌때 오류가 아닌 0을 돌려주도록 만드려면 어떻게 해야할까?

class SafeFourCal(FourCal):
  def div(self):
    if self.second == 0:
      return 0
    else:
      return self.first / self.second
a = SafeFourCal(4, 0)
print(a.div())

# 클래스 변수
# 객체 변수는 다른 객체들에 영향받지 않고 독립적으로 그 값을 유지한다는 점을 이미 알아봤는데, 객체변수와는 다른 클래스 변수에 대해 알아보자.
class Family:
  lastname = "박"
# Family 클래스에 선언한 lastname이 바로 클래스 변수이다. 클랴스 변수는 클래스 안에 함수를 선언하는 것과 마찬가지로 클래스 안에 변수를 선언하여 생성한다. 
print(Family.lastname)

a = Family()
b = Family()
print(a.lastname)
print(b.lastname)

# 클래스 변수 값을 변경했더니 클래스로 만든 객체의 lastname 값도 변경된다는 것을 확인할 수 있었다. 
# 즉, 클래스 변수는 클래스로 만든 모든 객체에 공유된다는 특징이 있다. 
# id 함수를 사용하면 클래스 변수가 공유된다는 사실을 증명할 수 있다. 

print(id(Family.lastname))
print(id(a.lastname))
print(id(b.lastname))

# 실무에서는 객체 변수가 클래스 변수보다 훨씬 사용하는 비율이 훨씬 높다. 
