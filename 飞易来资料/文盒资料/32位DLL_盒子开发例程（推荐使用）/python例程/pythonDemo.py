# -*- coding: cp936 -*-
import ctypes
import string
import time
from ctypes import *  # ���� ctypes ��������ģ��
if __name__ == '__main__':
    objdll = ctypes.windll.LoadLibrary('msdk.dll')
    hdl = objdll.M_Open(1)
    print "open handle = " + str(hdl)
    time.sleep(3)  #sleep 3s ����ʱ����ʱ�ڼ佫���㵽���±�����������
    #���̵���
    res = objdll.M_KeyPress(hdl, 4, 2) #��
    print "M_KeyPress =  " + str(res)
    #�����ַ���
    VbufWr = create_string_buffer(128)      # ����һ���ɱ��ַ�������������Ϊ128
    VbufWr.raw = '12345678'
    print " WrData = " + VbufWr.raw
    pWrBuf = c_char_p() #����һ��char��ָ�����
    pWrBuf = pointer(VbufWr)
    res = objdll.M_KeyInputString(hdl, pWrBuf, 8) #����8���ַ�
    print "M_KeyInputString =  " + str(res) + " Data = " + VbufWr.raw
    #��ȡ���λ��
    VintX = c_int()   #����һ��int�ͱ���
    pIntX = pointer(VintX) #ȡ�øñ���ָ��
    VintY = c_int()   #����һ��int�ͱ���
    pIntY = pointer(VintY) #ȡ�øñ���ָ��
    res = objdll.M_GetCurrMousePos2(pIntX, pIntY) #ȡ�õ�ֵ�����VintX.value VintY.value��
    print "M_GetCurrMousePos2  X= " + str(VintX.value) + " Y= " + str(VintY.value) #ע�⣬������VintX.value VintY.value

    res = objdll.M_Close(hdl)
    print "close handle = " + str(res)
    raw_input('\n******************ALL OK; Press ENTER to EXIT**********') 