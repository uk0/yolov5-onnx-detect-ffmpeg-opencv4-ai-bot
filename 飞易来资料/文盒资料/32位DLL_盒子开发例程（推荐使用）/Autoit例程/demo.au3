; ������ʹ��au3ִ�гɹ�
; ��һ���ο�msdkʹ��˵������Ȿ������ε���msdk.dll�еĽӿ�

#include <Constants.au3>
#include <Array.au3>

;����ȫ�ֱ��������
Global $m_hdl = Int(0)
Global $dll_hdl
Local $ret

;��dll
$dll_hdl=DllOpen("msdk.dll")
;��ȡ���������򿪶˿�1
$ret = DllCall($dll_hdl, "int", "M_Open", "int", 1)
$m_hdl = $ret[0]   ;����ֵ��һ��array��[0]��ʵ�ʷ���ֵ
if $m_hdl >0 then
    MsgBox($MB_OK, "�򿪶˿�", "�ɹ����˿ھ��=" & $m_hdl)
else
    MsgBox($MB_OK, "�򿪶˿�", "ʧ�ܣ��˿ھ��=" & $m_hdl)
    exit
endif

;ָ���������ȡ����ֵ
Local $intx = Int(0)
Local $inty = Int(0)
$ret = DllCall($dll_hdl, "int", "M_GetCurrMousePos2", "int*", $intx, "int*", $inty) ;M_GetCurrPos2 ��ȡ��ǰ���λ��
MsgBox($MB_OK, "��ȡ����", "x=" & $ret[1] & ", y=" & $ret[2]) ;ret[1]����x, ret[2]����y

;���̲���
$ret = DllCall($dll_hdl, "int", "M_KeyPress", "int", $m_hdl, "int", 4, "int", 2) ;����A��2��

;��ȡNumLock�Ƶ�״̬
$ret = DllCall($dll_hdl, "int", "M_NumLockLedState", "int", $m_hdl)
MsgBox($MB_OK, "Led״̬", "CapsLock=" & $ret[0]) ;ret[0]���ؽ��

;�ַ������������һ���ַ�
Local $cstr16 = "abcdefghijklmn opq *&UIPKKHFYRTH"
$ret = DllCall($dll_hdl, "int", "M_KeyInputString", "int", $m_hdl, "STR", $cstr16, "int", StringLen($cstr16))
MsgBox($MB_OK, "�ַ�������", "str_len=" & StringLen($cstr16) & " str=" & $cstr16)

;������
$ret = DllCall($dll_hdl, "int", "M_MoveR2", "int", $m_hdl, "int", 50, "int", 50) ;MoveR2 50 50

;�رպ��Ӿ��
$ret = DllCall($dll_hdl, "int", "M_Close", "int", $m_hdl)
MsgBox($MB_OK, "�رն˿�", "����=" & $ret[0])
;�ر�dll
DllClose($dll_hdl)