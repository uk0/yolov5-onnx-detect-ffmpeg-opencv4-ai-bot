[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=f27468e0-3184-4b98-abee-49016b752fe4
Description=使用端口1的例程
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
//!!!!!!!!!请从第312行开始编写您的程序，312行以前的代码是接口定义和按键值定义!!!!!!!
//注意：由于按键精灵不支持ByRef，无法调用msdk中的M_GetCurrMousePos/M_GetCurrMousePos2接口。请使用M_GetCurrMousePosX/M_GetCurrMousePosY接口
'■■■■■■■■■■■■■■■■■■■■↓通用接口↓■■■■■■■■■■■■■■■■■■■■
//打开端口获取句柄，程序启动后只需打开一次端口就可以
Declare Function M_Open Lib "msdk.dll" (ByVal portname As Long) As Long
//打开指定vid pid的单头盒子或者双头盒子的主控端。必须保证电脑上只插有一个这种盒子。
Declare Function M_Open_VidPid Lib "msdk.dll" (ByVal Vid As Long, ByVal Pid As Long) As Long
//关闭端口；在程序退出前再关闭端口
Declare Function M_Close Lib "msdk.dll" (ByVal m_hdl As Long) As Long
//获取设备序列号
Declare Function M_GetDevSn Lib "msdk.dll" (ByVal m_hdl As Long, ByRef dwp_LenResponse As Long, ByRef ucp_Response As Byte) As Long
//写用户数据
Declare Function M_SetUserData Lib "msdk.dll" (ByVal m_hdl As Long, ByVal dw_LenUserData As Long, ByVal ucp_UserData As String) As Long
//验证用户数据
Declare Function M_VerifyUserData Lib "msdk.dll" (ByVal m_hdl As Long, ByVal dw_LenUserData As Long, ByVal ucp_UserData As String) As Long
//检查盒子是否是可修改盒子; 返回: 0:是可修改； 其他:不可修改
Declare Function M_ChkSupportMdy Lib "msdk.dll" (ByVal m_hdl As Long) As Long
//设置新VID/PID
Declare Function M_SetNewVidPid Lib "msdk.dll" (ByVal m_hdl As Long, ByVal mVid As Long, ByVal mPid As Long, ByVal sVid As Long, ByVal sPid As Long) As Long
//复位VID/PID
Declare Function M_ResetVidPid Lib "msdk.dll" (ByVal m_hdl As Long) As Long
//DLL内部参数恢复默认值
Declare Function M_InitParam Lib "msdk.dll" (ByVal m_hdl As Long) As Long
//设置DLL内部参数
Declare Function M_SetParam Lib "msdk.dll" (ByVal m_hdl As Long, ByVal ParamType As Long, ByVal Param1 As Long, ByVal Param2 As Long) As Long
//延时指定时间
Declare Function M_Delay Lib "msdk.dll" (ByVal time As Long) As Long
//在指定的最小最大值之间延时随机时间
Declare Function M_DelayRandom Lib "msdk.dll" (ByVal Min_time As Long, ByVal Max_time As Long) As Long
//在指定的最小最大值之间延时随机时间
Declare Function M_RandDomNbr Lib "msdk.dll" (ByVal Min_V As Long, ByVal Max_V As Long) As Long
'■■■■■■■■■■■■■■■■■■■■↑通用接口↑■■■■■■■■■■■■■■■■■■■■
'■■■■■■■■■■■■■■■■■■■■↓键盘接口↓■■■■■■■■■■■■■■■■■■■■
//单击(按下后立刻弹起)指定按键
Declare Function M_KeyPress Lib "msdk.dll" (ByVal m_hdl As Long, ByVal KeyCode As integer, ByVal Nbr As integer) As Long
//按下指定按键不弹起，如果按下不弹起，可以和其他按键组成组合键
Declare Function M_KeyDown Lib "msdk.dll" (ByVal m_hdl As Long, ByVal KeyCode As Long) As Long
//弹起指定按键
Declare Function M_KeyUp Lib "msdk.dll" (ByVal m_hdl As Long, ByVal KeyCode As Long) As Long
//单击(按下后立刻弹起)指定按键
//读取按键状态  返回 0: 弹起状态；1:按下状态；-1: 失败(端口未打开)
Declare Function M_KeyState Lib "msdk.dll" (ByVal m_hdl As Long, ByVal KeyCode As Long) As Long
//单击(按下后立刻弹起)指定按键
Declare Function M_KeyPress2 Lib "msdk.dll" (ByVal m_hdl As Long, ByVal KeyCode As integer, ByVal Nbr As integer) As Long
//按下指定按键不弹起，如果按下不弹起，可以和其他按键组成组合键
Declare Function M_KeyDown2 Lib "msdk.dll" (ByVal m_hdl As Long, ByVal KeyCode As Long) As Long
//弹起指定按键
Declare Function M_KeyUp2 Lib "msdk.dll" (ByVal m_hdl As Long, ByVal KeyCode As Long) As Long
//读取按键状态  返回 0: 弹起状态；1:按下状态；-1: 失败(端口未打开)
Declare Function M_KeyState2 Lib "msdk.dll" (ByVal m_hdl As Long, ByVal KeyCode As Long) As Long
//弹起所有按键
Declare Function M_ReleaseAllKey Lib "msdk.dll" (ByVal m_hdl As Long) As Long
//读取小键盘NumLock灯的状态 //返回 0:灭；1:亮；-1: 失败
Declare Function M_NumLockLedState Lib "msdk.dll" (ByVal m_hdl As Long) As Long
'读取CapsLock灯的状态 //返回 0:灭；1:亮；-1: 失败
Declare Function M_CapsLockLedState Lib "msdk.dll" (ByVal m_hdl As Long) As Long
'读取ScrollLock灯的状态 //返回 0:灭；1:亮；-1: 失败
Declare Function M_ScrollLockLedState Lib "msdk.dll" (ByVal m_hdl As Long) As Long
'输入一串ASCII字符串，如"ABCdef012,.<>"，在InputLen个字节内将忽略非ASCII字符，  //InputStr: 输入缓冲区首地址; 注意：不支持解析\n\r等转义字符！ InputLen:输出的长度
Declare Function M_KeyInputString Lib "msdk.dll" (ByVal m_hdl As Long, ByVal InputStr As String, ByVal InputLen As Long) As Long
'输入一串字符串，支持中文(GBK编码)英文混合，如"啊啊啊ABCdef012,.<>"，在InputLen个字节内将忽略非ASCII和中文字符，  //InputStr: 输入缓冲区首地址; 注意：不支持解析\n\r等转义字符！ InputLen:输出的长度
Declare Function M_KeyInputStringGBK Lib "msdk.dll" (ByVal m_hdl As Long, ByVal InputStr As String, ByVal InputLen As Long) As Long
'输入一串字符串，支持中文(Unicode编码)英文混合，如"啊啊啊ABCdef012,.<>"，在InputLen个字节内将忽略非ASCII和中文字符，  //InputStr: 输入缓冲区首地址; 注意：不支持解析\n\r等转义字符！ InputLen:输出的长度
Declare Function M_KeyInputStringUnicode Lib "msdk.dll" (ByVal m_hdl As Long, ByVal InputStr As String, ByVal InputLen As Long) As Long
'■■■■■■■■■■■■■■■■■■■■↑键盘接口↑■■■■■■■■■■■■■■■■■■■■
'■■■■■■■■■■■■■■■■■■■■↓鼠标接口↓■■■■■■■■■■■■■■■■■■■■
//左键单击   //Nbr: 左键在当前位置单击次数
Declare Function M_LeftClick Lib "msdk.dll" (ByVal m_hdl As Long, ByVal Nbr As Long) As Long
//左键双击   //Nbr: 左键在当前位置双击次数
Declare Function M_LeftDoubleClick Lib "msdk.dll" (ByVal m_hdl As Long, ByVal Nbr As Long) As Long
//按下左键不弹起
Declare Function M_LeftDown Lib "msdk.dll" (ByVal m_hdl As Long) As Long
//弹起左键
Declare Function M_LeftUp Lib "msdk.dll" (ByVal m_hdl As Long) As Long
//右键单击   //Nbr: 左键在当前位置单击次数
Declare Function M_RightClick Lib "msdk.dll" (ByVal m_hdl As Long, ByVal Nbr As Long) As Long
//按下右键不弹起
Declare Function M_RightDown Lib "msdk.dll" (ByVal m_hdl As Long) As Long
//弹起右键
Declare Function M_RightUp Lib "msdk.dll" (ByVal m_hdl As Long) As Long
//中键单击   //Nbr: 左键在当前位置单击次数
Declare Function M_MiddleClick Lib "msdk.dll" (ByVal m_hdl As Long, ByVal Nbr As Long) As Long
//按下中键不弹起
Declare Function M_MiddleDown Lib "msdk.dll" (ByVal m_hdl As Long) As Long
//弹起中键
Declare Function M_MiddleUp Lib "msdk.dll" (ByVal m_hdl As Long) As Long
//滚动鼠标滚轮;  Nbr: 滚动量,  为正,向上滚动；为负, 向下滚动;
Declare Function M_MouseWheel Lib "msdk.dll" (ByVal m_hdl As Long, ByVal Nbr As Long) As Long
//将鼠标移动到原点(0,0)  在出现移动出现异常时，可以用该函数将鼠标复位
Declare Function M_ResetMousePos Lib "msdk.dll" (ByVal m_hdl As Long) As Long
//从当前位置移动鼠标    x: x方向（横轴）的距离（正:向右; 负值:向左）; y: y方向（纵轴）的距离（正:向下; 负值:向上）
Declare Function M_MoveR Lib "msdk.dll" (ByVal m_hdl As Long, ByVal x As Long, ByVal y As Long) As Long
//移动鼠标到指定坐标    x: x方向（横轴）的坐标; y: y方向（纵轴）的坐标。坐标原点(0, 0)在屏幕左上角
Declare Function M_MoveTo Lib "msdk.dll" (ByVal m_hdl As Long, ByVal x As Long, ByVal y As Long) As Long
//读取当前鼠标所在坐标  返回坐标在x、y中。 注意：该函数必须在执行一次MoveTo函数后才能正确执行！
Declare Function M_GetCurrMousePos Lib "msdk.dll" (ByVal m_hdl As Long, ByRef x As Long, ByRef y As Long) As Long
Declare Function M_GetCurrMousePosX Lib "msdk.dll" (ByVal m_hdl As Long) As Long
Declare Function M_GetCurrMousePosY Lib "msdk.dll" (ByVal m_hdl As Long) As Long
//释放所有鼠标的按键
Declare Function M_ReleaseAllMouse Lib "msdk.dll" (ByVal m_hdl As Long) As Long
//读取鼠标左中右键状态   //MouseKeyCode: 1=左键 2=右键 3=中键  //返回 0: 弹起状态；1:按下状态；-1: 失败
//只能读取盒子中鼠标的状态，读取不到实体鼠标的状态
Declare Function M_MouseKeyState Lib "msdk.dll" (ByVal m_hdl As Long, ByVal MouseKeyCode As Long) As Long
////以下接口仅适用主控机和被控机是同一台电脑的使用方式(单头模块；双头模块的两个USB头都连接到同一台电脑)
////以下接口将调用系统的API来获取当前鼠标位置，DLL将不记录鼠标移动的位置
//从当前位置移动鼠标    x: x方向（横轴）的距离（正:向右; 负值:向左）; y: y方向（纵轴）的距离（正:向下; 负值:向上）
Declare Function M_MoveR2 Lib "msdk.dll" (ByVal m_hdl As Long, ByVal x As Long, ByVal y As Long) As Long
//移动鼠标到指定坐标    x: x方向（横轴）的坐标; y: y方向（纵轴）的坐标。坐标原点(0, 0)在屏幕左上角
Declare Function M_MoveTo2 Lib "msdk.dll" (ByVal m_hdl As Long, ByVal x As Long, ByVal y As Long) As Long
//读取当前鼠标所在坐标  返回坐标在x、y中。
Declare Function M_GetCurrMousePos2 Lib "msdk.dll" (ByRef x As Long, ByRef y As Long) As Long
//以下接口将使用绝对移动功能。该功能目前还不能支持安卓
//在使用绝对移动功能前，必须先输入被控机的屏幕分辨率
//x: x方向（横轴）的坐标; y: y方向（纵轴）的坐标。坐标原点(0, 0)在屏幕左上角
Declare Function M_ResolutionUsed Lib "msdk.dll" (ByVal m_hdl As Long, ByVal x As Long, ByVal y As Long) As Long
//将鼠标移动到指定坐标。绝对移动功能，鼠标移动到指定位置时，在某些坐标上最大会有±2的误差
//使用该接口后，可以调用M_GetCurrMousePos读取鼠标位置
Declare Function M_MoveTo3 Lib "msdk.dll" (ByVal m_hdl As Long, ByVal x As Long, ByVal y As Long) As Long
Declare Function M_MoveTo3_D Lib "msdk.dll" (ByVal m_hdl As Long, ByVal x As Long, ByVal y As Long) As Long
'■■■■■■■■■■■■■■■■■■■■↑鼠标接口↑■■■■■■■■■■■■■■■■■■■■
'■■■■■■■■■■■■■■■■■■■■↓按键定义↓■■■■■■■■■■■■■■■■■■■■
Dimenv Keyboard_a              // Keyboard a and A
Keyboard_a = 4
Dimenv Keyboard_b              // Keyboard b and B
Keyboard_b = 5
Dimenv Keyboard_c              // Keyboard c and C
Keyboard_c = 6
Dimenv Keyboard_d              // Keyboard d and D
Keyboard_d = 7
Dimenv Keyboard_e              // Keyboard e and E
Keyboard_e = 8
Dimenv Keyboard_f              // Keyboard f and F
Keyboard_f = 9
Dimenv Keyboard_g              // Keyboard g and G
Keyboard_g = 10
Dimenv Keyboard_h              // Keyboard h and H
Keyboard_h = 11
Dimenv Keyboard_i              // Keyboard i and I
Keyboard_i = 12
Dimenv Keyboard_j              // Keyboard j and J
Keyboard_j = 13
Dimenv Keyboard_k              // Keyboard k and K
Keyboard_k = 14
Dimenv Keyboard_l              // Keyboard l and L
Keyboard_l = 15
Dimenv Keyboard_m              // Keyboard m and M
Keyboard_m = 16
Dimenv Keyboard_n              // Keyboard n and N
Keyboard_n = 17
Dimenv Keyboard_o              // Keyboard o and O
Keyboard_o = 18
Dimenv Keyboard_p              // Keyboard p and P
Keyboard_p = 19
Dimenv Keyboard_q              // Keyboard q and Q
Keyboard_q = 20
Dimenv Keyboard_r              // Keyboard r and R
Keyboard_r = 21
Dimenv Keyboard_s              // Keyboard s and S
Keyboard_s = 22
Dimenv Keyboard_t              // Keyboard t and T
Keyboard_t = 23
Dimenv Keyboard_u              // Keyboard u and U
Keyboard_u = 24
Dimenv Keyboard_v              // Keyboard v and V
Keyboard_v = 25
Dimenv Keyboard_w              // Keyboard w and W
Keyboard_w = 26
Dimenv Keyboard_x              // Keyboard x and X
Keyboard_x = 27
Dimenv Keyboard_y              // Keyboard y and Y
Keyboard_y = 28
Dimenv Keyboard_z              // Keyboard z and Z
Keyboard_z = 29
Dimenv Keyboard_1              // Keyboard 1 and !
Keyboard_1 = 30
Dimenv Keyboard_2              // Keyboard 2 and @
Keyboard_2 = 31
Dimenv Keyboard_3              // Keyboard 3 and #
Keyboard_3 = 32
Dimenv Keyboard_4              // Keyboard 4 and $
Keyboard_4 = 33
Dimenv Keyboard_5              // Keyboard 5 and %
Keyboard_5 = 34
Dimenv Keyboard_6              // Keyboard 6 and ^
Keyboard_6 = 35
Dimenv Keyboard_7              // Keyboard 7 and &
Keyboard_7 = 36
Dimenv Keyboard_8              // Keyboard 8 and *
Keyboard_8 = 37
Dimenv Keyboard_9              // Keyboard 9 and (
Keyboard_9 = 38
Dimenv Keyboard_0              // Keyboard 0 and )
Keyboard_0 = 39
Dimenv Keyboard_ENTER          // Keyboard ENTER
Keyboard_ENTER = 40
Dimenv Keyboard_ESCAPE         // Keyboard ESCAPE
Keyboard_ESCAPE = 41
Dimenv Keyboard_Backspace      // Keyboard Backspace
Keyboard_Backspace = 42
Dimenv Keyboard_Tab            // Keyboard Tab
Keyboard_Tab = 43
Dimenv Keyboard_KongGe         // Keyboard Spacebar
Keyboard_KongGe = 44
Dimenv Keyboard_JianHao        // Keyboard - and _(underscore)
Keyboard_JianHao = 45
Dimenv Keyboard_DengHao        // Keyboard = and +
Keyboard_DengHao = 46
Dimenv Keyboard_ZuoZhongKuoHao // Keyboard [ and {
Keyboard_ZuoZhongKuoHao = 47
Dimenv Keyboard_YouZhongKuoHao // Keyboard ] and }
Keyboard_YouZhongKuoHao = 48
Dimenv Keyboard_FanXieGang     // Keyboard \ and |
Keyboard_FanXieGang = 49
Dimenv Keyboard_FenHao         // Keyboard ; and :
Keyboard_FenHao = 51
Dimenv Keyboard_DanYinHao      // Keyboard ‘ and “
Keyboard_DanYinHao = 52
Dimenv Keyboard_BoLangXian     // Keyboard `(Grave Accent) and ~(Tilde)
Keyboard_BoLangXian = 53
Dimenv Keyboard_Douhao         // Keyboard, and <
Keyboard_Douhao = 54
Dimenv Keyboard_JuHao          // Keyboard . and >
Keyboard_JuHao = 55
Dimenv Keyboard_XieGang_WenHao // Keyboard / and ?
Keyboard_XieGang_WenHao = 56
Dimenv Keyboard_CapsLock       // Keyboard Caps Lock
Keyboard_CapsLock = 57
Dimenv Keyboard_F1             // Keyboard F1
Keyboard_F1 = 58
Dimenv Keyboard_F2             // Keyboard F2
Keyboard_F2 = 59
Dimenv Keyboard_F3             // Keyboard F3
Keyboard_F3 = 60
Dimenv Keyboard_F4             // Keyboard F4
Keyboard_F4 = 61
Dimenv Keyboard_F5             // Keyboard F5
Keyboard_F5 = 62
Dimenv Keyboard_F6             // Keyboard F6
Keyboard_F6 = 63
Dimenv Keyboard_F7             // Keyboard F7
Keyboard_F7 = 64
Dimenv Keyboard_F8             // Keyboard F8
Keyboard_F8 = 65
Dimenv Keyboard_F9             // Keyboard F9
Keyboard_F9 = 66
Dimenv Keyboard_F10            // Keyboard F10
Keyboard_F10 = 67
Dimenv Keyboard_F11            // Keyboard F11
Keyboard_F11 = 68
Dimenv Keyboard_F12            // Keyboard F12
Keyboard_F12 = 69
Dimenv Keyboard_PrintScreen    // Keyboard PrintScreen
Keyboard_PrintScreen = 70
Dimenv Keyboard_ScrollLock     // Keyboard Scroll Lock
Keyboard_ScrollLock = 71
Dimenv Keyboard_Pause          // Keyboard Pause
Keyboard_Pause = 72
Dimenv Keyboard_Insert         // Keyboard Insert
Keyboard_Insert = 73
Dimenv Keyboard_Home           // Keyboard Home
Keyboard_Home = 74
Dimenv Keyboard_PageUp         // Keyboard PageUp
Keyboard_PageUp = 75
Dimenv Keyboard_Delete         // Keyboard Delete Forward
Keyboard_Delete = 76
Dimenv Keyboard_End            // Keyboard End
Keyboard_End = 77
Dimenv Keyboard_PageDown       // Keyboard PageDown
Keyboard_PageDown = 78
Dimenv Keyboard_RightArrow     // Keyboard RightArrow
Keyboard_RightArrow = 79
Dimenv Keyboard_LeftArrow      // Keyboard LeftArrow
Keyboard_LeftArrow = 80
Dimenv Keyboard_DownArrow      // Keyboard DownArrow
Keyboard_DownArrow = 81
Dimenv Keyboard_UpArrow        // Keyboard UpArrow
Keyboard_UpArrow = 82
Dimenv Keypad_NumLock          // Keypad Num Lock and Clear
Keypad_NumLock = 83
Dimenv Keypad_ChuHao           // Keypad /
Keypad_ChuHao = 84
Dimenv Keypad_ChengHao         // Keypad *
Keypad_ChengHao = 85
Dimenv Keypad_JianHao          // Keypad -
Keypad_JianHao = 86
Dimenv Keypad_JiaHao           // Keypad +
Keypad_JiaHao = 87
Dimenv Keypad_ENTER            // Keypad ENTER
Keypad_ENTER = 88
Dimenv Keypad_1_and_End        // Keypad 1 and End
Keypad_1_and_End = 89
Dimenv Keypad_2_and_DownArrow  // Keypad 2 and Down Arrow
Keypad_2_and_DownArrow = 90
Dimenv Keypad_3_and_PageDn     // Keypad 3 and PageDn
Keypad_3_and_PageDn = 91
Dimenv Keypad_4_and_LeftArrow  // Keypad 4 and Left Arrow
Keypad_4_and_LeftArrow = 92
Dimenv Keypad_5                // Keypad 5
Keypad_5 = 93
Dimenv Keypad_6_and_RightArrow // Keypad 6 and Right Arrow
Keypad_6_and_RightArrow = 94
Dimenv Keypad_7_and_Home       // Keypad 7 and Home
Keypad_7_and_Home = 95
Dimenv Keypad_8_and_UpArrow    // Keypad 8 and Up Arrow
Keypad_8_and_UpArrow = 96
Dimenv Keypad_9_and_PageUp     // Keypad 9 and PageUp
Keypad_9_and_PageUp = 97
Dimenv Keypad_0_and_Insert     // Keypad 0 and Insert
Keypad_0_and_Insert = 98
Dimenv Keypad_Dian_and_Delete  // Keypad . and Delete
Keypad_Dian_and_Delete = 99
Dimenv Keyboard_LeftControl
Keyboard_LeftControl = 224
Dimenv Keyboard_LeftShift
Keyboard_LeftShift = 225
Dimenv Keyboard_LeftAlt
Keyboard_LeftAlt = 226
Dimenv Keyboard_LeftWindows
Keyboard_LeftWindows = 227
Dimenv Keyboard_RightControl
Keyboard_RightControl = 228
Dimenv Keyboard_RightShift
Keyboard_RightShift = 229
Dimenv Keyboard_RightAlt
Keyboard_RightAlt = 230
Dimenv Keyboard_RightWindows
Keyboard_RightWindows = 231
'■■■■■■■■■■■■■■■■■■■■↑按键定义↑■■■■■■■■■■■■■■■■■■■■

//M_Handle是打开端口得到的句柄，句柄名称可以随意命名
Global M_Handle
M_Handle = - 1 

M_Handle = M_Open(1)
If M_Handle < 0 Then
	MsgBox "端口1打开失败，请检查电脑是否已经插入1个盒子!"
	EndScript
End If

RetCode = M_ChkSupportMdy(M_Handle)
if RetCode <> 0 Then
	MsgBox "盒子不支持设置新VidPid"
	goto err
endif
RetCode = M_SetNewVidPid(M_Handle, 49943, 1, 0, 0)  //49943是十六进制的0xC317; 这里修改双头的主控端VID; 被控端不修改； 如果是单头盒子，将报错
if RetCode <> 0 Then
	MsgBox "设置失败"
	Goto err
Else 
	MsgBox "设置成功"
endif

rem err
//脚本退出前，一定要关闭端口
CALL M_Close(M_Handle)
