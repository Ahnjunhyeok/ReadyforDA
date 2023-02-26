# 3_label.py

from tkinter import *

root = Tk()
root.title("Junhyeok's GUI")
root.geometry("640x480")

label1 = Label(root, text="안녕하세요")
label1.pack()

# 레이블에 이미지 넣기
photo = PhotoImage(file="gui_basic/img.png")
label2 = Label(root, image=photo)
label2.pack()

def change():
  label1.config(text="또 만나요")
# img2.png 만들고 기존 경로와 동일하게 저장
  global photo2 # Garbage collection 때문에 photo2를 전역변수로 선언해야함
  photo2 = PhotoImage(file="gui_basic/img2.png")
  label2.config(image=photo2)

btn = Button(root, text="클릭", command=change)
btn.pack()

root.mainloop()
