Public Class Form1
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        M_Handle = -1
        ClosePort.Enabled = False
    End Sub
    Private Sub OpenPort_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OpenPort.Click
        If M_Handle > 0 Then
            MsgBox("端口已经打开，请不要重复打开端口。请关闭端口后才能再次打开端口!")
            Exit Sub
        End If
        M_Handle = M_Open(1)
        If M_Handle < 0 Then
            MsgBox("打开端口失败!")
        Else
            OpenPort.Enabled = False
            ClosePort.Enabled = True
        End If
    End Sub
    Private Sub ClosePort_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ClosePort.Click
        If M_Handle < 0 Then
            MsgBox("端口还没有打开，请插上模块，打开端口!")
            Exit Sub
        End If
        M_Close(M_Handle)
        M_Handle = -1
        OpenPort.Enabled = True
        ClosePort.Enabled = False
    End Sub
    Private Sub KeyPress_Test_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles KeyPress_Test.Click
        Dim KeyCode As Integer
        Dim Nbr As Integer
        Dim RetCode As Integer

        If M_Handle < 0 Then
            MsgBox("端口还没有打开，请插上模块，打开端口!")
            Exit Sub
        End If
        '单击 键盘a 两次
        KeyCode = Keyboard_a '按键值在Module1.bas文件中，请打开Module1查看
        Nbr = 2
        'RetCode = M_KeyDown2(M_Handle, 18)
        'RetCode = M_KeyPress(M_Handle, Keyboard_e, 1)
        'RetCode = M_KeyUp2(M_Handle, 18)
        RetCode = M_DelayRandom(500, 800) '这个只是为了调试用，实际程序根据需要来延时
        'RetCode = M_KeyPress(M_Handle, Keyboard_a, 2)
        RetCode = M_KeyPress(M_Handle, KeyCode, Nbr)
        'Ctrl+a
        RetCode = M_KeyDown(M_Handle, Keyboard_LeftControl)
        RetCode = M_KeyPress(M_Handle, Keyboard_a, 1)
        RetCode = M_DelayRandom(80, 200) '这个只是为了调试用，实际程序根据需要来延时
        RetCode = M_ReleaseAllKey(M_Handle)
        'Esc
        RetCode = M_KeyPress(M_Handle, Keyboard_ESCAPE, 1)
        'RetCode = M_KeyUp(M_Handle, Keyboard_a)
        RetCode = M_ReleaseAllKey(M_Handle)
        RetCode = M_DelayRandom(500, 800) '这个只是为了调试用，实际程序根据需要来延时
        RetCode = M_KeyPress2(M_Handle, 144, 1)
    End Sub
    Private Sub MoveR2_Test_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MoveR2_Test.Click
        Dim RetCode As Integer

        If M_Handle < 0 Then
            MsgBox("端口还没有打开，请插上模块，打开端口!")
            Exit Sub
        End If
        RetCode = M_DelayRandom(500, 800) '这个只是为了调试用，实际程序根据需要来延时
        RetCode = M_MoveR2(M_Handle, 50, 50)
    End Sub
End Class
