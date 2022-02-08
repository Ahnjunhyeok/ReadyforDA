# 2_button.py

from tkinter import *

root = Tk()
root.title("Junhyeok's GUI")

btn1 = Button(root, text= "버튼1")
btn1.pack()

btn2 = Button(root, padx=5, pady=10, text="버튼2")
btn2.pack()

btn3 = Button(root, padx=10, pady=5, text="버튼3") # 텍스트 길이에 따라 버튼 크기가 바뀜; 변동값
btn3.pack()

btn4 = Button(root, width=10, height=3, text="버튼4") # 텍스트 길이에 따라 버튼 크기가 바뀌지 않음; 고정값
btn4.pack()

btn5 = Button(root, fg="red", bg="yellow", text="버튼5")
btn5.pack()

# 그람판에서 img.png 만들고 pythonworkspace 안에 gui_basic에 저장

photo = PhotoImage(file="gui_basic/img.png")
btn6 = Button(root, image=photo)
btn6.pack()

def btncmd():
  print("버튼이 클릭되었어요")
  
btn7 = Button(root, text="동작하는 버튼", command=btncmd)
btn7.pack()

root.mainloop()