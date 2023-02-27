# 리스트 관련 함수

# 1. 리스트에 요소 추가
a = [1, 2, 3]
a.append(4)
print(a)

# 리스트 안에는 어떠한 자료형도 추가할 수 있다. 
a = [1, 2, 3]
a.append([5, 6])
print(a) 

# 2. 리스트 정렬
a = [1, 4, 3, 2]  # 리스트의 요소를 순서대로 정렬해준다.
a.sort()
print(a)

a = ["a", "c", "b"]
a.sort()
print(a)

# 3. 리스트 뒤집기
a = ["a", "c", "b"]
a.reverse()
print(a)

# 4. 리스트 위치 반환
a = [1, 2, 3]
print(a.index(3))

# 5. 리스트 요소 삽입
a = [1, 2, 3]
a.insert(0, 4) # a[0] 위치에 4 삽입
print(a)

a.insert(3, 5)
print(a)

# 6. 리스트 요소 제거
a = [1, 2, 3, 1, 2, 3]
a.remove(3) # remove(x)는 리스트에서 첫번째로 나오는 x를 삭제하는 함수이다. 
print(a)

a.remove(3) # 한번 더 실행하면 3이 삭제된다. 
print(a)

# 7. 리스트 요소 끄집어내기
a = [1, 2, 3] 
a.pop() # pop()은 리스트의 맨 마지막 요소를 돌려주고 그 요소는 삭제한다. 
print(a)

# pop(x)는 리스트의 x번째 요소를 돌려주고 그 요소는 삭제한다. 
a = [1, 2, 3]
a.pop(1)
print(a)

# 8. 리스트에 포함된 요소 x의 개수 세기(count)
a = [1, 2, 3]
print(a.count(1))

# 9. 리스트 확장
a = [1, 2, 3]
a.extend([4, 5])
print(a)

b = [6, 7]
a.extend(b)
print(a)
