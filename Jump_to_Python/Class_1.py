# 클래스의 필요성
# 계산기의 예시로 알아보기
result = 0 

def add(num):
    global result 
    result += num # result = result + num
    return result

print(add(3))
print(add(4))
# 이전에 계산한 결괏값을 유지하기 위해 result 전역 변수를 사용했다. 
# 만약 한 프로그램에서 2대의 계산기가 필요한 상황이 오면 어떻게 해야할까?
# 각 계산기는 각각의 결괏값을 유지해야하기 때문에 위와 같이 add 함수 하나만으로는 결괏값을 따로 유지할 수 없다. 
# 이런 경우에 함수를 각각 따로 만들어야하는 불편함이 생긴다. 
result1 = 0
result2 = 0

def add1(num):
    global result1
    result1 += num
    return result1

def add2(num):
    global result2
    result2 += num
    return result2

print(add1(3))
print(add1(4))
print(add2(3))
print(add2(7))

# 결괏값은 의도한 대로 출력이 되기는 한다. 
# 하지만 기능이 추가되어야할 수록, 게산기가 더 많이 필요할 수록 매우 복잡해질 것이다. 
# 위 같은 문제가 발생할 때, 클래스로 해결할 수 있다. 
class Calculator:
    def __init__(self):
        self.result = 0
        
    def add(self, num):
        self.result += num
        return self.result
            

cal1 = Calculator()
cal2 = Calculator()

print(cal1.add(3))
print(cal1.add(4))
print(cal2.add(3))
print(cal2.add(7))
print(cal1)
# 결과는 동일하다. 하지만 클래스를 활용한 게 더 간결하다. 
# 클래스를 사용하면 계산기 대수가 늘어나더라도 객체를 생성만 하면 되기 때문에 함수를 사용하는 경우와 달리 매우 간단해진다. 
# 빼기 기능을 추가하고 싶다면 클래스에 함수를 추가해주면 된다. 
#    def sub(self, num):
#        self.result -= num
#        return self.result

# 클래스와 객체
# 비유하자면 클래스는 과자를 만드는 과자 틀이고, 객체는 틀을 이용해 만든 과자다.
# 클래스로 만든 객체는 중요한 특징이 있다.
# 바로 객체마다 고유한 성격을 가진다는 것이다. 
# 또한 동일한 클래스로 만든 객체들은 서로 전혀 영향을 주지 않는다. 

# 예시
class Cookie:
    pass

# 위의 아무 기능도 없는 클래스에 객체를 만드는 방법 
a = Cookie()
b = Cookie()

# Cookie의 값을 돌려받은 a와 b가 바로 객체다. 마치 함수를 사용해서 그 결괏값을 돌려받는 모습과 비슷하다. 
# @중요@ ; 객체와 인스턴스의 차이
# 클래스로 만든 객체를 인스턴스라고도 한다. a = Cookie() 이렇게 만든 a는 객체이다. 그리고 a 객체는 Cookie의 인스턴스이다.
# 즉 인스턴스라는 말은 특정 객체(a)가 어떤 클래스(Cookie)의 객체인지를 관계 위주로 설명할 때 사용한다. 
