# 사칙연산 클래스 만들기
# 1. 클래스를 어떻게 만들지 구상하기
# 1) 숫자 2개를 입력 받아야함.
# 2) 나누기 기능, 빼기 기능, 곱하기 기능, 더하기 기능

# 구성요소
# a = FourCal()
# a.setdata(4, 2)

# print(a.add())
# print(a.mul())
# print(a.sub())
# print(a.div())

# 2. 클래스 구조 만들기
class FourCal:
    pass
a = FourCal()
print(type(a))

# 객체에 숫자 지정할 수 있게 만들기
a.setdata(4, 2)

class FourCal:
    def setdata(self, first, second):
        self.first = first
        self.second = second
# 앞에서 만든 FourCal 클래스에서 pass 문장을 삭제하고 그 대신 setdata 함수를 만들었다. 
# 클래스 안에 구현된 함수는 다른 말로 메서드(Method)라고 부른다. 
# 일반적인 함수를 만들 때 다음과 같이 작성한다. 
# def 함수 이름(매개변수):
    # 수행할 문장

# 메서드도 클래스에 포함되어 있다는 점만 제외하면 일반 함수와 다를 것이 없다. 
# setdata 메서드를 다시 보면 다음과 같다. 

# def setdata(self, first, second): # 메서드의 매개변수
    #    self.first = first  - 메서드의 수행문
    #    self.second = second - 메서드의 수행문

# 1) setdata 메서드의 매개변수
# setdata 메서드는 매개변수로 self, first, second 3개 입력값을 받는다. 일반 함수와 달리 메서드의 첫 번째 매개변수 self는 특별한 의미를 가진다. 
a = FourCal()
a.setdata(4, 2)
# setdata 메서드에는 self, first, second 총 3개의 매개변수가 필요한데 실제로는 a.setdata(4, 2)처럼 2개 값만 전달했다. 
# 그 이유는 a.setdata(4, 2)처럼 호출하면 setdata 메서드의 첫 번째 매개변수 self에는 setdata 메서드를 호출한 객체 a가 자동으로 전달되기 때문이다. 

# 파이썬 메서드의 첫 번째 매개변수 이름은 관례적으로 self를 사용한다. 객체를 호출할 때 호출한 객체 자신이 전달되기 때문에 self를 사용한 것이다. 물론 self말고 다른 이름을 사용해도 상관은 없다. 
a = FourCal()
FourCal.setdata(a, 4, 2) # 다음과 같이 클래스를 통해 메서드를 호출하는 것도 가능하다. 
# '클래스 이름.메서드' 형태로 호출할 때는 객체 a를 첫 번째 매개변수 self에 전달해 주어야 한다. 
# '객체.메서드' 형태로 호출할 때는 self를 반드시 생략해서 호출해야 한다. 




