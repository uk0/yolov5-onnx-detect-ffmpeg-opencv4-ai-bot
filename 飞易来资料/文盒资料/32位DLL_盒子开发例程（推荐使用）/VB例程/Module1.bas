Attribute VB_Name = "Module1"
Option Explicit

'---------------------ͨ�ýӿ�---------------------------------------------------
'�򿪶˿ڻ�ȡ���������������ֻ���һ�ζ˿ھͿ���
 Declare Function M_Open Lib "msdk.dll" (ByVal PortName As Long) As Long
'��ָ��vid pid�ĵ�ͷ���ӻ���˫ͷ���ӵ����ضˡ����뱣֤������ֻ����һ�����ֺ��ӡ�
 Declare Function M_Open_VidPid Lib "msdk.dll" (ByVal Vid As Long, ByVal Pid As Long) As Long
'�رն˿ڣ��ڳ����˳�ǰ�ٹرն˿�
 Declare Function M_Close Lib "msdk.dll" (ByVal m_hdl As Long) As Long
'��ȡ�豸���к�
 Declare Function M_GetDevSn Lib "msdk.dll" (ByVal m_hdl As Long, ByRef dwp_LenResponse As Long, ByRef ucp_Response As Byte) As Long
'д���û�����
 Declare Function M_SetUserData Lib "msdk.dll" (ByVal m_hdl As Long, ByVal dw_LenUserData As Long, ByRef ucp_UserData As Byte) As Long
'��֤�û�����
 Declare Function M_VerifyUserData Lib "msdk.dll" (ByVal m_hdl As Long, ByVal dw_LenUserData As Long, ByRef ucp_UserData As Byte) As Long
'�������Ƿ��ǿ��޸ĺ���; ����: 0:�ǿ��޸ģ� ����:�����޸�
 Declare Function M_ChkSupportMdy Lib "msdk.dll" (ByVal m_hdl As Long) As Long
'������VID/PID
 Declare Function M_SetNewVidPid Lib "msdk.dll" (ByVal m_hdl As Long, ByVal mVid As Long, ByVal mPid As Long, ByVal sVid As Long, ByVal sPid As Long) As Long
'��λVID/PID
 Declare Function M_ResetVidPid Lib "msdk.dll" (ByVal m_hdl As Long) As Long
'��ʱָ��ʱ��
 Declare Function M_Delay Lib "msdk.dll" (ByVal time As Long) As Long
'��ָ������С���ֵ֮����ʱ���ʱ��
 Declare Function M_DelayRandom Lib "msdk.dll" (ByVal Min_time As Long, ByVal Max_time As Long) As Long
'��ָ������С���ֵ֮����ʱ���ʱ��
 Declare Function M_RandDomNbr Lib "msdk.dll" (ByVal Min_V As Long, ByVal Max_V As Long) As Long
'DLL�ڲ������ָ�Ĭ��ֵ
 Declare Function M_InitParam Lib "msdk.dll" (ByVal m_hdl As Long) As Long
'����DLL�ڲ�����
 Declare Function M_SetParam Lib "msdk.dll" (ByVal m_hdl As Long, ByVal ParamType As Long, ByVal Param1 As Long, ByVal Param2 As Long) As Long
'---------------------���̲����ӿ�---------------------------------------------------
'����(���º����̵���)ָ������
Declare Function M_KeyPress Lib "msdk.dll" (ByVal m_hdl As Long, ByVal HidKeyCode As Long, ByVal Nbr As Long) As Long
'����ָ������������������²����𣬿��Ժ��������������ϼ�
Declare Function M_KeyDown Lib "msdk.dll" (ByVal m_hdl As Long, ByVal HidKeyCode As Long) As Long
'����ָ������
Declare Function M_KeyUp Lib "msdk.dll" (ByVal m_hdl As Long, ByVal HidKeyCode As Long) As Long
'��ȡ����״̬  ���� 0: ����״̬��1:����״̬��-1: ʧ��(�˿�δ��)
Declare Function M_KeyState Lib "msdk.dll" (ByVal m_hdl As Long, ByVal HidKeyCode As Long) As Long

'����(���º����̵���)ָ������
Declare Function M_KeyPress2 Lib "msdk.dll" (ByVal m_hdl As Long, ByVal KeyCode As Long, ByVal Nbr As Long) As Long
'����ָ������������������²����𣬿��Ժ��������������ϼ�
Declare Function M_KeyDown2 Lib "msdk.dll" (ByVal m_hdl As Long, ByVal KeyCode As Long) As Long
'����ָ������
Declare Function M_KeyUp2 Lib "msdk.dll" (ByVal m_hdl As Long, ByVal KeyCode As Long) As Long
'��ȡ����״̬  ���� 0: ����״̬��1:����״̬��-1: ʧ��(�˿�δ��)
Declare Function M_KeyState2 Lib "msdk.dll" (ByVal m_hdl As Long, ByVal KeyCode As Long) As Long

'�������а���
Declare Function M_ReleaseAllKey Lib "msdk.dll" (ByVal m_hdl As Long) As Long
'��ȡС����NumLock�Ƶ�״̬ //���� 0:��1:����-1: ʧ��
Declare Function M_NumLockLedState Lib "msdk.dll" (ByVal m_hdl As Long) As Long
'��ȡCapsLock�Ƶ�״̬ //���� 0:��1:����-1: ʧ��
Declare Function M_CapsLockLedState Lib "msdk.dll" (ByVal m_hdl As Long) As Long
'��ȡScrollLock�Ƶ�״̬ //���� 0:��1:����-1: ʧ��
Declare Function M_ScrollLockLedState Lib "msdk.dll" (ByVal m_hdl As Long) As Long
'����һ��ASCII�ַ�������"ABCdef012,.<>"����InputLen���ֽ��ڽ����Է�ASCII�ַ���  //InputStr: ���뻺�����׵�ַ; ע�⣺��֧�ֽ���\n\r��ת���ַ��� InputLen:����ĳ���
Declare Function M_KeyInputString Lib "msdk.dll" (ByVal m_hdl As Long, ByVal InputStr As String, ByVal InputLen As Long) As Long
'����һ���ַ�����֧������(GBK����)Ӣ�Ļ�ϣ���"������ABCdef012,.<>"����InputLen���ֽ��ڽ����Է�ASCII�������ַ���  //InputStr: ���뻺�����׵�ַ; ע�⣺��֧�ֽ���\n\r��ת���ַ��� InputLen:����ĳ���
Declare Function M_KeyInputStringGBK Lib "msdk.dll" (ByVal m_hdl As Long, ByVal InputStr As String, ByVal InputLen As Long) As Long
'����һ���ַ�����֧������(Unicode����)Ӣ�Ļ�ϣ���"������ABCdef012,.<>"����InputLen���ֽ��ڽ����Է�ASCII�������ַ���  //InputStr: ���뻺�����׵�ַ; ע�⣺��֧�ֽ���\n\r��ת���ַ��� InputLen:����ĳ���
Declare Function M_KeyInputStringUnicode Lib "msdk.dll" (ByVal m_hdl As Long, ByVal InputStr As String, ByVal InputLen As Long) As Long
'---------------------�������ӿ�---------------------------------------------------
'�������   'Nbr: ����ڵ�ǰλ�õ�������
Declare Function M_LeftClick Lib "msdk.dll" (ByVal m_hdl As Long, ByVal Nbr As Long) As Long
'���˫��   'Nbr: ����ڵ�ǰλ��˫������
Declare Function M_LeftDoubleClick Lib "msdk.dll" (ByVal m_hdl As Long, ByVal Nbr As Long) As Long
'�������������
Declare Function M_LeftDown Lib "msdk.dll" (ByVal m_hdl As Long) As Long
'�������
Declare Function M_LeftUp Lib "msdk.dll" (ByVal m_hdl As Long) As Long
'�Ҽ�����   'Nbr: ����ڵ�ǰλ�õ�������
Declare Function M_RightClick Lib "msdk.dll" (ByVal m_hdl As Long, ByVal Nbr As Long) As Long
'�����Ҽ�������
Declare Function M_RightDown Lib "msdk.dll" (ByVal m_hdl As Long) As Long
'�����Ҽ�
Declare Function M_RightUp Lib "msdk.dll" (ByVal m_hdl As Long) As Long
'�м�����   'Nbr: ����ڵ�ǰλ�õ�������
Declare Function M_MiddleClick Lib "msdk.dll" (ByVal m_hdl As Long, ByVal Nbr As Long) As Long
'�����м�������
Declare Function M_MiddleDown Lib "msdk.dll" (ByVal m_hdl As Long) As Long
'�����м�
Declare Function M_MiddleUp Lib "msdk.dll" (ByVal m_hdl As Long) As Long
'�ͷ��������İ���
Declare Function M_ReleaseAllMouse Lib "msdk.dll" (ByVal m_hdl As Long) As Long
'��ȡ��������Ҽ�״̬   //MouseKeyCode: 1=��� 2=�Ҽ� 3=�м�  //���� 0: ����״̬��1:����״̬��-1: ʧ��
'ֻ�ܶ�ȡ����������״̬����ȡ����ʵ������״̬
Declare Function M_MouseKeyState Lib "msdk.dll" (ByVal m_hdl As Long, ByVal MouseKeyCode As Long) As Long

'����������;  Nbr: ������,  Ϊ��,���Ϲ�����Ϊ��, ���¹���;
Declare Function M_MouseWheel Lib "msdk.dll" (ByVal m_hdl As Long, ByVal Nbr As Long) As Long
'������ƶ���ԭ��(0,0)  �ڳ����ƶ������쳣ʱ�������øú�������긴λ
Declare Function M_ResetMousePos Lib "msdk.dll" (ByVal m_hdl As Long) As Long
'�ӵ�ǰλ���ƶ����    x: x���򣨺��ᣩ�ľ��루��:����; ��ֵ:����; y: y�������ᣩ�ľ��루��:����; ��ֵ:���ϣ�
Declare Function M_MoveR Lib "msdk.dll" (ByVal m_hdl As Long, ByVal x As Long, ByVal y As Long) As Long
'�ƶ���굽ָ������    x: x���򣨺��ᣩ������; y: y�������ᣩ�����ꡣ����ԭ��(0, 0)����Ļ���Ͻ�
Declare Function M_MoveTo Lib "msdk.dll" (ByVal m_hdl As Long, ByVal x As Long, ByVal y As Long) As Long
'��ȡ��ǰ�����������  ����������x��y�С� ע�⣺�ú���������ִ��һ��MoveTo�����������ȷִ�У�
Declare Function M_GetCurrMousePos Lib "msdk.dll" (ByVal m_hdl As Long, ByRef x As Long, ByRef y As Long) As Long

''���½ӿڽ��������ػ��ͱ��ػ���ͬһ̨���Ե�ʹ�÷�ʽ(��ͷģ�飻˫ͷģ�������USBͷ�����ӵ�ͬһ̨����)
''���½ӿڽ�����ϵͳ��API����ȡ��ǰ���λ�ã�DLL������¼����ƶ���λ��
'�ӵ�ǰλ���ƶ����    x: x���򣨺��ᣩ�ľ��루��:����; ��ֵ:����; y: y�������ᣩ�ľ��루��:����; ��ֵ:���ϣ�
Declare Function M_MoveR2 Lib "msdk.dll" (ByVal m_hdl As Long, ByVal x As Long, ByVal y As Long) As Long
'�ƶ���굽ָ������    x: x���򣨺��ᣩ������; y: y�������ᣩ�����ꡣ����ԭ��(0, 0)����Ļ���Ͻ�
Declare Function M_MoveTo2 Lib "msdk.dll" (ByVal m_hdl As Long, ByVal x As Long, ByVal y As Long) As Long
'��ȡ��ǰ�����������  ����������x��y�С�
Declare Function M_GetCurrMousePos2 Lib "msdk.dll" (ByRef x As Long, ByRef y As Long) As Long

'���½ӿڽ�ʹ�þ����ƶ����ܡ��ù���Ŀǰ������֧�ְ�׿
'��ʹ�þ����ƶ�����ǰ�����������뱻�ػ�����Ļ�ֱ���
'x: x���򣨺��ᣩ������; y: y�������ᣩ�����ꡣ����ԭ��(0, 0)����Ļ���Ͻ�
'����ֵ�����-10����ʾ�ú��Ӳ�֧�־����ƶ����ܡ�����0��ʾִ����ȷ�������øýӿ��жϺ����Ƿ�֧�־����ƶ�����
Declare Function M_ResolutionUsed Lib "msdk.dll" (ByVal m_hdl As Long, ByVal x As Long, ByVal y As Long) As Long
'������ƶ���ָ�����ꡣ�����ƶ����ܣ�����ƶ���ָ��λ��ʱ����ĳЩ�����������С�2�����
'ʹ�øýӿں󣬿��Ե���M_GetCurrMousePos��ȡ���λ��
Declare Function M_MoveTo3 Lib "msdk.dll" (ByVal m_hdl As Long, ByVal x As Long, ByVal y As Long) As Long
Declare Function M_MoveTo3_D Lib "msdk.dll" (ByVal m_hdl As Long, ByVal x As Long, ByVal y As Long) As Long
'-------------------------------------------------------------------------------------
 Public M_Handle As Long       '���ڱ��棬�򿪶˿�
 
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
