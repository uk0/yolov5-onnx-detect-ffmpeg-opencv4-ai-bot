VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "��˫ͷ���ӿ��ٲ�������"
   ClientHeight    =   10080
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   7095
   LinkTopic       =   "Form1"
   ScaleHeight     =   10080
   ScaleWidth      =   7095
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Start_HidServ 
      Caption         =   "����HID����"
      Height          =   255
      Left            =   5640
      TabIndex        =   52
      ToolTipText     =   "���򿪶˿�ʧ��ʱ�����Ե���˰�ť������HID���������"
      Top             =   720
      Width           =   1215
   End
   Begin VB.CommandButton SetNewVidPid 
      Caption         =   "������VID/PID"
      Height          =   375
      Left            =   5520
      TabIndex        =   51
      ToolTipText     =   "���ｫ˫ͷ�����ض�VID��ΪC317��PID��Ϊ1; ���ض˲��޸ģ� ����ǵ�ͷ���ӣ�������"
      Top             =   1920
      Width           =   1455
   End
   Begin VB.TextBox UserData 
      Height          =   855
      Left            =   1920
      MultiLine       =   -1  'True
      TabIndex        =   50
      Text            =   "msdk_DEMO.frx":0000
      ToolTipText     =   "���ܳ���256���ֽ�"
      Top             =   1680
      Width           =   3135
   End
   Begin VB.CommandButton VerifyUserData 
      Caption         =   "��֤�û�����"
      Height          =   375
      Left            =   360
      TabIndex        =   49
      Top             =   2160
      Width           =   1455
   End
   Begin VB.CommandButton SetUserData 
      Caption         =   "д���û�����"
      Height          =   375
      Left            =   360
      TabIndex        =   48
      Top             =   1680
      Width           =   1455
   End
   Begin VB.CommandButton MoveTo3Curve 
      Caption         =   "MoveTo3 �ƶ�������߲���"
      Height          =   615
      Left            =   4920
      TabIndex        =   47
      ToolTipText     =   "Ҫ�ڱ��ػ���ϵͳ�������������꣬�����ƶ�׼ȷ�����÷����뿴��msdkʹ��˵���顷"
      Top             =   9240
      Width           =   1695
   End
   Begin VB.CommandButton MoveTo2Curve 
      Caption         =   "MoveTo2 �ƶ�������߲���"
      Height          =   615
      Left            =   2520
      TabIndex        =   46
      ToolTipText     =   "Ҫ�ڱ��ػ���ϵͳ�������������꣬�����ƶ�׼ȷ�����÷����뿴��msdkʹ��˵���顷"
      Top             =   9240
      Width           =   1695
   End
   Begin VB.CommandButton MoveToCurve 
      Caption         =   "MoveTo �ƶ�������߲���"
      Height          =   615
      Left            =   120
      TabIndex        =   45
      ToolTipText     =   "Ҫ�ڱ��ػ���ϵͳ�������������꣬�����ƶ�׼ȷ�����÷����뿴��msdkʹ��˵���顷"
      Top             =   9240
      Width           =   1695
   End
   Begin VB.CommandButton MouseRightKeyStat 
      Caption         =   "��ȡ����Ҽ�״̬"
      Height          =   400
      Left            =   5400
      TabIndex        =   44
      Top             =   5880
      Width           =   1600
   End
   Begin VB.CommandButton MouseLeftKeyStat 
      Caption         =   "��ȡ������״̬"
      Height          =   400
      Left            =   5400
      TabIndex        =   43
      Top             =   5400
      Width           =   1600
   End
   Begin VB.TextBox MoveTo3_X 
      Height          =   375
      Left            =   4080
      TabIndex        =   39
      Text            =   "500"
      Top             =   8640
      Width           =   855
   End
   Begin VB.TextBox MoveTo3_Y 
      Height          =   375
      Left            =   5400
      TabIndex        =   38
      Text            =   "600"
      Top             =   8640
      Width           =   855
   End
   Begin VB.TextBox ResX 
      Height          =   375
      Left            =   4080
      TabIndex        =   35
      Text            =   "1920"
      Top             =   8040
      Width           =   855
   End
   Begin VB.TextBox ResY 
      Height          =   375
      Left            =   5400
      TabIndex        =   34
      Text            =   "1080"
      Top             =   8040
      Width           =   855
   End
   Begin VB.CommandButton ResolutionUsed 
      Caption         =   "���������ƶ�: ���뱻�ػ��ֱ���"
      Height          =   495
      Left            =   240
      TabIndex        =   33
      Top             =   7920
      Width           =   3135
   End
   Begin VB.CommandButton MoveTo3 
      Caption         =   "���������ƶ�: �ƶ���굽ָ������3"
      Height          =   495
      Left            =   240
      TabIndex        =   31
      Top             =   8520
      Width           =   3135
   End
   Begin VB.TextBox InputString 
      Height          =   495
      Left            =   1920
      TabIndex        =   30
      Text            =   "��ึ� !""#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
      Top             =   3360
      Width           =   5055
   End
   Begin VB.CommandButton KeyInputString 
      Caption         =   "���������ַ�������"
      Height          =   495
      Left            =   120
      TabIndex        =   29
      Top             =   3360
      Width           =   1455
   End
   Begin VB.TextBox UserPid 
      Height          =   375
      Left            =   3120
      TabIndex        =   21
      Text            =   "0102"
      ToolTipText     =   "4���ַ���ÿ���ַ�����ʮ������(0~9,A~F)"
      Top             =   1080
      Width           =   615
   End
   Begin VB.TextBox UserVid 
      Height          =   375
      Left            =   2400
      TabIndex        =   20
      Text            =   "C216"
      ToolTipText     =   "4���ַ���ÿ���ַ�����ʮ������(0~9,A~F)"
      Top             =   1080
      Width           =   615
   End
   Begin VB.CommandButton OpenPort_VidPid 
      Caption         =   "��ָ��Vid��Pid�ĺ��Ӷ˿�"
      BeginProperty Font 
         Name            =   "����"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   120
      TabIndex        =   19
      Top             =   860
      Width           =   2175
   End
   Begin VB.CommandButton ChkMouse 
      Caption         =   "�������ƶ�����ȷ�������˰�ť����������"
      Height          =   1095
      Left            =   5400
      TabIndex        =   18
      Top             =   4080
      Width           =   1575
   End
   Begin VB.ComboBox Port 
      DataMember      =   "1"
      Height          =   315
      ItemData        =   "msdk_DEMO.frx":000B
      Left            =   2760
      List            =   "msdk_DEMO.frx":006F
      TabIndex        =   17
      Text            =   "1"
      Top             =   300
      Width           =   735
   End
   Begin VB.CommandButton CapsLockLedState 
      Caption         =   "��ȡCapsLock״̬"
      Height          =   495
      Left            =   5400
      TabIndex        =   16
      Top             =   2760
      Width           =   1575
   End
   Begin VB.CommandButton NumLockLedState 
      Caption         =   "��ȡС����LED״̬"
      Height          =   495
      Left            =   3720
      TabIndex        =   15
      Top             =   2760
      Width           =   1455
   End
   Begin VB.CommandButton GetSn 
      Caption         =   "��ȡ���к�"
      Height          =   375
      Left            =   5640
      TabIndex        =   14
      Top             =   200
      Width           =   1215
   End
   Begin VB.CommandButton MoveR2 
      Caption         =   "����ƶ����2"
      Height          =   495
      Left            =   120
      TabIndex        =   12
      ToolTipText     =   "Ҫ�ڱ��ػ���ϵͳ�������������꣬�����ƶ�׼ȷ�����÷����뿴��msdkʹ��˵���顷"
      Top             =   6120
      Width           =   1455
   End
   Begin VB.CommandButton MoveTo2 
      Caption         =   "�ƶ���굽ָ������2"
      Height          =   495
      Left            =   1920
      TabIndex        =   11
      ToolTipText     =   "Ҫ�ڱ��ػ���ϵͳ�������������꣬�����ƶ�׼ȷ�����÷����뿴��msdkʹ��˵���顷"
      Top             =   6120
      Width           =   1455
   End
   Begin VB.CommandButton GetPos2 
      Caption         =   "ȡ��ǰ�������2"
      Height          =   495
      Left            =   3720
      TabIndex        =   10
      ToolTipText     =   "Ҫ�ڱ��ػ���ϵͳ�������������꣬�����ƶ�׼ȷ�����÷����뿴��msdkʹ��˵���顷"
      Top             =   6120
      Width           =   1575
   End
   Begin VB.CommandButton KeyState 
      Caption         =   "��ȡ����״̬"
      Height          =   495
      Left            =   1920
      TabIndex        =   9
      Top             =   2760
      Width           =   1455
   End
   Begin VB.CommandButton GetPos 
      Caption         =   "ȡ��ǰ�������"
      Height          =   495
      Left            =   3720
      TabIndex        =   8
      ToolTipText     =   "Ҫ�ڱ��ػ���ϵͳ�������������꣬�����ƶ�׼ȷ�����÷����뿴��msdkʹ��˵���顷"
      Top             =   4680
      Width           =   1455
   End
   Begin VB.CommandButton MoveTo 
      Caption         =   "�ƶ���굽ָ������"
      Height          =   495
      Left            =   1920
      TabIndex        =   7
      ToolTipText     =   "Ҫ�ڱ��ػ���ϵͳ�������������꣬�����ƶ�׼ȷ�����÷����뿴��msdkʹ��˵���顷"
      Top             =   4680
      Width           =   1455
   End
   Begin VB.CommandButton MoveR 
      Caption         =   "����ƶ����"
      Height          =   495
      Left            =   120
      TabIndex        =   6
      ToolTipText     =   "Ҫ�ڱ��ػ���ϵͳ�������������꣬�����ƶ�׼ȷ�����÷����뿴��msdkʹ��˵���顷"
      Top             =   4680
      Width           =   1455
   End
   Begin VB.CommandButton WheelTest 
      Caption         =   "���ֹ�������"
      Height          =   495
      Left            =   3720
      TabIndex        =   5
      Top             =   4080
      Width           =   1455
   End
   Begin VB.CommandButton RightClick 
      Caption         =   "�����Ҽ�1��"
      Height          =   495
      Left            =   1920
      TabIndex        =   4
      Top             =   4080
      Width           =   1455
   End
   Begin VB.CommandButton LeftClick 
      Caption         =   "�����������"
      Height          =   495
      Left            =   120
      TabIndex        =   3
      Top             =   4080
      Width           =   1455
   End
   Begin VB.CommandButton KeyPress 
      Caption         =   "���̰�������"
      Height          =   495
      Left            =   120
      TabIndex        =   2
      Top             =   2760
      Width           =   1455
   End
   Begin VB.CommandButton ClosePort 
      Caption         =   "�رն˿�"
      Height          =   495
      Left            =   3960
      TabIndex        =   1
      Top             =   200
      Width           =   1455
   End
   Begin VB.CommandButton OpenPort 
      Caption         =   "��ָ���˿ںŵĺ��Ӷ˿�"
      BeginProperty Font 
         Name            =   "����"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2175
   End
   Begin VB.Frame Frame1 
      Height          =   800
      Left            =   80
      TabIndex        =   24
      Top             =   -10
      Width           =   3735
      Begin VB.Label PortName 
         Caption         =   "�˿�"
         Height          =   255
         Left            =   2280
         TabIndex        =   28
         Top             =   360
         Width           =   375
      End
   End
   Begin VB.Frame Frame2 
      Height          =   810
      Left            =   80
      TabIndex        =   25
      Top             =   720
      Width           =   3735
      Begin VB.Label Label3 
         Caption         =   "PID"
         Height          =   255
         Left            =   3200
         TabIndex        =   27
         Top             =   120
         Width           =   255
      End
      Begin VB.Label Label6 
         Caption         =   "VID"
         Height          =   255
         Left            =   2480
         TabIndex        =   26
         Top             =   120
         Width           =   255
      End
   End
   Begin VB.Line Line6 
      BorderColor     =   &H0000FF00&
      BorderWidth     =   5
      X1              =   120
      X2              =   6960
      Y1              =   1560
      Y2              =   1560
   End
   Begin VB.Line Line5 
      BorderColor     =   &H0000C000&
      BorderWidth     =   5
      X1              =   120
      X2              =   6960
      Y1              =   9120
      Y2              =   9120
   End
   Begin VB.Label Label11 
      BackColor       =   &H00C0C000&
      Caption         =   "2017.5���Ժ����۵ĺ��Ӳ���������ܡ�������qq���Ա���ϵ"
      Height          =   255
      Left            =   120
      TabIndex        =   42
      Top             =   7560
      Width           =   6855
      WordWrap        =   -1  'True
   End
   Begin VB.Label Label10 
      Caption         =   "Y"
      Height          =   255
      Left            =   5160
      TabIndex        =   41
      Top             =   8700
      Width           =   255
   End
   Begin VB.Label Label9 
      Caption         =   "X"
      Height          =   255
      Left            =   3720
      TabIndex        =   40
      Top             =   8700
      Width           =   255
   End
   Begin VB.Label Label8 
      Caption         =   "Y"
      Height          =   255
      Left            =   5160
      TabIndex        =   37
      Top             =   8100
      Width           =   255
   End
   Begin VB.Label Label7 
      Caption         =   "X"
      Height          =   255
      Left            =   3720
      TabIndex        =   36
      Top             =   8100
      Width           =   255
   End
   Begin VB.Label Label2 
      BackColor       =   &H0000FF00&
      Caption         =   $"msdk_DEMO.frx":00EA
      Height          =   615
      Left            =   120
      TabIndex        =   32
      Top             =   6840
      Width           =   6855
      WordWrap        =   -1  'True
   End
   Begin VB.Line Line4 
      BorderColor     =   &H000000C0&
      BorderWidth     =   5
      X1              =   120
      X2              =   6960
      Y1              =   6720
      Y2              =   6720
   End
   Begin VB.Line Line3 
      BorderColor     =   &H00FF0000&
      BorderWidth     =   5
      X1              =   120
      X2              =   6960
      Y1              =   2640
      Y2              =   2640
   End
   Begin VB.Line Line2 
      BorderWidth     =   5
      X1              =   120
      X2              =   5400
      Y1              =   5280
      Y2              =   5280
   End
   Begin VB.Label Label5 
      Caption         =   "��ͷ(C216��0301)��˫ͷ(C216��0102)"
      Height          =   255
      Left            =   3840
      TabIndex        =   23
      Top             =   1200
      Width           =   3015
   End
   Begin VB.Label Label4 
      Caption         =   "����Ĭ��VID��PID��"
      Height          =   255
      Left            =   3840
      TabIndex        =   22
      Top             =   840
      Width           =   1695
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00C0C000&
      BorderWidth     =   5
      X1              =   120
      X2              =   6960
      Y1              =   3960
      Y2              =   3960
   End
   Begin VB.Label Label1 
      BackColor       =   &H0000FF00&
      Caption         =   $"msdk_DEMO.frx":0193
      Height          =   615
      Left            =   120
      TabIndex        =   13
      Top             =   5400
      Width           =   5175
      WordWrap        =   -1  'True
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Declare Function lstrlen Lib "kernel32" Alias "lstrlenA" (ByVal lpString As String) As Long
Private Sub ChkMouse_Click()
    ShellExecute Me.hwnd, "open", "����������.exe", vbNullString, "", 1
End Sub
Private Sub Form_Load()
    M_Handle = -1
    ClosePort.Enabled = False
End Sub
Private Sub OpenPort_Click()
    If M_Handle > 0 Then
        MsgBox "�˿��Ѿ��򿪣��벻Ҫ�ظ��򿪶˿ڡ���رն˿ں�����ٴδ򿪶˿�!"
        Exit Sub
    End If
    
    M_Handle = M_Open(Port.Text) '�����ǵ�ͷ��013Wģ�飬����˫ͷ��012WUģ�飬���Ǵ�1��ʼ�򿪣�����Ϊ2,3,4...
    If M_Handle < 0 Then
        MsgBox "�򿪶˿�ʧ��!"
    Else
        OpenPort.Enabled = False
        OpenPort_VidPid.Enabled = False
        Port.Enabled = False
        ClosePort.Enabled = True
    End If
End Sub
Private Sub OpenPort_VidPid_Click()
    If M_Handle > 0 Then
        MsgBox "�˿��Ѿ��򿪣��벻Ҫ�ظ��򿪶˿ڡ���رն˿ں�����ٴδ򿪶˿�!"
        Exit Sub
    End If
    
    M_Handle = M_Open_VidPid(Int("&H" & UserVid.Text), Int("&H" & UserPid.Text))
    If M_Handle < 0 Then
        MsgBox "�򿪶˿�ʧ��!"
    Else
        OpenPort.Enabled = False
        OpenPort_VidPid.Enabled = False
        Port.Enabled = False
        ClosePort.Enabled = True
    End If
End Sub
Private Sub ClosePort_Click()
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    M_Close (M_Handle)
    M_Handle = -1
    OpenPort.Enabled = True
    OpenPort_VidPid.Enabled = True
    Port.Enabled = True
    ClosePort.Enabled = False
End Sub
Private Sub Start_HidServ_Click()
    ShellExecute Me.hwnd, "open", "start_hidserv.bat", vbNullString, "", 1
End Sub
Private Sub GetSn_Click()
    Dim dw_LenCommand As Long
    Dim ucp_Command(256) As Byte
    Dim dwp_LenResponse As Long
    Dim ucp_Response(256) As Byte
    Dim uc_Response As String
    Dim dw_TimeOut As Long
    Dim n As Long
    
    Dim KeyCode As Long
    Dim Nbr As Long
    Dim RetCode As Long
    
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    RetCode = M_GetDevSn(M_Handle, dwp_LenResponse, ucp_Response(0))
    If RetCode = 0 Then
        uc_Response = "ģ�����к�"
        n = 0
        While n < dwp_LenResponse
            uc_Response = uc_Response & ucp_Response(n) & " "
            n = n + 1
        Wend
        MsgBox uc_Response
    Else
        MsgBox "����ģ��δ֧�����к�"
    End If
End Sub
Private Sub SetUserData_Click()
    Dim AsciiText As String
    Dim AsciiLen As Long
    Dim ucp_UserData() As Byte
    Dim RetCode As Long
        
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    AsciiText = UserData.Text()
    ucp_UserData = StrConv(AsciiText, vbFromUnicode)
    AsciiLen = Len(AsciiText)
    RetCode = M_SetUserData(M_Handle, AsciiLen, ucp_UserData(0))
    If RetCode <> 0 Then
        MsgBox "д���û�����ʧ��"
    End If
End Sub
Private Sub VerifyUserData_Click()
    Dim AsciiText As String
    Dim AsciiLen As Long
    Dim ucp_UserData() As Byte
    Dim RetCode As Long
        
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    AsciiText = UserData.Text()
    ucp_UserData = StrConv(AsciiText, vbFromUnicode)
    AsciiLen = Len(AsciiText)
    RetCode = M_VerifyUserData(M_Handle, AsciiLen, ucp_UserData(0))
    If RetCode <> 0 Then
        MsgBox "��֤�û�����ʧ��"
    Else
        MsgBox "��֤�û����ݳɹ�"
    End If
End Sub
Private Sub SetNewVidPid_Click()
    Dim RetCode As Long
    
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    
    RetCode = M_ChkSupportMdy(M_Handle)
    If RetCode <> 0 Then
        MsgBox "���ǿ��޸ĺ��ӣ�����������Vid/Pid"
        Exit Sub
    End If
    
    RetCode = M_SetNewVidPid(M_Handle, &HC317, &H1, 0, 0) '���ｫ˫ͷ�����ض�VID��ΪC317��PID��Ϊ1; ���ض˲��޸ģ� ����ǵ�ͷ���ӣ�������
    If RetCode = -10 Then
        MsgBox "���ض�VID�����Ϲ���"
    ElseIf RetCode = -11 Then
        MsgBox "���ض�PID�����Ϲ���"
    ElseIf RetCode = -20 Then
        MsgBox "���ض�VID�����Ϲ���"
    ElseIf RetCode = -21 Then
        MsgBox "���ض�PID�����Ϲ���"
    ElseIf RetCode = -2 Then
        MsgBox "���Ӳ�֧���޸�"
    ElseIf RetCode <> 0 Then
        MsgBox "������Vid/Pid����"
    End If
End Sub
Private Sub KeyPress_Click()
    Dim KeyCode As Long
    Dim Nbr As Long
    Dim RetCode As Long
        
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    '���� ����a ����
    KeyCode = Keyboard_a '����ֵ��Module1.bas�ļ��У����Module1�鿴
    Nbr = 2
    'RetCode = M_KeyDown2(M_Handle, 18)
    'RetCode = M_KeyPress(M_Handle, Keyboard_e, 1)
    'RetCode = M_KeyUp2(M_Handle, 18)
    RetCode = M_DelayRandom(500, 800) '���ֻ��Ϊ�˵����ã�ʵ�ʳ��������Ҫ����ʱ
    'RetCode = M_KeyPress(M_Handle, Keyboard_a, 2)
    RetCode = M_KeyPress(M_Handle, Keypad_NumLock, 1)
    RetCode = M_KeyPress(M_Handle, KeyCode, Nbr)
    'Ctrl+a
    RetCode = M_KeyDown(M_Handle, Keyboard_LeftControl)
    RetCode = M_KeyPress(M_Handle, Keyboard_a, 1)
    RetCode = M_DelayRandom(80, 200) '���ֻ��Ϊ�˵����ã�ʵ�ʳ��������Ҫ����ʱ
    RetCode = M_ReleaseAllKey(M_Handle)
    'Esc
    RetCode = M_KeyPress(M_Handle, Keyboard_ESCAPE, 1)
    RetCode = M_KeyUp(M_Handle, Keyboard_a)
    RetCode = M_ReleaseAllKey(M_Handle)
    RetCode = M_DelayRandom(500, 800) '���ֻ��Ϊ�˵����ã�ʵ�ʳ��������Ҫ����ʱ
    RetCode = M_KeyPress2(M_Handle, 144, 1)
End Sub
Private Sub KeyState_Click()
    Dim KeyCode As Long
    Dim Nbr As Long
    Dim RetCode As Long
        
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    RetCode = M_KeyState(M_Handle, Keyboard_a)
    MsgBox "Keyboard_a״̬=" & RetCode
End Sub
Private Sub NumLockLedState_Click()
    Dim KeyCode As Long
    Dim Nbr As Long
    Dim RetCode As Long
        
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    RetCode = M_NumLockLedState(M_Handle)
    MsgBox "NumLockLedState=" & RetCode
End Sub
Private Sub CapsLockLedState_Click()
    Dim KeyCode As Long
    Dim Nbr As Long
    Dim RetCode As Long
        
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    RetCode = M_CapsLockLedState(M_Handle)
    MsgBox "CapsLockLedState=" & RetCode
End Sub
Private Sub KeyInputString_Click()
    Dim AsciiText As String
    Dim AsciiLen As Long
    Dim RetCode As Long
    Dim data() As Byte
    Dim i As Integer
            
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    RetCode = M_DelayRandom(800, 1200) '���ֻ��Ϊ�˵�����
    AsciiText = InputString.Text()
    AsciiLen = lstrlen(AsciiText) '�ֽ���
    RetCode = M_KeyInputStringGBK(M_Handle, AsciiText, AsciiLen)
    'RetCode = M_KeyPress(M_Handle, Keyboard_ENTER, 1)  '����
    'RetCode = M_KeyInputString(M_Handle, "0123456789", 10)  'Ҳ����ֱ�������������ַ���
End Sub
Private Sub LeftClick_Click()
    Dim KeyCode As Long
    Dim Nbr As Long
    Dim RetCode As Long
        
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    RetCode = M_DelayRandom(500, 800) '���ֻ��Ϊ�˵����ã�ʵ�ʳ��������Ҫ����ʱ
    RetCode = M_LeftClick(M_Handle, 2)
End Sub
Private Sub RightClick_Click()
    Dim RetCode As Long
        
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    RetCode = M_DelayRandom(500, 800) '���ֻ��Ϊ�˵����ã�ʵ�ʳ��������Ҫ����ʱ
    RetCode = M_RightClick(M_Handle, 1)
End Sub
Private Sub MouseLeftKeyStat_Click()
    Dim RetCode As Long
    
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    RetCode = M_MouseKeyState(M_Handle, 1)
    MsgBox "Mouse LeftKey State=" & RetCode
End Sub
Private Sub MouseRightKeyStat_Click()
    Dim RetCode As Long
    
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    RetCode = M_MouseKeyState(M_Handle, 1)
    MsgBox "Mouse RightKey State=" & RetCode
End Sub
Private Sub WheelTest_Click()
    Dim RetCode As Long
        
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    RetCode = M_DelayRandom(500, 800) '���ֻ��Ϊ�˵����ã�ʵ�ʳ��������Ҫ����ʱ
    RetCode = M_MouseWheel(M_Handle, 2) ' ���Ϲ���
    RetCode = M_DelayRandom(500, 800) '���ֻ��Ϊ�˵����ã�ʵ�ʳ��������Ҫ����ʱ
    RetCode = M_MouseWheel(M_Handle, -5) ' ���¹���
End Sub
Private Sub MoveR_Click()
    Dim RetCode As Long
        
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    RetCode = M_DelayRandom(500, 800) '���ֻ��Ϊ�˵����ã�ʵ�ʳ��������Ҫ����ʱ
    RetCode = M_MoveR(M_Handle, 100, -100)
End Sub
Private Sub MoveTo_Click()
    Dim RetCode As Long
        
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    RetCode = M_DelayRandom(500, 800) '���ֻ��Ϊ�˵����ã�ʵ�ʳ��������Ҫ����ʱ
    RetCode = M_MoveTo(M_Handle, 50, 50)
End Sub
Private Sub GetPos_Click()
    Dim RetCode As Long
    Dim X_pos As Long
    Dim Y_pos As Long
    
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    RetCode = M_GetCurrMousePos(M_Handle, X_pos, Y_pos)
    MsgBox "x=" & X_pos & ", y=" & Y_pos

End Sub
Private Sub MoveR2_Click()
    Dim RetCode As Long
        
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    RetCode = M_DelayRandom(500, 800) '���ֻ��Ϊ�˵����ã�ʵ�ʳ��������Ҫ����ʱ
    RetCode = M_MoveR2(M_Handle, 50, 50)
End Sub
Private Sub MoveTo2_Click()
    Dim RetCode As Long
        
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    RetCode = M_DelayRandom(500, 800) '���ֻ��Ϊ�˵����ã�ʵ�ʳ��������Ҫ����ʱ
    RetCode = M_MoveTo2(M_Handle, 100, 100)
End Sub
Private Sub GetPos2_Click()
    Dim RetCode As Long
    Dim X_pos As Long
    Dim Y_pos As Long

    RetCode = M_GetCurrMousePos2(X_pos, Y_pos)
    MsgBox "x=" & X_pos & ", y=" & Y_pos
End Sub
Private Sub ResolutionUsed_Click()
    Dim RetCode As Long
        
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    RetCode = M_ResolutionUsed(M_Handle, Int(ResX.Text), Int(ResY.Text)) '���ֻ��Ϊ�˵����ã�ʵ�ʳ�����ݱ��ػ��ֱ��ʵ�������
    If RetCode = -10 Then
        MsgBox "�ú��Ӳ�֧�־����ƶ�����!"
    ElseIf RetCode <> 0 Then
        MsgBox "ִ��ʧ��!"
    End If
    
End Sub
Private Sub MoveTo3_Click()
    Dim RetCode As Long
        
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    RetCode = M_DelayRandom(1000, 1200)
    RetCode = M_MoveTo3(M_Handle, Int(MoveTo3_X.Text), Int(MoveTo3_Y.Text)) '���ֻ��Ϊ�˵����ã�ʵ�ʳ�����ݱ��ػ��ֱ��ʵ�������
    If RetCode <> 0 Then
        MsgBox "ִ��ʧ��"
    End If
End Sub
Private Sub MoveToCurve_Click()
    Dim RetCode As Long
    Dim i As Long
        
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    MsgBox "������Խ�����MoveTo�ӿڣ���(100,100)~(800,800)��Χ�ڲ����ƶ�����!" & vbCrLf & "����ǰ���������ú���ꡣ" & vbCrLf & "ͬʱ�����²������úû�ͼ�����" & vbCrLf & "1���뽫windows�Ļ�ͼ�򿪣������ͼ��-�����ԡ�������ȸ߶���Ϊ1000,1000" & vbCrLf & "2��Ȼ����ѡ��Ǧ��" & vbCrLf & vbCrLf & "�ڵ������Ի���ġ�ȷ������ť���뽫�����ٵĵ㵽��ͼ�"
    RetCode = M_DelayRandom(500, 600)
    RetCode = M_MoveTo(M_Handle, 100, 100)
    RetCode = M_LeftDown(M_Handle)
    For i = 1 To 5
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo(M_Handle, 600, 400)
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo(M_Handle, 100, 100)
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo(M_Handle, 400, 600)
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo(M_Handle, 100, 100)
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo(M_Handle, 100, 600)
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo(M_Handle, 600, 600)
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo(M_Handle, 600, 100)
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo(M_Handle, 100, 100)
    Next i
    RetCode = M_LeftUp(M_Handle)
End Sub
Private Sub MoveTo2Curve_Click()
    Dim RetCode As Long
    Dim i As Long
        
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    MsgBox "������Խ�����MoveTo2�ӿڣ���(100,100)~(800,800)��Χ�ڲ����ƶ�����!" & vbCrLf & "����ǰ���������ú���ꡣ" & vbCrLf & "ͬʱ�����²������úû�ͼ�����" & vbCrLf & "1���뽫windows�Ļ�ͼ�򿪣������ͼ��-�����ԡ�������ȸ߶���Ϊ1000,1000" & vbCrLf & "2��Ȼ����ѡ��Ǧ��" & vbCrLf & vbCrLf & "�ڵ������Ի���ġ�ȷ������ť���뽫�����ٵĵ㵽��ͼ�"
    RetCode = M_DelayRandom(500, 600)
    RetCode = M_MoveTo2(M_Handle, 100, 100)
    RetCode = M_LeftDown(M_Handle)
    For i = 1 To 5
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo2(M_Handle, 600, 400)
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo2(M_Handle, 100, 100)
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo2(M_Handle, 400, 600)
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo2(M_Handle, 100, 100)
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo2(M_Handle, 100, 600)
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo2(M_Handle, 600, 600)
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo2(M_Handle, 600, 100)
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo2(M_Handle, 100, 100)
    Next i
    RetCode = M_LeftUp(M_Handle)
End Sub
Private Sub MoveTo3Curve_Click()
    Dim RetCode As Long
    Dim i As Long
        
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    MsgBox "������Խ�����MoveTo3�ӿڣ���(100,100)~(800,800)��Χ�ڲ����ƶ�����!" & vbCrLf & "����ǰ���������ú���Ļ�ֱ��ʡ�" & vbCrLf & "ͬʱ�����²������úû�ͼ�����" & vbCrLf & "1���뽫windows�Ļ�ͼ�򿪣������ͼ��-�����ԡ�������ȸ߶���Ϊ1000,1000" & vbCrLf & "2��Ȼ����ѡ��Ǧ��" & vbCrLf & vbCrLf & "�ڵ������Ի���ġ�ȷ������ť���뽫�����ٵĵ㵽��ͼ�"
    RetCode = M_DelayRandom(500, 600)
    RetCode = M_MoveTo3(M_Handle, 600, 600)
    If RetCode <> 0 Then
        MsgBox "ִ��ʧ��"
        Exit Sub
    End If
    RetCode = M_LeftDown(M_Handle)
    For i = 1 To 5
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo3(M_Handle, 600, 400)
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo3(M_Handle, 100, 100)
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo3(M_Handle, 400, 600)
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo3(M_Handle, 100, 100)
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo3(M_Handle, 100, 600)
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo3(M_Handle, 600, 600)
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo3(M_Handle, 600, 100)
        RetCode = M_DelayRandom(10, 20)
        RetCode = M_MoveTo3(M_Handle, 100, 100)
    Next i
    RetCode = M_LeftUp(M_Handle)
End Sub
Private Sub MoveTo3_S_Curve_Click()
    Dim RetCode As Long
    Dim i As Long
        
    If M_Handle < 0 Then
        MsgBox "�˿ڻ�û�д򿪣������ģ�飬�򿪶˿�!"
        Exit Sub
    End If
    MsgBox "������Խ�����MoveTo3_S�ӿڣ���(100,100)~(800,800)��Χ�ڲ����ƶ�����!" & vbCrLf & "����ǰ���������ú���Ļ�ֱ��ʡ�" & vbCrLf & "ͬʱ�����²������úû�ͼ�����" & vbCrLf & "1���뽫windows�Ļ�ͼ�򿪣������ͼ��-�����ԡ�������ȸ߶���Ϊ1000,1000" & vbCrLf & "2��Ȼ����ѡ��Ǧ��" & vbCrLf & vbCrLf & "�ڵ������Ի���ġ�ȷ������ť���뽫�����ٵĵ㵽��ͼ�"
    RetCode = M_DelayRandom(500, 600)
    RetCode = M_MoveTo3(M_Handle, 600, 600)
    If RetCode <> 0 Then
        MsgBox "ִ��ʧ��"
        Exit Sub
    End If
    RetCode = M_LeftDown(M_Handle)
    For i = 1 To 5
        RetCode = M_DelayRandom(500, 600)
        RetCode = M_MoveTo3_TEST(M_Handle, 600, 400, M_RandDomNbr(50, 99), M_RandDomNbr(10, 30), M_RandDomNbr(30, 70))
        RetCode = M_DelayRandom(500, 600)
        RetCode = M_MoveTo3_TEST(M_Handle, 100, 100, M_RandDomNbr(50, 99), M_RandDomNbr(10, 30), M_RandDomNbr(30, 70))
        RetCode = M_DelayRandom(500, 600)
        RetCode = M_MoveTo3_TEST(M_Handle, 400, 600, M_RandDomNbr(50, 99), M_RandDomNbr(10, 30), M_RandDomNbr(30, 70))
        RetCode = M_DelayRandom(500, 600)
        RetCode = M_MoveTo3_TEST(M_Handle, 100, 100, M_RandDomNbr(50, 99), M_RandDomNbr(10, 30), M_RandDomNbr(30, 70))
        RetCode = M_DelayRandom(500, 600)
        RetCode = M_MoveTo3_TEST(M_Handle, 100, 600, M_RandDomNbr(50, 99), M_RandDomNbr(10, 30), M_RandDomNbr(30, 70))
        RetCode = M_DelayRandom(500, 600)
        RetCode = M_MoveTo3_TEST(M_Handle, 600, 600, M_RandDomNbr(50, 99), M_RandDomNbr(10, 30), M_RandDomNbr(30, 70))
        RetCode = M_DelayRandom(500, 600)
        RetCode = M_MoveTo3_TEST(M_Handle, 600, 100, M_RandDomNbr(50, 99), M_RandDomNbr(10, 30), M_RandDomNbr(30, 70))
        RetCode = M_DelayRandom(500, 600)
        RetCode = M_MoveTo3_TEST(M_Handle, 100, 100, M_RandDomNbr(50, 99), M_RandDomNbr(10, 30), M_RandDomNbr(30, 70))
    Next i
    RetCode = M_LeftUp(M_Handle)
End Sub
