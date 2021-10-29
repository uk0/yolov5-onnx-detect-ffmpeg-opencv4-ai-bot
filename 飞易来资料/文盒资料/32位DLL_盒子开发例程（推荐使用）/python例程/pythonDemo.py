# -*- coding: cp936 -*-
import ctypes
import string
import time
from ctypes import *  # 导入 ctypes 库中所有模块
if __name__ == '__main__':
    objdll = ctypes.windll.LoadLibrary('msdk.dll')
    hdl = objdll.M_Open(1)
    print "open handle = " + str(hdl)
    time.sleep(3)  #sleep 3s 加延时，延时期间将鼠标点到记事本里，方便调试用
    #键盘单击
    res = objdll.M_KeyPress(hdl, 4, 2) #打开
    print "M_KeyPress =  " + str(res)
    #输入字符串
    VbufWr = create_string_buffer(128)      # 定义一个可变字符串变量，长度为128
    VbufWr.raw = '12345678'
    print " WrData = " + VbufWr.raw
    pWrBuf = c_char_p() #定义一个char型指针变量
    pWrBuf = pointer(VbufWr)
    res = objdll.M_KeyInputString(hdl, pWrBuf, 8) #输入8个字符
    print "M_KeyInputString =  " + str(res) + " Data = " + VbufWr.raw
    #读取鼠标位置
    VintX = c_int()   #定义一个int型变量
    pIntX = pointer(VintX) #取得该变量指针
    VintY = c_int()   #定义一个int型变量
    pIntY = pointer(VintY) #取得该变量指针
    res = objdll.M_GetCurrMousePos2(pIntX, pIntY) #取得的值存放在VintX.value VintY.value中
    print "M_GetCurrMousePos2  X= " + str(VintX.value) + " Y= " + str(VintY.value) #注意，这里是VintX.value VintY.value

    res = objdll.M_Close(hdl)
    print "close handle = " + str(res)
    raw_input('\n******************ALL OK; Press ENTER to EXIT**********') 