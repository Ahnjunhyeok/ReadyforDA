# 3_auto_screenshot.py
# PIL을 사용하려면 라이브러리를 다운받아야하는데, 
# 이 경우 터미널에서 pip install Pillow를 입력하고 엔터를 누르면 다운로드됨.

import time
from PIL import ImageGrab

time.sleep(5) # 5초 대기 : 사용자가 준비하는 시간

for i in range(1, 11): # 2초 간격으로 10개 이미지 저장
  img = ImageGrab.grab() # 현재 스크린 이미지를 가져옴
  img.save("image{}.png".format(i)) # 파일로 저장 (image1.png ~ image10.png)
  time.sleep(2)  # 2초 단위

# 이 프로그램 활용해서 이미지파일 1~10 생성하기
