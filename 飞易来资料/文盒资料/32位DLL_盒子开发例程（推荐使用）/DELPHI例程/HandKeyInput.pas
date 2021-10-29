unit HandKeyInput;

{$A+,Z+}
{$ASSERTIONS on}

interface

uses
  Windows, Sysutils,forms,dialogs,AsiccAndKeyCode;

const
  HandKeyInputDLL = 'msdk.dll';

//-------------------------封装后方法------------------------------------------------//
  function HandKeyInput_InputString(str:string):boolean;
  function HandKeyInput_InputCodeNum(CodeNum:integer):boolean;

  function HandKeyInput_InputString2(str:string):boolean;
//-------------------------打开接口------------------------------------------------//
  function HandKeyInput_M_Open(ComNum: integer): THandle; stdcall;
  function HandKeyInput_M_Open_VidPid(Vid: integer;Pid: integer): THandle; stdcall;
  function HandKeyInput_M_Close(Handle: THandle): Integer; stdcall;
//-------------------------延时------------------------------------------------//
  function HandKeyInput_M_Delay(time: integer): Integer; stdcall;
//-------------------------取SN 写/校验用户数据------------------------------------------------//
  function HandKeyInput_M_GetDevSn(Handle: THandle; var LenRes: integer; Res: Pointer): Integer; stdcall;
  function HandKeyInput_M_SetUserData(Handle: THandle; dw_LenUserData:integer; ucp_UserData: Pointer): Integer; stdcall;
  function HandKeyInput_M_VerifyUserData(Handle: THandle; dw_LenUserData:integer; ucp_UserData: Pointer): Integer; stdcall;
//--------------------------键盘接口----------------------------------------------//
//以下的接口函数，返回值： 0 = 成功；-1 = 失败
  function HandKeyInput_M_KeyPress(Handle: THandle ; HidKeyCode:Integer ; KeyCount:Integer): Integer; stdcall;
  function HandKeyInput_M_KeyDown(Handle: THandle ; HidKeyCode:Integer ): Integer; stdcall;
  function HandKeyInput_M_KeyUp(Handle: THandle ; HidKeyCode:Integer ): Integer; stdcall;
  function HandKeyInput_M_KeyState(Handle: THandle ; HidKeyCode:Integer ): Integer; stdcall;
  function HandKeyInput_M_ReleaseAllKey(Handle: THandle ): Integer; stdcall; //弹起所有按键
  //-------------------------取灯状态----------------------------------------------//
  function HandKeyInput_M_NumLockLedState(Handle: THandle ): Integer; stdcall;
  function HandKeyInput_M_CapsLockLedState(Handle: THandle ): Integer; stdcall;
  function HandKeyInput_M_ScrollLockLedState(Handle: THandle ): Integer; stdcall;
  //-------------------------输入一串ASCII字符串------------------------------------------//  
  function HandKeyInput_M_KeyInputString(Handle: THandle; InputStr: Pointer; InputLen: integer): Integer; stdcall;
  function HandKeyInput_M_KeyInputStringGBK(Handle: THandle; InputStr: Pointer; InputLen: integer): Integer; stdcall;
  function HandKeyInput_M_KeyInputStringUnicode(Handle: THandle; InputStr: Pointer; InputLen: integer): Integer; stdcall;

//-------------------------鼠标接口------------------------------------------------//
//以下的接口函数，返回值： 0 = 成功；-1 = 失败
  function  HandKeyInput_M_LeftClick(Handle: THandle;ClickCount:integer):integer;stdcall;//M_LeftClick左键单击(按下后立刻弹起)
  function  HandKeyInput_M_LeftDoubleClick(Handle: THandle;ClickCount:integer):integer;stdcall;//M_LeftDoubleClick 左键双击
  function  HandKeyInput_M_LeftDown(Handle: THandle):integer;stdcall;//M_LeftDown 按下左键不弹起
  function  HandKeyInput_M_LeftUp(Handle: THandle):integer;stdcall;//M_LeftUp 弹起左键
  function  HandKeyInput_M_RightClick(Handle: THandle;ClickCount:integer):integer;stdcall;//M_RightClick 右键单击(按下后立刻弹起)
  function  HandKeyInput_M_RightDown(Handle: THandle ):integer;stdcall;//M_RightDown 按下右键不弹起
  function  HandKeyInput_M_RightUp(Handle: THandle ):integer;stdcall;//M_RightUp 弹起右键
  function  HandKeyInput_M_MiddleClick(Handle: THandle;ClickCount:integer):integer;stdcall;//M_MiddleClick 中键单击(按下后立刻弹起)
  function  HandKeyInput_M_MiddleDown(Handle: THandle ):integer;stdcall;//M_MiddleDown 按下中键不弹起
  function  HandKeyInput_M_MiddleUp(Handle: THandle ):integer;stdcall;//M_MiddleUp 弹起中键
  function  HandKeyInput_M_ReleaseAllMouse(Handle: THandle ):integer;stdcall;//M_ReleaseAllMouse 弹起鼠标的所有按键（包括左键、中键、右键）
  function  HandKeyInput_M_MouseKeyState(Handle: THandle;MouseKeyCode:integer):integer;stdcall;//读取鼠标左中右键状态
  
  function  HandKeyInput_M_MouseWheel(Handle: THandle;Nbr:integer ):integer;stdcall;//M_MouseWheel 滚动鼠标滚轮  Nbr: 滚动量,  为正,向上滚动；为负, 向下滚动;
  function  HandKeyInput_M_ResetMousePos(Handle: THandle ):integer;stdcall;//M_ResetMousePos 将鼠标移动到原点(0,0)
  function  HandKeyInput_M_MoveR(Handle: THandle;x:integer;y:integer ):integer;stdcall;//M_MoveR 从当前位置相对移动鼠标2
            //x: x方向（横轴）的距离（正:向右; 负值:向左）;
            //y: y方向（纵轴）的距离（正:向下; 负值:向上）
  function  HandKeyInput_M_MoveTo(Handle: THandle;x:integer;y:integer ):integer;stdcall;//M_MoveTo 移动鼠标到指定坐标2
            //x: x方向（横轴）的坐标;
            //y: y方向（纵轴）的坐标。注意：坐标原点(0, 0)在屏幕左上角
  function  HandKeyInput_M_MoveR2(Handle: THandle;x:integer;y:integer ):integer;stdcall;//M_MoveR2 从当前位置相对移动鼠标2
            //x: x方向（横轴）的距离（正:向右; 负值:向左）;
            //y: y方向（纵轴）的距离（正:向下; 负值:向上）
  function  HandKeyInput_M_MoveTo2(Handle: THandle;x:integer;y:integer ):integer;stdcall;//M_MoveTo2 移动鼠标到指定坐标2
            //x: x方向（横轴）的坐标;
            //y: y方向（纵轴）的坐标。注意：坐标原点(0, 0)在屏幕左上角
  function  HandKeyInput_M_GetCurrMousePos(Handle: THandle; var x:integer;var y:integer ):integer;stdcall;//返回的坐标值在x、y中。
  function  HandKeyInput_M_GetCurrMousePos2(var x:integer;var y:integer ):integer;stdcall;//返回的坐标值在x、y中。
            //x: x坐标
            //y: y坐标
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
          if k = 0 then //灭
          begin
              if ( temp.NeedCap = 1 ) or (temp.NeedCap = 0 ) then //小写
              begin
                   HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,temp.Code,1);
              end;
              if temp.NeedCap = 2 then //大写
              begin
                   //按sheft键盘
//                   HandKeyInput_M_KeyDown(HandKeyInput_KeyHandle,$10);
//                   HandKeyInput_M_KeyDown(HandKeyInput_KeyHandle,temp.Code);
//                   HandKeyInput_M_KeyUp(HandKeyInput_KeyHandle,temp.Code);
//                   HandKeyInput_M_KeyUp(HandKeyInput_KeyHandle,$10);
                     HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,$14,1);
                     HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,temp.Code,1);
                     HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,$14,1);

              end;
          end;
          if k = 1 then //亮
          begin
              if  ( temp.NeedCap = 2 ) or (temp.NeedCap = 0 ) then //大写
              begin
                   HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,temp.Code,1);
              end;
              if temp.NeedCap = 1 then //小写
              begin
                   //按sheft键盘
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
          if k = 0 then //灭
          begin
              if ( temp.NeedCap = 1 ) or (temp.NeedCap = 0 ) then //小写
              begin
                   HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,temp.Code,1);
              end;
              if temp.NeedCap = 2 then //大写
              begin
                   //按sheft键盘
//                   HandKeyInput_M_KeyDown(HandKeyInput_KeyHandle,$10);
//                   HandKeyInput_M_KeyDown(HandKeyInput_KeyHandle,temp.Code);
//                   HandKeyInput_M_KeyUp(HandKeyInput_KeyHandle,temp.Code);
//                   HandKeyInput_M_KeyUp(HandKeyInput_KeyHandle,$10);
                     HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,$14,1);
                     HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,temp.Code,1);
                     HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,$14,1);

              end;
          end;
          if k = 1 then //亮
          begin
              if  ( temp.NeedCap = 2 ) or (temp.NeedCap = 0 ) then //大写
              begin
                   HandKeyInput_M_KeyPress(HandKeyInput_KeyHandle,temp.Code,1);
              end;
              if temp.NeedCap = 1 then //小写
              begin
                   //按sheft键盘
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

function HandKeyInput_M_KeyPress ; external HandKeyInputDLL name 'M_KeyPress2';//单击(按下后立刻弹起)指定按键
function HandKeyInput_M_KeyDown; external HandKeyInputDLL name 'M_KeyDown2';//按下指定按键不弹起，如果按下不弹起，可以和其他按键组成组合键
function HandKeyInput_M_KeyUp; external HandKeyInputDLL name 'M_KeyUp2';//弹起指定按键
function HandKeyInput_M_KeyState; external HandKeyInputDLL name 'M_KeyState2';//读取按键状态；返回值：0=弹起状态；1:=按下状态
function HandKeyInput_M_ReleaseAllKey ; external HandKeyInputDLL name 'M_ReleaseAllKey'; //弹起所有按键
function HandKeyInput_M_NumLockLedState; external HandKeyInputDLL name 'M_NumLockLedState';  //判断小键盘灯是否亮
function HandKeyInput_M_CapsLockLedState; external HandKeyInputDLL name 'M_CapsLockLedState';  //判断caps灯是否亮
function HandKeyInput_M_ScrollLockLedState; external HandKeyInputDLL name 'M_ScrollLockLedState';  //判断scroll灯是否亮
function HandKeyInput_M_KeyInputString; external HandKeyInputDLL name 'M_KeyInputString';  //输入一串ASCII字符串
function HandKeyInput_M_KeyInputStringGBK; external HandKeyInputDLL name 'M_KeyInputStringGBK';  //输入一串GBK中文字符串
function HandKeyInput_M_KeyInputStringUnicode; external HandKeyInputDLL name 'M_KeyInputStringUnicode';  //输入一串Unicode中文字符串

function  HandKeyInput_M_LeftClick ; external HandKeyInputDLL name 'M_LeftClick'; //M_LeftClick左键单击(按下后立刻弹起)
function  HandKeyInput_M_LeftDoubleClick ; external HandKeyInputDLL name 'M_LeftDoubleClick';//M_LeftDoubleClick 左键双击
function  HandKeyInput_M_LeftDown; external HandKeyInputDLL name 'M_LeftDown'; //M_LeftDown 按下左键不弹起
function  HandKeyInput_M_LeftUp ; external HandKeyInputDLL name 'M_LeftUp';//M_LeftUp 弹起左键
function  HandKeyInput_M_RightClick; external HandKeyInputDLL name 'M_RightClick'; //M_RightClick 右键单击(按下后立刻弹起)
function  HandKeyInput_M_RightDown; external HandKeyInputDLL name 'M_RightDown'; //M_RightDown 按下右键不弹起
function  HandKeyInput_M_RightUp ; external HandKeyInputDLL name 'M_RightUp';//M_RightUp 弹起右键
function  HandKeyInput_M_MiddleClick ; external HandKeyInputDLL name 'M_MiddleClick';//M_MiddleClick 中键单击(按下后立刻弹起)
function  HandKeyInput_M_MiddleDown; external HandKeyInputDLL name 'M_MiddleDown'; //M_MiddleDown 按下中键不弹起
function  HandKeyInput_M_MiddleUp ; external HandKeyInputDLL name 'M_MiddleUp';//M_MiddleUp 弹起中键

function  HandKeyInput_M_ReleaseAllMouse; external HandKeyInputDLL name 'M_ReleaseAllMouse'; //M_ReleaseAllMouse 弹起鼠标的所有按键（包括左键、中键、右键）
function  HandKeyInput_M_MouseKeyState; external HandKeyInputDLL name 'M_MouseKeyState'; //读取鼠标左中右键状态
function  HandKeyInput_M_MouseWheel; external HandKeyInputDLL name 'M_MouseWheel'; //M_MouseWheel 滚动鼠标滚轮  Nbr: 滚动量,  为正,向上滚动；为负, 向下滚动;
function  HandKeyInput_M_ResetMousePos ; external HandKeyInputDLL name 'M_ResetMousePos';//M_ResetMousePos 将鼠标移动到原点(0,0)
function  HandKeyInput_M_MoveR ; external HandKeyInputDLL name 'M_MoveR';//M_MoveR 从当前位置相对移动鼠标2
function  HandKeyInput_M_MoveTo ; external HandKeyInputDLL name 'M_MoveTo';//M_MoveTo 移动鼠标到指定坐标2
function  HandKeyInput_M_MoveR2 ; external HandKeyInputDLL name 'M_MoveR2';//M_MoveR2 从当前位置相对移动鼠标2
function  HandKeyInput_M_MoveTo2 ; external HandKeyInputDLL name 'M_MoveTo2';//M_MoveTo2 移动鼠标到指定坐标2
function  HandKeyInput_M_ResolutionUsed ; external HandKeyInputDLL name 'M_ResolutionUsed';//输入被控机的屏幕分辨率
function  HandKeyInput_M_MoveTo3 ; external HandKeyInputDLL name 'M_MoveTo3';//M_MoveTo3 移动鼠标到指定坐标3
function  HandKeyInput_M_GetCurrMousePos ; external HandKeyInputDLL name 'M_GetCurrMousePos';//返回的坐标值在x、y中。
function  HandKeyInput_M_GetCurrMousePos2 ; external HandKeyInputDLL name 'M_GetCurrMousePos2';//返回的坐标值在x、y中。

initialization
  //HandKeyInput_KeyHandle := HandKeyInput_M_Open(1);
finalization
  //HandKeyInput_M_Close(HandKeyInput_KeyHandle);
end.
