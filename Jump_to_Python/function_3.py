# function_3.py
# 사용자의 입력과 출력
# 1. 사용자 입력
a = input()
print(a)
# input은 입력되는 모든 것을 문자열로 취급한다. 

# 1-1. 프롬프트 값을 띄워서 사용자 입력받기 
# input("질문 내용")

number = input("숫자를 입력하세요: ")
print(number)

# print 자세히 알기
# 지금까지의 print 사용
a = 123
print(a)

a = "Python"
print(a)

a = [1, 2, 3]
print(a)

# 추가내용
# 1. 큰따옴표("")로 둘러싸인 문자열은 + 연산과 동일하다. 
print("Life" "is" "too short")
print("Life"+"is"+"too short")

# 2. 문자열 띄어쓰기는 콤마로 한다. 
print("Life", "is", "too short")

# 3. 한 줄에 결괏값 출력하기
for i in range(10):
  print(i, end=" ") # 매개변수 end를 사용해 끝 문자 지정하기
