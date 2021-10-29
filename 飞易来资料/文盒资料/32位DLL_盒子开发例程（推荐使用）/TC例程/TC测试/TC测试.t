变量 线程ID, 线程ID1, 线程ID2, 线程ID3, x, y, 盒子句柄1, II, 等待ASKII

//键盘转码加入了 a~z,1~0,回车,空格,退格,esc,有需要可以自己添加.
//编辑框保存读取功能未完善,TC官方帮助文件里很全,热键更改和dll位置更改没设置,就直接关闭更改了
//端口关闭,端口未打开的情况下关闭,会报错.
//tc不识别 " 0x "这种表达方式,所以改过Vid,Pid的需要转换成10进制数字代入.



//------------------------------------主体区-------------------------------------------------------


功能 执行()
    循环(真)
        变量 aa,bb
        等待ASKII = 键盘等待按键()
        调试输出("等待ASKII|" & 等待ASKII)
        循环(真)
            盒子KeyDown(等待ASKII)
            
            bb = 重复按键等待()
            调试输出("重复按键等待|" & bb)
            如果(bb==0)
                盒子KeyUp(等待ASKII)
                跳出
            否则如果(bb == 1)
                aa=1
                循环(aa != 0)
                    等待(50)
                    aa = (GetKeyState(等待ASKII))
                    调试输出(aa)
                    if(aa != 0)
                        
                        盒子KeyDown(等待ASKII)
                    end
                    
                结束
                盒子KeyUp(等待ASKII)
                跳出
            结束
            盒子KeyUp(等待ASKII)
            跳出
        结束
    结束
结束
功能 重复按键等待()
    变量 bb
    遍历(变量 i = 0; i < 16; i++)
        等待(30)
        bb = (GetKeyState(等待ASKII))
        调试输出("重复按键等待2|" & bb)
        如果(bb == 0)
            返回 0
        结束
    结束
    如果(bb != 0)
        返回 1
    否则
        返回 0
    结束
结束

功能 鼠标坐标()
    盒子鼠标归零()
    等待(1000)
    循环(真)
        变量 鼠标返回值 = 鼠标获取坐标(x, y)
        盒子Moveto(x, y)
    结束
结束
功能 鼠标点击()
    等待(1000)
    循环(真)
        变量 aa = 鼠标等待点击()
        如果(aa == 1000)
            盒子左键按下()
        否则如果(aa == 1001)
            盒子左键弹起()
        否则如果(aa == 1003)
            盒子右键按下()
        否则如果(aa == 1004)
            盒子右键弹起()
        结束
    结束
结束
//------------------------------------功能区-------------------------------------------------------




//启动_热键操作
功能 启动_热键()
    控件是否有效("Vid",假)
    控件是否有效("Pid",假)
    控件是否有效("编辑框0",假)
    var aa=文件读配置("盒子", "Vid", "C:\\Users\\Administrator\\Desktop\\1.ini")
    调试输出(aa)
    var bb=文件读配置("盒子", "Pid", "C:\\Users\\Administrator\\Desktop\\1.ini")
    调试输出(aa)
    编辑框设置文本("Vid",aa)
    编辑框设置文本("Pid",bb)
    端口打开VidPid()
    
    等待(100)
    文件读配置("盒子", "盒子地址", "C:\\Users\\Administrator\\Desktop\\1.ini")
    文件读配置("盒子", "盒子编号", "C:\\Users\\Administrator\\Desktop\\1.ini")
    线程ID = 线程开启("执行", "")
    等待(100)
    线程ID1 = 线程开启("鼠标坐标", "")
    等待(100)
    线程ID2 = 线程开启("鼠标点击", "")
    等待(100)
结束
//终止热键操作
功能 终止_热键()
    弹起所有按键()
    弹起所有鼠标按键()
    线程关闭(线程ID)
    线程关闭(线程ID1)
    线程关闭(线程ID2)
    
    M_端口关闭()
    
结束
功能 M_端口关闭()
    变量 aa=动态库调用(编辑框获取文本("编辑框0"), "int", "M_Close", "int", 盒子句柄1)
    调试输出("端口关闭:"&aa)
结束
功能 GetKeyState1(按键码0)
    变量 intret = 动态库调用("user32.dll", "long", "GetKeyState", "long", 按键码0)
    返回 intret
    调试输出("按键返回值|" & intret)
结束

功能 GetKeyState(按键码0)
    变量 intret = 动态库调用("user32.dll", "long", "GetAsyncKeyState", "long", 按键码0)
    返回 intret
    调试输出("按键返回值|" & intret)
结束
功能 端口打开VidPid()//十进制
    var aa=编辑框获取文本("Vid")    
    var bb=编辑框获取文本("Pid") 
    盒子句柄1=动态库调用(编辑框获取文本("编辑框0"),"int","M_Open_VidPid","int",aa,"int",bb)
    调试输出("0001号盒子句柄|"&盒子句柄1&"|"&aa&"|"&bb)
结束

功能 端口打开() 
    盒子句柄1 = 动态库调用(编辑框获取文本("编辑框0"), "int", "M_Open", "int",1) 
    调试输出("端口句柄=" & 盒子句柄1)
结束
功能 盒子KeyDown源码(USBHID)//不是常用windows标准键码,是USB-HID键码,盒子说明文件末尾有
    动态库调用(编辑框获取文本("编辑框0"), "int", "M_KeyDown", "int", 盒子句柄1, "int", USBHID) 
结束

功能 盒子KeyUp源码(USBHID)
    动态库调用(编辑框获取文本("编辑框0"), "int", "M_KeyUp", "int", 盒子句柄1, "int", USBHID)
结束
功能 盒子KeyPress源码(USBHID)
    动态库调用(编辑框获取文本("编辑框0"), "int", "M_KeyPress", "int", 盒子句柄1, "int", USBHID, "int", 1) 
结束
功能 弹起所有按键()
    变量 aa=动态库调用(编辑框获取文本("编辑框0"), "int", "M_ReleaseAllKey", "int", 盒子句柄1)
    
结束
功能 弹起所有鼠标按键()
    变量 aa=动态库调用(编辑框获取文本("编辑框0"), "int", "M_ReleaseAllMouse", "int", 盒子句柄1)
    
结束
功能 盒子KeyDown(ASKII)
    变量 USBHID
    如果(ASKII == 8)//退格
        USBHID = 42
    否则如果(ASKII == 32)//空格
        USBHID = 44
    否则如果(ASKII == 13)//回车
        USBHID = 40
    否则如果(ASKII == 27)//Esc
        USBHID = 41
    否则如果(ASKII == 65)//a~
        USBHID = 4
    否则如果(ASKII == 66)
        USBHID = 5
    否则如果(ASKII == 67)
        ASKII = 6
    否则如果(ASKII == 68)
        USBHID = 7
    否则如果(ASKII == 69)
        USBHID = 8
    否则如果(ASKII == 70)
        USBHID = 9
    否则如果(ASKII == 71)
        USBHID = 10
    否则如果(ASKII == 72)
        USBHID = 11
    否则如果(ASKII == 73)
        USBHID = 12
    否则如果(ASKII == 74)
        USBHID = 13
    否则如果(ASKII == 75)
        USBHID = 14
    否则如果(ASKII == 76)
        USBHID = 15
    否则如果(ASKII == 77)
        USBHID = 16
    否则如果(ASKII == 78)
        USBHID = 17
    否则如果(ASKII == 79)
        USBHID = 18
    否则如果(ASKII == 80)
        USBHID = 19
    否则如果(ASKII == 81)
        USBHID = 20
    否则如果(ASKII == 82)
        USBHID = 21
    否则如果(ASKII == 83)
        USBHID = 22
    否则如果(ASKII == 84)
        USBHID = 23
    否则如果(ASKII == 85)
        USBHID = 24
    否则如果(ASKII == 86)
        USBHID = 25
    否则如果(ASKII == 87)
        USBHID = 26
    否则如果(ASKII == 88)
        USBHID = 27
    否则如果(ASKII == 89)
        USBHID = 28
    否则如果(ASKII == 90)//~z
        USBHID = 29
    否则如果(ASKII == 48)//0~
        USBHID = 39
    否则如果(ASKII == 49)
        USBHID = 30
    否则如果(ASKII == 50)
        USBHID = 31
    否则如果(ASKII == 51)
        USBHID = 32
    否则如果(ASKII == 52)
        USBHID = 33
    否则如果(ASKII == 53)
        USBHID = 34
    否则如果(ASKII == 54)
        USBHID = 35
    否则如果(ASKII == 55)
        USBHID = 36
    否则如果(ASKII == 56)
        USBHID = 37
    否则如果(ASKII == 57)//~9
        USBHID = 38
    结束
    盒子KeyDown源码(USBHID)  
结束
功能 盒子KeyUp(ASKII)
    变量 USBHID
    如果(ASKII == 8)//退格
        USBHID = 42
    否则如果(ASKII == 32)//空格
        USBHID = 44
    否则如果(ASKII == 13)//回车
        USBHID = 40
    否则如果(ASKII == 27)//Esc
        USBHID = 41
    否则如果(ASKII == 65)
        USBHID = 4
    否则如果(ASKII == 66)
        USBHID = 5
    否则如果(ASKII == 67)
        ASKII = 6
    否则如果(ASKII == 68)
        USBHID = 7
    否则如果(ASKII == 69)
        USBHID = 8
    否则如果(ASKII == 70)
        USBHID = 9
    否则如果(ASKII == 71)
        USBHID = 10
    否则如果(ASKII == 72)
        USBHID = 11
    否则如果(ASKII == 73)
        USBHID = 12
    否则如果(ASKII == 74)
        USBHID = 13
    否则如果(ASKII == 75)
        USBHID = 14
    否则如果(ASKII == 76)
        USBHID = 15
    否则如果(ASKII == 77)
        USBHID = 16
    否则如果(ASKII == 78)
        USBHID = 17
    否则如果(ASKII == 79)
        USBHID = 18
    否则如果(ASKII == 80)
        USBHID = 19
    否则如果(ASKII == 81)
        USBHID = 20
    否则如果(ASKII == 82)
        USBHID = 21
    否则如果(ASKII == 83)
        USBHID = 22
    否则如果(ASKII == 84)
        USBHID = 23
    否则如果(ASKII == 85)
        USBHID = 24
    否则如果(ASKII == 86)
        USBHID = 25
    否则如果(ASKII == 87)
        USBHID = 26
    否则如果(ASKII == 88)
        USBHID = 27
    否则如果(ASKII == 89)
        USBHID = 28
    否则如果(ASKII == 90)
        USBHID = 29
    否则如果(ASKII == 48)
        USBHID = 48
    否则如果(ASKII == 49)
        USBHID = 30
    否则如果(ASKII == 50)
        USBHID = 31
    否则如果(ASKII == 51)
        USBHID = 32
    否则如果(ASKII == 52)
        USBHID = 33
    否则如果(ASKII == 53)
        USBHID = 34
    否则如果(ASKII == 54)
        USBHID = 35
    否则如果(ASKII == 55)
        USBHID = 36
    否则如果(ASKII == 56)
        USBHID = 37
    否则如果(ASKII == 57)
        USBHID = 38
    结束
    盒子KeyDown源码(USBHID)  
结束
功能 盒子KeyPress(ASKII)
    变量 USBHID
    如果(ASKII == 8)//退格
        USBHID = 42
    否则如果(ASKII == 32)//空格
        USBHID = 44
    否则如果(ASKII == 13)//回车
        USBHID = 40
    否则如果(ASKII == 27)//Esc
        USBHID = 41
    否则如果(ASKII == 65)
        USBHID = 4
    否则如果(ASKII == 66)
        USBHID = 5
    否则如果(ASKII == 67)
        ASKII = 6
    否则如果(ASKII == 68)
        USBHID = 7
    否则如果(ASKII == 69)
        USBHID = 8
    否则如果(ASKII == 70)
        USBHID = 9
    否则如果(ASKII == 71)
        USBHID = 10
    否则如果(ASKII == 72)
        USBHID = 11
    否则如果(ASKII == 73)
        USBHID = 12
    否则如果(ASKII == 74)
        USBHID = 13
    否则如果(ASKII == 75)
        USBHID = 14
    否则如果(ASKII == 76)
        USBHID = 15
    否则如果(ASKII == 77)
        USBHID = 16
    否则如果(ASKII == 78)
        USBHID = 17
    否则如果(ASKII == 79)
        USBHID = 18
    否则如果(ASKII == 80)
        USBHID = 19
    否则如果(ASKII == 81)
        USBHID = 20
    否则如果(ASKII == 82)
        USBHID = 21
    否则如果(ASKII == 83)
        USBHID = 22
    否则如果(ASKII == 84)
        USBHID = 23
    否则如果(ASKII == 85)
        USBHID = 24
    否则如果(ASKII == 86)
        USBHID = 25
    否则如果(ASKII == 87)
        USBHID = 26
    否则如果(ASKII == 88)
        USBHID = 27
    否则如果(ASKII == 89)
        USBHID = 28
    否则如果(ASKII == 90)
        USBHID = 29
    否则如果(ASKII == 48)
        USBHID = 48
    否则如果(ASKII == 49)
        USBHID = 30
    否则如果(ASKII == 50)
        USBHID = 31
    否则如果(ASKII == 51)
        USBHID = 32
    否则如果(ASKII == 52)
        USBHID = 33
    否则如果(ASKII == 53)
        USBHID = 34
    否则如果(ASKII == 54)
        USBHID = 35
    否则如果(ASKII == 55)
        USBHID = 36
    否则如果(ASKII == 56)
        USBHID = 37
    否则如果(ASKII == 57)
        USBHID = 38
    结束
    盒子KeyUp源码(USBHID)  
结束
功能 盒子鼠标归零()
    变量 aa = 动态库调用(编辑框获取文本("编辑框0"), "int", "M_ResetMousePos", "int", 盒子句柄1)
    调试输出("鼠标归零|" & aa)
结束
功能 盒子Moveto(盒子x, 盒子y)
    动态库调用(编辑框获取文本("编辑框0"), "int", "M_MoveTo", "int", 盒子句柄1, "int", 盒子x, "int", 盒子y)
结束
功能 盒子左键按下()
    动态库调用(编辑框获取文本("编辑框0"), "int", "M_LeftDown", "int", 盒子句柄1)
结束
功能 盒子左键弹起()
    动态库调用(编辑框获取文本("编辑框0"), "int", "M_LeftUp", "int", 盒子句柄1)
结束
功能 盒子右键按下()
    动态库调用(编辑框获取文本("编辑框0"), "int", "M_RightDown", "int", 盒子句柄1)
结束
功能 盒子右键弹起()
    动态库调用(编辑框获取文本("编辑框0"), "int", "M_RightUp", "int", 盒子句柄1)
结束
功能 编辑框0_内容改变()
    文件写配置("盒子", "盒子地址", 编辑框获取文本("编辑框0"), "C:\\Users\\Administrator\\Desktop\\1.ini")
结束
功能 编辑框1_内容改变()
    文件写配置("盒子", "盒子编号", 编辑框获取文本("编辑框1"), "C:\\Users\\Administrator\\Desktop\\1.ini")
结束


功能 Vid_内容改变()
    var aa=编辑框获取文本("Vid")
    调试输出("写配置"&aa)
    文件写配置("盒子", "Vid", aa, "C:\\Users\\Administrator\\Desktop\\1.ini")
    
结束


功能 Pid_内容改变()
    var aa=编辑框获取文本("Pid")
    
    调试输出("写配置"&aa)
    文件写配置("盒子", "Pid", aa, "C:\\Users\\Administrator\\Desktop\\1.ini")
    
结束
