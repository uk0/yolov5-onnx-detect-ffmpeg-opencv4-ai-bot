<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.OpenPort = New System.Windows.Forms.Button()
        Me.ClosePort = New System.Windows.Forms.Button()
        Me.KeyPress_Test = New System.Windows.Forms.Button()
        Me.MoveR2_Test = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'OpenPort
        '
        Me.OpenPort.Location = New System.Drawing.Point(23, 28)
        Me.OpenPort.Name = "OpenPort"
        Me.OpenPort.Size = New System.Drawing.Size(92, 42)
        Me.OpenPort.TabIndex = 0
        Me.OpenPort.Text = "打开端口"
        Me.OpenPort.UseVisualStyleBackColor = True
        '
        'ClosePort
        '
        Me.ClosePort.Location = New System.Drawing.Point(134, 28)
        Me.ClosePort.Name = "ClosePort"
        Me.ClosePort.Size = New System.Drawing.Size(92, 42)
        Me.ClosePort.TabIndex = 0
        Me.ClosePort.Text = "关闭端口"
        Me.ClosePort.UseVisualStyleBackColor = True
        '
        'KeyPress_Test
        '
        Me.KeyPress_Test.Location = New System.Drawing.Point(54, 76)
        Me.KeyPress_Test.Name = "KeyPress_Test"
        Me.KeyPress_Test.Size = New System.Drawing.Size(155, 42)
        Me.KeyPress_Test.TabIndex = 0
        Me.KeyPress_Test.Text = "按键测试"
        Me.KeyPress_Test.UseVisualStyleBackColor = True
        '
        'MoveR2_Test
        '
        Me.MoveR2_Test.Location = New System.Drawing.Point(54, 124)
        Me.MoveR2_Test.Name = "MoveR2_Test"
        Me.MoveR2_Test.Size = New System.Drawing.Size(155, 42)
        Me.MoveR2_Test.TabIndex = 0
        Me.MoveR2_Test.Text = "相对移动2测试"
        Me.MoveR2_Test.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 12.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(258, 184)
        Me.Controls.Add(Me.ClosePort)
        Me.Controls.Add(Me.MoveR2_Test)
        Me.Controls.Add(Me.KeyPress_Test)
        Me.Controls.Add(Me.OpenPort)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents OpenPort As System.Windows.Forms.Button
    Friend WithEvents ClosePort As System.Windows.Forms.Button
    Friend WithEvents KeyPress_Test As System.Windows.Forms.Button
    Friend WithEvents MoveR2_Test As System.Windows.Forms.Button

End Class
