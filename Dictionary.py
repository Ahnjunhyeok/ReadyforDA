# Dictionary.py
# 딕셔너리는 리스트나 튜플처럼 순차적으로 해당 요솟값을 구하지 않고 Key를 통해 Value를 얻는다. 딕셔너리의 가장 큰 특징이다.

# 딕셔너리의 기본형
# {Key1:Value1, Key2:Value2, Key3:Value3, ...}

# Key와 Value의 쌍 여러 개가 {}로 둘러싸여 있다. 
# Key에는 변하지 않는 값을 사용하고, Value에는 변하는 값과 변하지 않는 값을 모두 사용할 수 있다. 

dic = {"name":"pey", "phone":"01049317260", "birth":"0905"}
a = {1:"hi"}

# Value에 리스트도 추가 가능하다.
a = {"a":[1, 2, 3]}

# 1. 딕셔너리 쌍 추가, 삭제하기
a = {1: "a"}
a[2] = "b"
print(a)

a["name"] = "pey"
print(a)

a[3] = [1, 2, 3]
print(a)

# 2. 딕셔너리 요소 삭제하기
del a[1] # Key가 1인 Key:Value 쌍 삭제
print(a)

# 딕셔너리를 사용하는 방법
a = {"김연아":"피겨 스케이팅", "박지성":"축구", "류현진":"야구", "귀도":"파이썬"}

# 딕셔너리는 꽤나 편리하다!

# 딕셔너리에서 Key 사용해 Value 얻기
grade = {"pey":10, "julliet": 99}
print(grade["pey"])
print(grade["julliet"])

# 딕셔너리는 요솟값을 얻고자 할때, 인덱싱이나 슬라이싱이 아닌 Key를 사용해 Value를 얻는 방법 한가지 뿐이다.

a = {1:"a", 2:"b"}
print(a[1])

print(a[2]) # 딕셔너리 변수 이름[Key]를 사용한다. 

dic = {"name":"pey", "phone":"01049317260", "birth":"0905"}
print(dic["name"])

print(dic["phone"])

# 딕셔너리 만들 때 주의사항
a = {1:"a", 1:"b"}
print(a) # 중복되는 Key에서 1개를 제외한 나머지 Key:Value 값이 모두 무시되는 이유는 Key를 통해 Value를 얻는 딕셔너리의 특징 때문이다.

# 동일한 Key가 존재하면 어떤 Key에 해당하는 Value를 불러야 할지 알 수 없기 때문이다. 

# 주의사항 : Key에 리스트는 쓸 수 없다.
# 하지만 튜플은 Key로 쓸 수 있다. 

# 리스트는 그 값이 변할 수 있기 때문에 Key로 쓸 수 없다. 형 오류가 발생한다. 

# 딕셔너리 관련 함수
# 1. Key 리스트 만들기(keys)

a = {"name":"pey", "phone":"01049317260", "birth":"0905"}
a.keys()
print(a.keys())
# a.keys()는 딕셔너리 a의 Key만을 모아서 dict_keys 객체를 돌려준다. 
# dict_keys 객체는 다음과 같이 사용할 수 있다. 리스트를 사용하는 것과 차이가 없지만, 
# 리스트 고유의 append, insert, pop, remove, sort 함수는 수행할 수 '없다'.

for k in a.keys():
  print(k)

# dict_keys 객체를 리스트로 변환하려면 다음과 같이 하면 된다. 
print(list(a.keys()))

# Value 리스트 만들기(values)
print(a.values())

# Key, Value 쌍 얻기(items)
print(a.items())

# Key:Value 쌍 모두 지우기(clear)
print(a.clear())

# Key로 Value 얻기(get)
a = {"name":"pey", "phone":"01049317260", "birth":"0905"}
print(a.get("name"))
print(a.get("phone"))

# get(x) 함수는 x라는 Key에 대응되는 Value를 돌려준다. 
# get("name")은 a["name"]을 사용했을 때와 동일한 결괏값을 돌려받는다. 

# 존재하지 않는 키로 값을 가져오려는 경우에, 가령 a["nokey"]는 Key 오류를 발생시키고, 
# a.get("nokey")는 None을 돌려준다는 차이가 있다. 

a = {"name":"pey", "phone":"01049317260", "birth":"0905"}
print(a.get("nokey"))

# print(a["nokey"]) KeyError 발생

# Key 값이 없을 경우 미리 정해 둔 디폴트 값을 대신 가져오게 하고 싶을 때에는 get(x, "디폴트 값")을 사용하면 편리하다. 

print(a.get("foo", "bar"))

# 해당 Key가 딕셔너리 안에 있는지 조사하기(in)
a = {"name":"pey", "phone":"01049317260", "birth":"0905"}
print("name" in a)
print("email" in a)

# "name" 문자열은 a 딕셔너리의 Key 중 하나이다. 따라서 "name" in a를 호출하면 참(True)을 호출한다. 
# 반대로 "email"은 a 딕셔너리 안에 존재하지 않는 Key이므로 거짓(False)을 돌려준다. 