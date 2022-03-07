# while문은 반복문이라고도 불린다.
# while문의 기본 구조
# while 조건문:
    # 수행할 문장 1
    # 수행할 문장 2
    # 수행할 문장 3

# while문은 조건문이 참인 동안에 while문 아래의 문장이 반복해서 수행된다.

treeHit = 0 # 나무를 찍은 횟수
while treeHit < 10: # 나무를 찍은 횟수가 10보다 작은 동안 반복
    treeHit = treeHit + 1 
    print("나무를 %d번 찍었습니다." % treeHit)
    if treeHit == 10: # 나무를 열 번 찍으면
        print("나무 넘어갑니다.")

# 위 예시의 while문의 조건문은 treeHit < 10 이다. 즉 treeHit가 10보다 작은 동안에 while문 안의 문장을 계속 수행한다. 
# while문 안의 문장을 보면 제일 문저 treeHit = treeHit + 1로 treeHit의 값이 계속 1씩 증가한다. 
# 그리고 나무를 treeHit번만큼 찍었음을 알리는 문장을 출력하고 treeHit가 10이 되면 "나무 넘어갑니다."라는 문장을 출력한다.
# 그러고 나면 treeHit < 10 조건문이 거짓이 되므로 while문을 빠져나가게 된다. 

# while문 만들기
# 여러 가지 선택지 중 하나를 선택해서 입력받는 예제 만들기
prompt = """

1. Add
2. Del
3. List
4. Quit

Enter number:  """

number = 0 # 번호를 입력받을 변수
while number != 4: # 입력받은 번호가 4가 아닌 동안 반복한다.
   print(prompt)
   number = int(input())
       
# while문 강제로 빠져나가기
coffee = 10 # 자판기에 커피가 10개 있다.
money = 300 # 자판기에 넣을 돈은 300원이다.
while money:
    print("돈을 받았으니 커피를 줍니다.")
    coffee = coffee - 1 # while문을 한 번 돌 때 커피가 하나 줄어든다.
    print("남은 커피의 양은 %d잔입니다." % coffee)
    if coffee == 0:
        print("커피가 다 떨어졌습니다. 판매를 중지합니다.")
        break
# money가 300으로 고정되어 있으므로 while money:에서 조건문인 money는 0이 아니기 때문에 항상 참이다.
# 따라서 무한히 반복되는 무한루프를 돌게 된다. 
# 그리고 while문의 내용을 한 번 수행할 때마다 coffee = coffee - 1에 의해서 coffee의 개수가 1개씩 줄어든다.
# 만약 coffee가 0이 되면 if coffee == 0: 문장에서 coffee == 0:이 참이 되므로 
# if문 다음 문장 "커피가 다 쩔어졌습니다. 판매를 중지합니다." 가 수행되고 break문이 호출되어 while문을 빠져나가게 된다. 

# 위 예시 변형
coffee = 10
while True:
    money = int(input("돈을 넣어주세요: "))
    if money == 300:
        print("커피를 줍니다.")
        coffee = coffee - 1
    elif money > 300:
        print("거스름돈 %d원을 주고 커피를 줍니다." % (money - 300))
        coffee = coffee - 1
    else:
        print("돈을 다시 돌려주고 커피를 주지 않습니다.")
        print("남은 커피의 양은 %d개입니다." % coffee)
    if coffee == 0:
        print("커피가 다 떨어졌습니다. 판매를 중지합니다.")
        break
    
# while문의 맨 처음으로 돌아가기
a = 0
while a < 10:
    a = a + 1
    if a % 2 == 0: continue
    print(a)
# 위 예시는 1부터 10까지의 숫자 중 홀수만 출력하는 예이다. a가 10보다 작은 동안 a는 1만큼씩 계속 증가한다. 
# if a % 2 == 0이 참이 되는 경우는 a가 짝수일 때이다. 즉 a가 짝수이면 continue 문장을 수행한다. 이 continue 문장을 수행한다. 
# continue문은 while문의 맨 처음으로 돌아가게 하는 명령어이다. 따라서 위 예에서 a가 짝수이면 print(a)는 수행되지 않을 것이다.

# 무한루프

while True:
    print("Ctrl+C를 눌러야 while문을 빠져나갈 수 있습니다.")
