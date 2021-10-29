unit HandKeyInput;

{$A+,Z+}
{$ASSERTIONS on}

interface

uses
  Windows, Sysutils,forms,dialogs,AsiccAndKeyCode;

const
  HandKeyInputDLL = 'msdk.dll';

//-------------------------��װ�󷽷�------------------------------------------------//
  function HandKeyInput_InputString(str:string):boolean;
  function HandKeyInput_InputCodeNum(CodeNum:integer):boolean;

  function HandKeyInput_InputString2(str:string):boolean;
//-------------------------�򿪽ӿ�------------------------------------------------//
  function HandKeyInput_M_Open(ComNum: integer): THandle; stdcall;
  function HandKeyInput_M_Open_VidPid(Vid: integer;Pid: integer): THandle; stdcall;
  function HandKeyInput_M_Close(Handle: THandle): Integer; stdcall;
//-------------------------��ʱ------------------------------------------------//
  function HandKeyInput_M_Delay(time: integer): Integer; stdcall;
//-------------------------ȡSN д/У���û�����------------------------------------------------//
  function HandKeyInput_M_GetDevSn(Handle: THandle; var LenRes: integer; Res: Pointer): Integer; stdcall;
  function HandKeyInput_M_SetUserData(Handle: THandle; dw_LenUserData:integer; ucp_UserData: Pointer): Integer; stdcall;
  function HandKeyInput_M_VerifyUserData(Handle: THandle; dw_LenUserData:integer; ucp_UserData: Pointer): Integer; stdcall;
//--------------------------���̽ӿ�----------------------------------------------//
//���µĽӿں���������ֵ�� 0 = �ɹ���-1 = ʧ��
  function HandKeyInput_M_KeyPress(Handle: THandle ; HidKeyCode:Integer ; KeyCount:Integer): Integer; stdcall;
  function HandKeyInput_M_KeyDown(Handle: THandle ; HidKeyCode:Integer ): Integer; stdcall;
  function HandKeyInput_M_KeyUp(Handle: THandle ; HidKeyCode:Integer ): Integer; stdcall;
  function HandKeyInput_M_KeyState(Handle: THandle ; HidKeyCode:Integer ): Integer; stdcall;
  function HandKeyInput_M_ReleaseAllKey(Handle: THandle ): Integer; stdcall; //�������а���
  //-------------------------ȡ��״̬----------------------------------------------//
  function HandKeyInput_M_NumLockLedState(Handle: THandle ): Integer; stdcall;
  function HandKeyInput_M_CapsLockLedState(Handle: THandle ): Integer; stdcall;
  function HandKeyInput_M_ScrollLockLedState(Handle: THandle ): Integer; stdcall;
  //-------------------------����һ��ASCII�ַ���------------------------------------------//  
  function HandKeyInput_M_KeyInputString(Handle: THandle; InputStr: Pointer; InputLen: integer): Integer; stdcall;
  function HandKeyInput_M_KeyInputStringGBK(Handle: THandle; InputStr: Pointer; InputLen: integer): Integer; stdcall;
  function HandKeyInput_M_KeyInputStringUnicode(Handle: THandle; InputStr: Pointer; InputLen: integer): Integer; stdcall;

//-------------------------���ӿ�------------------------------------------------//
//���µĽӿں���������ֵ�� 0 = �ɹ���-1 = ʧ��
  function  HandKeyInput_M_LeftClick(Handle: THandle;ClickCount:integer):integer;stdcall;//M_LeftClick�������(���º����̵���)
  function  HandKeyInput_M_LeftDoubleClick(Handle: THandle;ClickCount:integer):integer;stdcall;//M_LeftDoubleClick ���˫��
  function  HandKeyInput_M_LeftDown(Handle: THandle):integer;stdcall;//M_LeftDown �������������
  function  HandKeyInput_M_LeftUp(Handle: THandle):integer;stdcall;//M_LeftUp �������
  function  HandKeyInput_M_RightClick(Handle: THandle;ClickCount:integer):integer;stdcall;//M_RightClick �Ҽ�����(���º����̵���)
  function  HandKeyInput_M_RightDown(Handle: THandle ):integer;stdcall;//M_RightDown �����Ҽ�������
  function  HandKeyInput_M_RightUp(Handle: THandle ):integer;stdcall;//M_RightUp �����Ҽ�
  function  HandKeyInput_M_MiddleClick(Handle: THandle;ClickCount:integer):integer;stdcall;//M_MiddleClick �м�����(���º����̵���)
  function  HandKeyInput_M_MiddleDown(Handle: THandle ):integer;stdcall;//M_MiddleDown �����м�������
  function  HandKeyInput_M_MiddleUp(Handle: THandle ):integer;stdcall;//M_MiddleUp �����м�
  function  HandKeyInput_M_ReleaseAllMouse(Handle: THandle ):integer;stdcall;//M_ReleaseAllMouse �����������а���������������м����Ҽ���
  function  HandKeyInput_M_MouseKeyState(Handle: THandle;MouseKeyCode:integer):integer;stdcall;//��ȡ��������Ҽ�״̬
  
  function  HandKeyInput_M_MouseWheel(Handle: THandle;Nbr:integer ):integer;stdcall;//M_MouseWheel ����������  Nbr: ������,  Ϊ��,���Ϲ�����Ϊ��, ���¹���;
  function  HandKeyInput_M_ResetMousePos(Handle: THandle ):integer;stdcall;//M_ResetMousePos ������ƶ���ԭ��(0,0)
  function  HandKeyInput_M_MoveR(Handle: THandle;x:integer;y:integer ):integer;stdcall;//M_MoveR �ӵ�ǰλ������ƶ����2
            //x: x���򣨺��ᣩ�ľ��루��:����; ��ֵ:����;
            //y: y�������ᣩ�ľ��루��:����; ��ֵ:���ϣ�
  function  HandKeyInput_M_MoveTo(Handle: THandle;x:integer;y:integer ):integer;stdcall;//M_MoveTo �ƶ���굽ָ������2
            //x: x���򣨺��ᣩ������;
            //y: y�������ᣩ�����ꡣע�⣺����ԭ��(0, 0)����Ļ���Ͻ�
  function  HandKeyInput_M_MoveR2(Handle: THandle;x:integer;y:integer ):integer;stdcall;//M_MoveR2 �ӵ�ǰλ������ƶ����2
            //x: x���򣨺��ᣩ�ľ��루��:����; ��ֵ:����;
            //y: y�������ᣩ�ľ��루��:����; ��ֵ:���ϣ�
  function  HandKeyInput_M_MoveTo2(Handle: THandle;x:integer;y:integer ):integer;stdcall;//M_MoveTo2 �ƶ���굽ָ������2
            //x: x���򣨺��ᣩ������;
            //y: y�������ᣩ�����ꡣע�⣺����ԭ��(0, 0)����Ļ���Ͻ�
  function  HandKeyInput_M_GetCurrMousePos(Handle: THandle; var x:integer;var y:integer ):integer;stdcall;//���ص�����ֵ��x��y�С�
  function  HandKeyInput_M_GetCurrMousePos2(var x:integer;var y:integer ):integer;stdcall;//���ص�����ֵ��x��y�С�
            //x: x����
            //y: y����
  function  HandKeyInput_M_ResolutionUsed(Handle: THandle;x:integer;y:integer ):integer;stdcall;
  function  HandKeyInput_M_MoveTo3(Handle: THandle;x:integer;y:integer ):integer;stdcall;

Var  HandKeyInput_KeyHandle : THandle ;

implementation


function HandKeyInput_InputCodeNum(CodeNum:integer):boolean;
begin
  HandKeyInput_KeyHandle := HandKeyInput_M_Open(1);
  repeat
    sleep(50);
  until HandKeyInput_KeyHandle>0 ;
  if HandKeyInput_KeyHandle>0 then
  begin
      HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,CodeNum,1);
  end;
  HandKeyInput_M_Close(HandKeyInput_KeyHandle);  
end;

procedure Delay(msecs:integer);
var
FirstTickCount:longint;
begin
  FirstTickCount:=GetTickCount;
  repeat
     Application.ProcessMessages;
     Sleep(50);
  until
    ((GetTickCount-FirstTickCount) >= Longint(msecs));
end;

function HandKeyInput_InputString(str:string):boolean;
var i,k : integer ;
tempchar : char ;
tempi:integer ;
var temp : TMKKeyData ;
begin
  HandKeyInput_KeyHandle := HandKeyInput_M_Open(1);
  repeat
    sleep(50);
  until HandKeyInput_KeyHandle>0 ;
  if HandKeyInput_KeyHandle>0 then
  begin
    HandKeyInput_M_ReleaseAllKey(HandKeyInput_KeyHandle);

    for i:=0 to length(str)-1 do
    begin
       tempchar := str[i+1];
       Sleep(100);
       application.ProcessMessages;
       Sleep(100);
       temp := GetKeyCodeFromChar(tempchar) ;
       if temp.Code<>-1 then
       begin
          k := HandKeyInput_M_CapsLockedState(HandKeyInput_KeyHandle) ;
          //if k = -1 then k := 0 ;
          if k = 0 then //��
          begin
              if ( temp.NeedCap = 1 ) or (temp.NeedCap = 0 ) then //Сд
              begin
                   HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,temp.Code,1);
              end;
              if temp.NeedCap = 2 then //��д
              begin
                   //��sheft����
//                   HandKeyInput_M_KeyDown(HandKeyInput_KeyHandle,$10);
//                   HandKeyInput_M_KeyDown(HandKeyInput_KeyHandle,temp.Code);
//                   HandKeyInput_M_KeyUp(HandKeyInput_KeyHandle,temp.Code);
//                   HandKeyInput_M_KeyUp(HandKeyInput_KeyHandle,$10);
                     HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,$14,1);
                     HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,temp.Code,1);
                     HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,$14,1);

              end;
          end;
          if k = 1 then //��
          begin
              if  ( temp.NeedCap = 2 ) or (temp.NeedCap = 0 ) then //��д
              begin
                   HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,temp.Code,1);
              end;
              if temp.NeedCap = 1 then //Сд
              begin
                   //��sheft����
//                   HandKeyInput_M_KeyDown(HandKeyInput_KeyHandle,$10);
//                   HandKeyInput_M_KeyDown(HandKeyInput_KeyHandle,temp.Code);
//                   HandKeyInput_M_KeyUp(HandKeyInput_KeyHandle,temp.Code);
//                   HandKeyInput_M_KeyUp(HandKeyInput_KeyHandle,$10);
                     HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,$14,1);
                     HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,temp.Code,1);
                     HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,$14,1);
              end;
          end;

       end;

    end;
  end;
  HandKeyInput_M_Close(HandKeyInput_KeyHandle);
end;

function HandKeyInput_InputString2(str:string):boolean;
var i,k : integer ;
    tempchar : char ;
    tempi:integer ;
var temp : TMKKeyData ;
begin
  if HandKeyInput_KeyHandle > 0 then
  begin
    HandKeyInput_M_ReleaseAllKey(HandKeyInput_KeyHandle);
    for i := 0 to length(str) - 1 do
    begin
       tempchar := str[i+1];
       HandKeyInput_M_Delay(100);
       application.ProcessMessages;
       HandKeyInput_M_Delay(100);
       temp := GetKeyCodeFromChar(tempchar) ;
       if temp.Code<>-1 then
       begin
          k := HandKeyInput_M_CapsLockedState(HandKeyInput_KeyHandle) ;
          //if k = -1 then k := 0 ;
          if k = 0 then //��
          begin
              if ( temp.NeedCap = 1 ) or (temp.NeedCap = 0 ) then //Сд
              begin
                   HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,temp.Code,1);
              end;
              if temp.NeedCap = 2 then //��д
              begin
                   //��sheft����
//                   HandKeyInput_M_KeyDown(HandKeyInput_KeyHandle,$10);
//                   HandKeyInput_M_KeyDown(HandKeyInput_KeyHandle,temp.Code);
//                   HandKeyInput_M_KeyUp(HandKeyInput_KeyHandle,temp.Code);
//                   HandKeyInput_M_KeyUp(HandKeyInput_KeyHandle,$10);
                     HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,$14,1);
                     HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,temp.Code,1);
                     HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,$14,1);

              end;
          end;
          if k = 1 then //��
          begin
              if  ( temp.NeedCap = 2 ) or (temp.NeedCap = 0 ) then //��д
              begin
                   HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,temp.Code,1);
              end;
              if temp.NeedCap = 1 then //Сд
              begin
                   //��sheft����
//                   HandKeyInput_M_KeyDown(HandKeyInput_KeyHandle,$10);
//                   HandKeyInput_M_KeyDown(HandKeyInput_KeyHandle,temp.Code);
//                   HandKeyInput_M_KeyUp(HandKeyInput_KeyHandle,temp.Code);
//                   HandKeyInput_M_KeyUp(HandKeyInput_KeyHandle,$10);
                     HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,$14,1);
                     HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,temp.Code,1);
                     HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,$14,1);
              end;
          end;
       end;
    end;
  end;
end;

function HandKeyInput_M_Open; external HandKeyInputDLL name 'M_Open';
function HandKeyInput_M_Open_VidPid; external HandKeyInputDLL name 'M_Open_VidPid';
function HandKeyInput_M_Close; external HandKeyInputDLL name 'M_Close';
function HandKeyInput_M_Delay; external HandKeyInputDLL name 'M_Delay';
function HandKeyInput_M_GetDevSn; external HandKeyInputDLL name 'M_GetDevSn';
function HandKeyInput_M_SetUserData; external HandKeyInputDLL name 'M_SetUserData';
function HandKeyInput_M_VerifyUserData; external HandKeyInputDLL name 'M_VerifyUserData';

function HandKeyInput_M_KeyPress ; external HandKeyInputDLL name 'M_KeyPress2';//����(���º����̵���)ָ������
function HandKeyInput_M_KeyDown; external HandKeyInputDLL name 'M_KeyDown2';//����ָ������������������²����𣬿��Ժ��������������ϼ�
function HandKeyInput_M_KeyUp; external HandKeyInputDLL name 'M_KeyUp2';//����ָ������
function HandKeyInput_M_KeyState; external HandKeyInputDLL name 'M_KeyState2';//��ȡ����״̬������ֵ��0=����״̬��1:=����״̬
function HandKeyInput_M_ReleaseAllKey ; external HandKeyInputDLL name 'M_ReleaseAllKey'; //�������а���
function HandKeyInput_M_NumLockLedState; external HandKeyInputDLL name 'M_NumLockLedState';  //�ж�С���̵��Ƿ���
function HandKeyInput_M_CapsLockLedState; external HandKeyInputDLL name 'M_CapsLockLedState';  //�ж�caps���Ƿ���
function HandKeyInput_M_ScrollLockLedState; external HandKeyInputDLL name 'M_ScrollLockLedState';  //�ж�scroll���Ƿ���
function HandKeyInput_M_KeyInputString; external HandKeyInputDLL name 'M_KeyInputString';  //����һ��ASCII�ַ���
function HandKeyInput_M_KeyInputStringGBK; external HandKeyInputDLL name 'M_KeyInputStringGBK';  //����һ��GBK�����ַ���
function HandKeyInput_M_KeyInputStringUnicode; external HandKeyInputDLL name 'M_KeyInputStringUnicode';  //����һ��Unicode�����ַ���

function  HandKeyInput_M_LeftClick ; external HandKeyInputDLL name 'M_LeftClick'; //M_LeftClick�������(���º����̵���)
function  HandKeyInput_M_LeftDoubleClick ; external HandKeyInputDLL name 'M_LeftDoubleClick';//M_LeftDoubleClick ���˫��
function  HandKeyInput_M_LeftDown; external HandKeyInputDLL name 'M_LeftDown'; //M_LeftDown �������������
function  HandKeyInput_M_LeftUp ; external HandKeyInputDLL name 'M_LeftUp';//M_LeftUp �������
function  HandKeyInput_M_RightClick; external HandKeyInputDLL name 'M_RightClick'; //M_RightClick �Ҽ�����(���º����̵���)
function  HandKeyInput_M_RightDown; external HandKeyInputDLL name 'M_RightDown'; //M_RightDown �����Ҽ�������
function  HandKeyInput_M_RightUp ; external HandKeyInputDLL name 'M_RightUp';//M_RightUp �����Ҽ�
function  HandKeyInput_M_MiddleClick ; external HandKeyInputDLL name 'M_MiddleClick';//M_MiddleClick �м�����(���º����̵���)
function  HandKeyInput_M_MiddleDown; external HandKeyInputDLL name 'M_MiddleDown'; //M_MiddleDown �����м�������
function  HandKeyInput_M_MiddleUp ; external HandKeyInputDLL name 'M_MiddleUp';//M_MiddleUp �����м�

function  HandKeyInput_M_ReleaseAllMouse; external HandKeyInputDLL name 'M_ReleaseAllMouse'; //M_ReleaseAllMouse �����������а���������������м����Ҽ���
function  HandKeyInput_M_MouseKeyState; external HandKeyInputDLL name 'M_MouseKeyState'; //��ȡ��������Ҽ�״̬
function  HandKeyInput_M_MouseWheel; external HandKeyInputDLL name 'M_MouseWheel'; //M_MouseWheel ����������  Nbr: ������,  Ϊ��,���Ϲ�����Ϊ��, ���¹���;
function  HandKeyInput_M_ResetMousePos ; external HandKeyInputDLL name 'M_ResetMousePos';//M_ResetMousePos ������ƶ���ԭ��(0,0)
function  HandKeyInput_M_MoveR ; external HandKeyInputDLL name 'M_MoveR';//M_MoveR �ӵ�ǰλ������ƶ����2
function  HandKeyInput_M_MoveTo ; external HandKeyInputDLL name 'M_MoveTo';//M_MoveTo �ƶ���굽ָ������2
function  HandKeyInput_M_MoveR2 ; external HandKeyInputDLL name 'M_MoveR2';//M_MoveR2 �ӵ�ǰλ������ƶ����2
function  HandKeyInput_M_MoveTo2 ; external HandKeyInputDLL name 'M_MoveTo2';//M_MoveTo2 �ƶ���굽ָ������2
function  HandKeyInput_M_ResolutionUsed ; external HandKeyInputDLL name 'M_ResolutionUsed';//���뱻�ػ�����Ļ�ֱ���
function  HandKeyInput_M_MoveTo3 ; external HandKeyInputDLL name 'M_MoveTo3';//M_MoveTo3 �ƶ���굽ָ������3
function  HandKeyInput_M_GetCurrMousePos ; external HandKeyInputDLL name 'M_GetCurrMousePos';//���ص�����ֵ��x��y�С�
function  HandKeyInput_M_GetCurrMousePos2 ; external HandKeyInputDLL name 'M_GetCurrMousePos2';//���ص�����ֵ��x��y�С�

initialization
  //HandKeyInput_KeyHandle := HandKeyInput_M_Open(1);
finalization
  //HandKeyInput_M_Close(HandKeyInput_KeyHandle);
end.
