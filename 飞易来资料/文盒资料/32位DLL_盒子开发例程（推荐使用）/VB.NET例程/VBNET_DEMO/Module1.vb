Module Module1
    '---------------------通用接口---------------------------------------------------
    '打开端口获取句柄，程序启动后只需打开一次端口就可以
    Declare Function M_Open Lib "msdk.dll" (ByVal PortName As Integer) As Integer
    '打开指定vid pid的单头盒子或者双头盒子的主控端。必须保证电脑上只插有一个这种盒子。
    Declare Function M_Open_VidPid Lib "msdk.dll" (ByVal Vid As Integer, ByVal Pid As Integer) As Integer
    '关闭端口；在程序退出前再关闭端口
    Declare Function M_Close Lib "msdk.dll" (ByVal m_hdl As Integer) As Integer
    '获取设备序列号
    Declare Function M_GetDevSn Lib "msdk.dll" (ByVal m_hdl As Integer, ByRef dwp_LenResponse As Integer, ByRef ucp_Response As Byte) As Integer
    '写入用户数据
    Declare Function M_SetUserData Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal dw_LenUserData As Integer, ByRef ucp_UserData As Byte) As Integer
    '验证用户数据
    Declare Function M_VerifyUserData Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal dw_LenUserData As Integer, ByRef ucp_UserData As Byte) As Integer
    '通用发送命令
    Declare Function M_Comm Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal dw_LenCommand As Integer, ByRef ucp_Command As Byte, ByRef dwp_LenResponse As Integer, ByRef ucp_Response As Byte, ByVal dw_TimeOut As Integer) As Integer
    '延时指定时间
    Declare Function M_Delay Lib "msdk.dll" (ByVal time As Integer) As Integer
    '在指定的最小最大值之间延时随机时间
    Declare Function M_DelayRandom Lib "msdk.dll" (ByVal Min_time As Integer, ByVal Max_time As Integer) As Integer
    '在指定的最小最大值之间延时随机时间
    Declare Function M_RandDomNbr Lib "msdk.dll" (ByVal Min_V As Integer, ByVal Max_V As Integer) As Integer
	'DLL内部参数恢复默认值
	Declare Function M_InitParam Lib "msdk.dll" (ByVal m_hdl As Integer) As Long
	'设置DLL内部参数
	Declare Function M_SetParam Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal ParamType As Integer, ByVal Param1 As Integer, ByVal Param2 As Integer) As Integer
    '---------------------键盘操作接口---------------------------------------------------
    '单击(按下后立刻弹起)指定按键
    Declare Function M_KeyPress Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal HidKeyCode As Integer, ByVal Nbr As Integer) As Integer
    '按下指定按键不弹起，如果按下不弹起，可以和其他按键组成组合键
    Declare Function M_KeyDown Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal HidKeyCode As Integer) As Integer
    '弹起指定按键
    Declare Function M_KeyUp Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal HidKeyCode As Integer) As Integer
    '读取按键状态  返回 0: 弹起状态；1:按下状态；-1: 失败(端口未打开)
    Declare Function M_KeyState Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal HidKeyCode As Integer) As Integer

    '单击(按下后立刻弹起)指定按键
    Declare Function M_KeyPress2 Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal KeyCode As Integer, ByVal Nbr As Integer) As Integer
    '按下指定按键不弹起，如果按下不弹起，可以和其他按键组成组合键
    Declare Function M_KeyDown2 Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal KeyCode As Integer) As Integer
    '弹起指定按键
    Declare Function M_KeyUp2 Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal KeyCode As Integer) As Integer
    '读取按键状态  返回 0: 弹起状态；1:按下状态；-1: 失败(端口未打开)
    Declare Function M_KeyState2 Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal KeyCode As Integer) As Integer

    '弹起所有按键
    Declare Function M_ReleaseAllKey Lib "msdk.dll" (ByVal m_hdl As Integer) As Integer
    '读取小键盘NumLock灯的状态 //返回 0:灭；1:亮；-1: 失败
    Declare Function M_NumLockLedState Lib "msdk.dll" (ByVal m_hdl As Integer) As Integer
    '读取CapsLock灯的状态 //返回 0:灭；1:亮；-1: 失败
    Declare Function M_CapsLockLedState Lib "msdk.dll" (ByVal m_hdl As Integer) As Integer
    '读取ScrollLock灯的状态 //返回 0:灭；1:亮；-1: 失败
    Declare Function M_ScrollLockLedState Lib "msdk.dll" (ByVal m_hdl As Integer) As Integer
    '输入一串ASCII字符串，如"ABCdef012,.<>"，在InputLen个字节内将忽略非ASCII字符，  //InputStr: 输入缓冲区首地址; 注意：不支持解析\n\r等转义字符！ InputLen:输出的长度
    Declare Function M_KeyInputString Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal InputStr As String, ByVal InputLen As Integer) As Integer
	'输入一串字符串，支持中文(GBK编码)英文混合，如"啊啊啊ABCdef012,.<>"，在InputLen个字节内将忽略非ASCII和中文字符，  //InputStr: 输入缓冲区首地址; 注意：不支持解析\n\r等转义字符！ InputLen:输出的长度
    Declare Function M_KeyInputStringGBK Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal InputStr As String, ByVal InputLen As Integer) As Integer
	'输入一串字符串，支持中文(Unicode编码)英文混合，如"啊啊啊ABCdef012,.<>"，在InputLen个字节内将忽略非ASCII和中文字符，  //InputStr: 输入缓冲区首地址; 注意：不支持解析\n\r等转义字符！ InputLen:输出的长度
    Declare Function M_KeyInputStringUnicode Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal InputStr As String, ByVal InputLen As Integer) As Integer
    '---------------------鼠标操作接口---------------------------------------------------
    '左键单击   'Nbr: 左键在当前位置单击次数
    Declare Function M_LeftClick Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal Nbr As Integer) As Integer
    '左键双击   'Nbr: 左键在当前位置双击次数
    Declare Function M_LeftDoubleClick Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal Nbr As Integer) As Integer
    '按下左键不弹起
    Declare Function M_LeftDown Lib "msdk.dll" (ByVal m_hdl As Integer) As Integer
    '弹起左键
    Declare Function M_LeftUp Lib "msdk.dll" (ByVal m_hdl As Integer) As Integer
    '右键单击   'Nbr: 左键在当前位置单击次数
    Declare Function M_RightClick Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal Nbr As Integer) As Integer
    '按下右键不弹起
    Declare Function M_RightDown Lib "msdk.dll" (ByVal m_hdl As Integer) As Integer
    '弹起右键
    Declare Function M_RightUp Lib "msdk.dll" (ByVal m_hdl As Integer) As Integer
    '中键单击   'Nbr: 左键在当前位置单击次数
    Declare Function M_MiddleClick Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal Nbr As Integer) As Integer
    '按下中键不弹起
    Declare Function M_MiddleDown Lib "msdk.dll" (ByVal m_hdl As Integer) As Integer
    '弹起中键
    Declare Function M_MiddleUp Lib "msdk.dll" (ByVal m_hdl As Integer) As Integer
    '释放所有鼠标的按键
    Declare Function M_ReleaseAllMouse Lib "msdk.dll" (ByVal m_hdl As Integer) As Integer
    '读取鼠标左中右键状态   //MouseKeyCode: 1=左键 2=右键 3=中键  //返回 0: 弹起状态；1:按下状态；-1: 失败
    '只能读取盒子中鼠标的状态，读取不到实体鼠标的状态
    Declare Function M_MouseKeyState Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal MouseKeyCode As Integer) As Integer

    '滚动鼠标滚轮;  Nbr: 滚动量,  为正,向上滚动；为负, 向下滚动;
    Declare Function M_MouseWheel Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal Nbr As Integer) As Integer
    '将鼠标移动到原点(0,0)  在出现移动出现异常时，可以用该函数将鼠标复位
    Declare Function M_ResetMousePos Lib "msdk.dll" (ByVal m_hdl As Integer) As Integer
    '从当前位置移动鼠标    x: x方向（横轴）的距离（正:向右; 负值:向左）; y: y方向（纵轴）的距离（正:向下; 负值:向上）
    Declare Function M_MoveR Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal x As Integer, ByVal y As Integer) As Integer
    '移动鼠标到指定坐标    x: x方向（横轴）的坐标; y: y方向（纵轴）的坐标。坐标原点(0, 0)在屏幕左上角
    Declare Function M_MoveTo Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal x As Integer, ByVal y As Integer) As Integer
    '读取当前鼠标所在坐标  返回坐标在x、y中。 注意：该函数必须在执行一次MoveTo函数后才能正确执行！
    Declare Function M_GetCurrMousePos Lib "msdk.dll" (ByVal m_hdl As Integer, ByRef x As Integer, ByRef y As Integer) As Integer

    ''以下接口仅适用主控机和被控机是同一台电脑的使用方式(单头模块；双头模块的两个USB头都连接到同一台电脑)
    ''以下接口将调用系统的API来获取当前鼠标位置，DLL将不记录鼠标移动的位置
    '从当前位置移动鼠标    x: x方向（横轴）的距离（正:向右; 负值:向左）; y: y方向（纵轴）的距离（正:向下; 负值:向上）
    Declare Function M_MoveR2 Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal x As Integer, ByVal y As Integer) As Integer
    '移动鼠标到指定坐标    x: x方向（横轴）的坐标; y: y方向（纵轴）的坐标。坐标原点(0, 0)在屏幕左上角
    Declare Function M_MoveTo2 Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal x As Integer, ByVal y As Integer) As Integer
    '读取当前鼠标所在坐标  返回坐标在x、y中。
    Declare Function M_GetCurrMousePos2 Lib "msdk.dll" (ByRef x As Integer, ByRef y As Integer) As Integer

    '以下接口将使用绝对移动功能。该功能目前还不能支持安卓
    '在使用绝对移动功能前，必须先输入被控机的屏幕分辨率
    'x: x方向（横轴）的坐标; y: y方向（纵轴）的坐标。坐标原点(0, 0)在屏幕左上角
    '返回值如果是-10，表示该盒子不支持绝对移动功能。返回0表示执行正确。可以用该接口判断盒子是否支持绝对移动功能
    Declare Function M_ResolutionUsed Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal x As Integer, ByVal y As Integer) As Integer
    '将鼠标移动到指定坐标。绝对移动功能，鼠标移动到指定位置时，在某些坐标上最大会有±2的误差
    '使用该接口后，可以调用M_GetCurrMousePos读取鼠标位置
    Declare Function M_MoveTo3 Lib "msdk.dll" (ByVal m_hdl As Integer, ByVal x As Integer, ByVal y As Integer) As Integer
    '-------------------------------------------------------------------------------------
    Public M_Handle As Integer       '用于保存，打开端口

    Public Const Keyboard_a = 4                 ' Keyboard a and A
    Public Const Keyboard_b = 5                 ' Keyboard b and B
    Public Const Keyboard_c = 6                 ' Keyboard c and C
    Public Const Keyboard_d = 7                 ' Keyboard d and D
    Public Const Keyboard_e = 8                 ' Keyboard e and E
    Public Const Keyboard_f = 9                 ' Keyboard f and F
    Public Const Keyboard_g = 10                ' Keyboard g and G
    Public Const Keyboard_h = 11                ' Keyboard h and H
    Public Const Keyboard_i = 12                ' Keyboard i and I
    Public Const Keyboard_j = 13                ' Keyboard j and J
    Public Const Keyboard_k = 14                ' Keyboard k and K
    Public Const Keyboard_l = 15                ' Keyboard l and L
    Public Const Keyboard_m = 16                ' Keyboard m and M
    Public Const Keyboard_n = 17                ' Keyboard n and N
    Public Const Keyboard_o = 18                ' Keyboard o and O
    Public Const Keyboard_p = 19                ' Keyboard p and P
    Public Const Keyboard_q = 20                ' Keyboard q and Q
    Public Const Keyboard_r = 21                ' Keyboard r and R
    Public Const Keyboard_s = 22                ' Keyboard s and S
    Public Const Keyboard_t = 23                ' Keyboard t and T
    Public Const Keyboard_u = 24                ' Keyboard u and U
    Public Const Keyboard_v = 25                ' Keyboard v and V
    Public Const Keyboard_w = 26                ' Keyboard w and W
    Public Const Keyboard_x = 27                ' Keyboard x and X
    Public Const Keyboard_y = 28                ' Keyboard y and Y
    Public Const Keyboard_z = 29                ' Keyboard z and Z
    Public Const Keyboard_1 = 30                ' Keyboard 1 and !
    Public Const Keyboard_2 = 31                ' Keyboard 2 and @
    Public Const Keyboard_3 = 32                ' Keyboard 3 and #
    Public Const Keyboard_4 = 33                ' Keyboard 4 and $
    Public Const Keyboard_5 = 34                ' Keyboard 5 and %
    Public Const Keyboard_6 = 35                ' Keyboard 6 and ^
    Public Const Keyboard_7 = 36                ' Keyboard 7 and &
    Public Const Keyboard_8 = 37                ' Keyboard 8 and *
    Public Const Keyboard_9 = 38                ' Keyboard 9 and (
    Public Const Keyboard_0 = 39                ' Keyboard 0 and )
    Public Const Keyboard_ENTER = 40            ' Keyboard ENTER
    Public Const Keyboard_ESCAPE = 41           ' Keyboard ESCAPE
    Public Const Keyboard_Backspace = 42        ' Keyboard Backspace
    Public Const Keyboard_Tab = 43              ' Keyboard Tab
    Public Const Keyboard_KongGe = 44           ' Keyboard Spacebar
    Public Const Keyboard_JianHao = 45          ' Keyboard - and _(underscore)
    Public Const Keyboard_DengHao = 46          ' Keyboard = and +
    Public Const Keyboard_ZuoZhongKuoHao = 47   ' Keyboard [ and {
    Public Const Keyboard_YouZhongKuoHao = 48   ' Keyboard ] and }
    Public Const Keyboard_FanXieGang = 49       ' Keyboard \ and |
    Public Const Keyboard_FenHao = 51           ' Keyboard ; and :
    Public Const Keyboard_DanYinHao = 52        ' Keyboard ' and "
    Public Const Keyboard_BoLangXian = 53       ' Keyboard `(Grave Accent) and ~(Tilde)
    Public Const Keyboard_Douhao = 54           ' Keyboard , and <
    Public Const Keyboard_JuHao = 55            ' Keyboard . and >
    Public Const Keyboard_XieGang_WenHao = 56   ' Keyboard / and ?
    Public Const Keyboard_CapsLock = 57         ' Keyboard Caps Lock
    Public Const Keyboard_F1 = 58               ' Keyboard F1
    Public Const Keyboard_F2 = 59               ' Keyboard F2
    Public Const Keyboard_F3 = 60               ' Keyboard F3
    Public Const Keyboard_F4 = 61               ' Keyboard F4
    Public Const Keyboard_F5 = 62               ' Keyboard F5
    Public Const Keyboard_F6 = 63               ' Keyboard F6
    Public Const Keyboard_F7 = 64               ' Keyboard F7
    Public Const Keyboard_F8 = 65               ' Keyboard F8
    Public Const Keyboard_F9 = 66               ' Keyboard F9
    Public Const Keyboard_F10 = 67              ' Keyboard F10
    Public Const Keyboard_F11 = 68              ' Keyboard F11
    Public Const Keyboard_F12 = 69              ' Keyboard F12
    Public Const Keyboard_PrintScreen = 70      ' Keyboard PrintScreen
    Public Const Keyboard_ScrollLock = 71       ' Keyboard Scroll Lock
    Public Const Keyboard_Pause = 72            ' Keyboard Pause
    Public Const Keyboard_Insert = 73           ' Keyboard Insert
    Public Const Keyboard_Home = 74             ' Keyboard Home
    Public Const Keyboard_PageUp = 75           ' Keyboard PageUp
    Public Const Keyboard_Delete = 76           ' Keyboard Delete
    Public Const Keyboard_End = 77              ' Keyboard End
    Public Const Keyboard_PageDown = 78         ' Keyboard PageDown
    Public Const Keyboard_RightArrow = 79       ' Keyboard RightArrow
    Public Const Keyboard_LeftArrow = 80        ' Keyboard LeftArrow
    Public Const Keyboard_DownArrow = 81        ' Keyboard DownArrow
    Public Const Keyboard_UpArrow = 82          ' Keyboard UpArrow
    Public Const Keypad_NumLock = 83            ' Keypad Num Lock and Clear
    Public Const Keypad_ChuHao = 84             ' Keypad /
    Public Const Keypad_ChengHao = 85           ' Keypad *
    Public Const Keypad_JianHao = 86            ' Keypad -
    Public Const Keypad_JiaHao = 87             ' Keypad +
    Public Const Keypad_ENTER = 88              ' Keypad ENTER
    Public Const Keypad_1_and_End = 89          ' Keypad 1 and End
    Public Const Keypad_2_and_DownArrow = 90    ' Keypad 2 and Down Arrow
    Public Const Keypad_3_and_PageDn = 91       ' Keypad 3 and PageDn
    Public Const Keypad_4_and_LeftArrow = 92    ' Keypad 4 and Left Arrow
    Public Const Keypad_5 = 93                  ' Keypad 5
    Public Const Keypad_6_and_RightArrow = 94   ' Keypad 6 and Right Arrow
    Public Const Keypad_7_and_Home = 95         ' Keypad 7 and Home
    Public Const Keypad_8_and_UpArrow = 96      ' Keypad 8 and Up Arrow
    Public Const Keypad_9_and_PageUp = 97       ' Keypad 9 and PageUp
    Public Const Keypad_0_and_Insert = 98       ' Keypad 0 and Insert
    Public Const Keypad_Dian_and_Delete = 99    ' Keypad . and Delete
    Public Const Keyboard_Application = 101     ' Keyboard Application(Menu)
    Public Const Keyboard_LeftControl = 224
    Public Const Keyboard_LeftShift = 225
    Public Const Keyboard_LeftAlt = 226
    Public Const Keyboard_LeftWindows = 227
    Public Const Keyboard_RightControl = 228
    Public Const Keyboard_RightShift = 229
    Public Const Keyboard_RightAlt = 230
    Public Const Keyboard_RightWindows = 231

End Module
