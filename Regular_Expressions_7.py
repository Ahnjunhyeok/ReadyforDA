# 문자열 바꾸기 
# sub 메서드를 사용하면 정규식과 매치되는 부분을 다른 문자로 쉽게 바꿀 수 있다. 
import re
p = re.compile("(blue|white|red)")
print(p.sub("colour", "blue socks and red shoes"))

# sub 메서드의 첫 번째 매개변수는 "바꿀 문자열"이 되고, 두 번째 매개변수는 "대상 문자열"이 된다. 
# 위 예에서 볼 수 있듯이 blue 또는 white 또는 red라는 문자열이 colour라는 문자열로 바뀌는 것을 확인할 수 있다. 

# 그런데 딱 한번만 바꾸고 싶은 경우도 있다. 이렇게 바꾸기 횟수를 제어하려면 다음과 같이 세 번째 매개변수로 count 값을 넘기면 된다. 
print(p.sub("colour", "blue socks and red shoes", count = 1))

# 처음 일치하는 blue만 colour라는 문자열로 한 번만 바꾸기가 실행되는 것을 알 수 있다. 

# sub 메서드와 유사한 subn 메서드
# subn 역시 sub와 동일한 기능을 하지만 반환 결과를 '튜플'로 돌려준다는 차이가 있다. 
# 돌려준 튜플의 첫 번째 변경된 문자열이고, 두 번째 요소는 바꾸기가 발생한 횟수이다. 
p = re.compile("(blue|white|red)")
print(p.subn("colour", "blue socks and red shoes"))

# sub 메서드를 사용할 때 참조 구문 사용하기
# sub 메서드를 사용할 때 참조 구문을 사용할 수 있다. 다음 예를 보자
p = re.compile(r"(?P<name>\w+)\s+(?P<phone>(\d+)[-]\d+[-]\d+)")
print(p.sub("\g<phone> \g<name>", "park 010-1234-1234"))

# 위 예는 "이름 + 전화번호"의 문자열을 "전화번호 + 이름"으로 바꾸는 예이다. 
# sub의 바꿀 문자열 부분에 "\g<그룹 이름>"을 사용하면 정규식의 그룹 이름을 참조할 수 있게 된다. 

# 다음과 같이 그룹 이름 대신 참조 번호를 사용해도 마찬가지 결과를 돌려준다. 
p = re.compile(r"(?P<name>\w+)\s+(?P<phone>(\d+)[-]\d+[-]\d+)")
print(p.sub("\g<2> \g<1>", "park 010-1234-1234"))

# sub 메서드의 매개변수로 함수 넣기
# sub 메서드의 첫 번째 매개변수로 함수를 넣을 수도 있다. 다음 예를 보자.
def hexrepl(match):
    value = int(match.group())
    return hex(value)

p = re.compile(r"\d+")
print(p.sub(hexrepl, "Call 65490 for printing, 49152 for user code"))

# hexrepl 함수는 match 객체(위에서 숫자에 매치되는)를 입력으로 받아 16진수로 변환하여 돌려주는 함수이다. 
# sub의 첫 번째 매개변수로 함수를 사용할 경우 해당 함수의 첫 번째 매개 변수에는 정규식과 매치된 match 객체가 입력된다. 
# 그리고 매치되는 문자열은 함수의 반환 값으로 바뀌게 된다. 

# Greedy vs Non-Greedy
# 정규식에서 Greedy(탐욕스러운)란 어떤 의미일까? 다음 예제를 보자.
s = "<html><head><title>Title</title>" 
print(len(s))

print(re.match("<.*>", s).span())

print(re.match("<.*>", s).group())

# "<.*>" 정규식의 매치 결과로 <html> 문자열을 돌려주기를 기대했을 것이다. 
# 하지만 * 메타 문자는 매우 탐욕스러워서 매치할 수 있는 최대한의 문자열인 <html><head><title>Title</title> 문자열을 모두 소비해 버렸다. 
# 어떻게 하면 이 탐욕스러움을 제한하고 <html> 문자열까지만 소비하도록 막을 수 있을까?

# 다음과 같이 non-greedy 문자인 ?를 사용하면 *의 탐욕을 제한할 수 있다. 
print(re.match("<.*?>", s).group())

# non-greedy 문자인 ?는 *?, +?, ??, {m, n}?와 같이 사용할 수 있다. 
# 가능한 한 가장 최소한의 반복을 수행하도록 도와주는 역할을 한다. 

