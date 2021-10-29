; 本例程使用au3执行成功
; 请一定参考msdk使用说明书理解本例程如何调用msdk.dll中的接口

#include <Constants.au3>
#include <Array.au3>

;定义全局变量，句柄
Global $m_hdl = Int(0)
Global $dll_hdl
Local $ret

;打开dll
$dll_hdl=DllOpen("msdk.dll")
;获取句柄，这里打开端口1
$ret = DllCall($dll_hdl, "int", "M_Open", "int", 1)
$m_hdl = $ret[0]   ;返回值是一个array，[0]是实际返回值
if $m_hdl >0 then
    MsgBox($MB_OK, "打开端口", "成功，端口句柄=" & $m_hdl)
else
    MsgBox($MB_OK, "打开端口", "失败，端口句柄=" & $m_hdl)
    exit
endif

;指针操作：读取坐标值
Local $intx = Int(0)
Local $inty = Int(0)
$ret = DllCall($dll_hdl, "int", "M_GetCurrMousePos2", "int*", $intx, "int*", $inty) ;M_GetCurrPos2 获取当前鼠标位置
MsgBox($MB_OK, "读取坐标", "x=" & $ret[1] & ", y=" & $ret[2]) ;ret[1]返回x, ret[2]返回y

;键盘操作
$ret = DllCall($dll_hdl, "int", "M_KeyPress", "int", $m_hdl, "int", 4, "int", 2) ;单击A键2次

;读取NumLock灯的状态
$ret = DllCall($dll_hdl, "int", "M_NumLockLedState", "int", $m_hdl)
MsgBox($MB_OK, "Led状态", "CapsLock=" & $ret[0]) ;ret[0]返回结果

;字符串操作：输出一串字符
Local $cstr16 = "abcdefghijklmn opq *&UIPKKHFYRTH"
$ret = DllCall($dll_hdl, "int", "M_KeyInputString", "int", $m_hdl, "STR", $cstr16, "int", StringLen($cstr16))
MsgBox($MB_OK, "字符串操作", "str_len=" & StringLen($cstr16) & " str=" & $cstr16)

;鼠标操作
$ret = DllCall($dll_hdl, "int", "M_MoveR2", "int", $m_hdl, "int", 50, "int", 50) ;MoveR2 50 50

;关闭盒子句柄
$ret = DllCall($dll_hdl, "int", "M_Close", "int", $m_hdl)
MsgBox($MB_OK, "关闭端口", "返回=" & $ret[0])
;关闭dll
DllClose($dll_hdl)