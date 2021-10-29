//------------------------------------------------------------------------------//
//          北京飞易来科技有限公司                                              //
//    硬件模拟键盘鼠标模块应用编程接口(API)说明                                 //
//                                                                              //
//    本API适用于                                                               //
//    1. 双头012WU模块                                                          //
//    2. 单头013W模块                                                           //
//    3. windows2000及以上32/64位操作系统                                       //
//                                                                              //
//    详细请登陆北京飞易来科技有限公司官方网站http://freeeasy-life.com          //
//------------------------------------------------------------------------------//
/*
 * Copyright 2018, freeeasy-life.com
 * Released under the MIT License.
 *
 */
#ifndef  _MSDK_H
#define  _MSDK_H

#include <windows.h>

#ifdef __cplusplus
extern "C"{
#endif

/***********设备操作函数;以下函数中的m_hdl是指M_Open返回的句柄*******/
//打开端口获取句柄;  
//  Nbr是端口号，无论是双头模块还是单头模块，都是从1开始，依次为2/3/4...，最大126。电脑上插入一个就始终是1；插入n个 端口分别是1、2....n
//  使用M_Open接口打开默认vid pid的盒子
HANDLE WINAPI M_Open(int Nbr);
//使用M_Open_VidPid接口可以打开指定vid pid的单头盒子或者双头盒子的主控端。必须保证电脑上只插有一个这种盒子。
HANDLE WINAPI M_Open_VidPid(int Vid, int Pid);
//关闭端口；在程序退出前再关闭端口; 返回 0: 成功；!0: 失败
int WINAPI M_Close(HANDLE m_hdl);

//获取设备序列号
//     参数:
//         dwp_LenResponse: 设备序列号的长度(单位: 字节)
//         ucp_Response: 设备序列号buf(buf由调用该API的应用程序分配)
//     返回 0: 成功；-1: 失败
int WINAPI M_GetDevSn(HANDLE m_hdl, DWORD *dwp_LenResponse, unsigned char *ucp_Response);
//写用户数据
//     参数:
//         dwp_LenResponse: 数据长度(单位: 字节)，不能超过256字节
//         ucp_UserData   : 数据
//     返回 0: 成功；非0: 失败
int WINAPI M_SetUserData(HANDLE m_hdl, DWORD dw_LenUserData, unsigned char *ucp_UserData);
//验证用户数据 //参数定义同上
int WINAPI M_VerifyUserData(HANDLE m_hdl, DWORD dw_LenUserData, unsigned char *ucp_UserData);
//检查盒子是否是可修改盒子; 返回: 0:是可修改； 其他:不可修改
int WINAPI M_ChkSupportMdy(HANDLE m_hdl);
//设置新VID/PID
//  只支持可修改的单头、双头。普通单头、双头不支持
//     参数:
//         mVid: 主控端Vid;
//               不能是C216或C217或FFFF;
//               如果是0，表示mVid、mPid不需要更改; mPid的值将被忽略。
//               单头主控端Vid尾数必须是0 3 6 9 C F中其中一个数，如C300或C30C
//               双头主控端Vid尾数必须是1 4 7 A D中其中一个数，如C301或C30A
//         mPid: 主控端Pid;
//               如果mVid=0，该参数将被忽略;
//               不能是0000或FFFF
//         sVid: 被控端Vid; 
//               如果是单头，该参数将被忽略.
//               不能是C216或C217或FFFF;
//               如果是0，表示sVid、sPid不需要更改; sPid的值将被忽略。
//               双头被控端Vid尾数必须是2 5 8 B E中其中一个数，如C302或C30B
//         sVid: 被控端Pid; 
//               如果是单头，该参数将被忽略.
//               如果sVid=0，该参数将被忽略;
//               不能是0000或FFFF
//     返回  0: 成功；  
//           -2：该盒子不支持修改；
//           -10: mVID不符合规则  -11: mPID不符合规则
//           -20: sVID不符合规则  -21: sPID不符合规则
//           其他: 修改失败
int WINAPI M_SetNewVidPid(HANDLE m_hdl, int mVid, int mPid, int sVid, int sPid);
/***********键盘操作函数;以下函数中的m_hdl是指M_Open返回的句柄*******/
/***********以下所有命令返回 0: 成功；-1: 失败*******/
///////////以下接口采用的HidKeyCode是USB键盘的KeyCode，不是windows的KeyCode，新开发程序不建议再使用
//单击(按下后立刻弹起)按键  //HidKeyCode: 键盘码; Nbr: 按下次数
int WINAPI M_KeyPress(HANDLE m_hdl, int HidKeyCode, int Nbr);
//按下某个按键不弹起        //HidKeyCode: 键盘码
int WINAPI M_KeyDown(HANDLE m_hdl, int HidKeyCode);
//弹起某个按键              //HidKeyCode: 键盘码
int WINAPI M_KeyUp(HANDLE m_hdl, int HidKeyCode);
//读取按键状态              //HidKeyCode: 键盘码 //返回 0: 弹起状态；1:按下状态；-1: 失败(端口未打开)
//使用该接口，不允许手工操作键盘，否则该接口返回值有可能不正确
int WINAPI M_KeyState(HANDLE m_hdl, int HidKeyCode);
///////////以上接口采用的HidKeyCode是USB键盘的KeyCode，不是windows的KeyCode，新开发程序不建议再使用
///////////以下接口采用的KeyCode是windows的KeyCode，新开发程序建议再使用
//单击(按下后立刻弹起)按键  //KeyCode: 键盘码; Nbr: 按下次数
int WINAPI M_KeyPress2(HANDLE m_hdl, int KeyCode, int Nbr);
//按下某个按键不弹起        //KeyCode: 键盘码
int WINAPI M_KeyDown2(HANDLE m_hdl, int KeyCode);
//弹起某个按键              //KeyCode: 键盘码
int WINAPI M_KeyUp2(HANDLE m_hdl, int KeyCode);
//读取按键状态              //KeyCode: 键盘码 //返回 0: 弹起状态；1:按下状态；-1: 失败(端口未打开)
//使用该接口，不允许手工操作键盘，否则该接口返回值有可能不正确
int WINAPI M_KeyState2(HANDLE m_hdl, int KeyCode);
///////////以上接口采用的KeyCode是windows的KeyCode，新开发程序建议再使用
//弹起所有按键
int WINAPI M_ReleaseAllKey(HANDLE m_hdl);
//读取小键盘NumLock灯的状态 //返回 0:灭；1:亮；-1: 失败
int WINAPI M_NumLockLedState(HANDLE m_hdl);
//读取CapsLock灯的状态 //返回 0:灭；1:亮；-1: 失败
int WINAPI M_CapsLockLedState(HANDLE m_hdl);
//读取ScrollLock灯的状态 //返回 0:灭；1:亮；-1: 失败
int WINAPI M_ScrollLockLedState(HANDLE m_hdl);
//输入一串ASCII字符串，如"ABCdef012,.<>"，在InputLen个字节内将忽略非ASCII字符，  //InputStr: 输入缓冲区首地址; 注意：不支持解析\n\r等转义字符！ InputLen:输出的长度
int WINAPI M_KeyInputString(HANDLE m_hdl, char *InputStr, int InputLen);
/***********鼠标操作函数;以下函数中的m_hdl是指M_Open返回的句柄*******/
/***********以下所有命令返回 0: 成功；-1: 失败*******/
//左键单击   //Nbr: 左键在当前位置单击次数 
int WINAPI M_LeftClick(HANDLE m_hdl,int Nbr);
//左键双击   //Nbr: 左键在当前位置双击次数
int WINAPI M_LeftDoubleClick(HANDLE m_hdl,int Nbr);
//按下左键不弹起
int WINAPI M_LeftDown(HANDLE m_hdl);
//弹起左键
int WINAPI M_LeftUp(HANDLE m_hdl);
//右键单击   //Nbr: 左键在当前位置单击次数
int WINAPI M_RightClick(HANDLE m_hdl,int Nbr);
//按下右键不弹起
int WINAPI M_RightDown(HANDLE m_hdl);
//弹起右键
int WINAPI M_RightUp(HANDLE m_hdl);
//中键单击   //Nbr: 左键在当前位置单击次数
int WINAPI M_MiddleClick(HANDLE m_hdl,int Nbr);
//按下中键不弹起
int WINAPI M_MiddleDown(HANDLE m_hdl);
//弹起中键
int WINAPI M_MiddleUp(HANDLE m_hdl);
//弹起鼠标的所有按键
int WINAPI M_ReleaseAllMouse(HANDLE m_hdl);
//读取鼠标左中右键状态   //MouseKeyCode: 1=左键 2=右键 3=中键  //返回 0: 弹起状态；1:按下状态；-1: 失败
//只能读取盒子中鼠标的状态，读取不到实体鼠标的状态
int WINAPI M_MouseKeyState(HANDLE m_hdl, int MouseKeyCode);
//滚动鼠标滚轮;  Nbr: 滚动量,  为正,向上滚动；为负, 向下滚动;
int WINAPI M_MouseWheel(HANDLE m_hdl,int Nbr);
//将鼠标移动到原点(0,0)  在出现移动出现异常时，可以用该函数将鼠标复位
int WINAPI M_ResetMousePos(HANDLE m_hdl);
//从当前位置移动鼠标    x: x方向（横轴）的距离（正:向右; 负值:向左）; y: y方向（纵轴）的距离（正:向下; 负值:向上）
int WINAPI M_MoveR(HANDLE m_hdl,int x, int y);
//移动鼠标到指定坐标    x: x方向（横轴）的坐标; y: y方向（纵轴）的坐标。坐标原点(0, 0)在屏幕左上角
//注意：如果出现过将鼠标移动的距离超过屏幕大小，再次MoveTo可能会出现无法正确移动到指定坐标的问题，如果出现该问题，需调用ResetMousePos复位
int WINAPI M_MoveTo(HANDLE m_hdl,int x, int y);
//读取当前鼠标所在坐标  返回坐标在x、y中。 
//注意：该函数必须在执行一次MoveTo或ResetMousePos函数后才能正确执行！
//注意：如果曾经出现过将鼠标移动的距离超过屏幕大小，这里读取到的坐标值有可能是不正确的！如果出现该问题，需调用ResetMousePos复位
int WINAPI M_GetCurrMousePos(HANDLE m_hdl,int *x, int *y);
//返回当前鼠标坐标X值
int WINAPI M_GetCurrMousePosX(HANDLE m_hdl); //由于某些语言不支持指针，增加此接口
//返回当前鼠标坐标Y值
int WINAPI M_GetCurrMousePosY(HANDLE m_hdl); //由于某些语言不支持指针，增加此接口

////////以下接口仅适用主控机和被控机是同一台电脑的使用方式(单头模块；双头模块的两个USB头都连接到同一台电脑)
////////以下接口将调用系统的API来获取当前鼠标位置，DLL将不记录鼠标移动的位置
//移动鼠标到指定坐标    x: x方向（横轴）的坐标; y: y方向（纵轴）的坐标。
int WINAPI M_MoveR2(HANDLE m_hdl,int x, int y);
//移动鼠标到指定坐标    x: x方向（横轴）的坐标; y: y方向（纵轴）的坐标。坐标原点(0, 0)在屏幕左上角
int WINAPI M_MoveTo2(HANDLE m_hdl,int x, int y);
//读取当前鼠标所在坐标  返回坐标在x、y中。
int WINAPI M_GetCurrMousePos2(int *x, int *y);

////////以下接口将使用绝对移动功能。该功能目前还不能支持安卓
//输入被控机分辨率
//  在使用绝对移动功能前，必须先输入被控机的屏幕分辨率，打开端口获取句柄后，只需要调用一次该接口就可以
//  x: x方向（横轴）的坐标; y: y方向（纵轴）的坐标。坐标原点(0, 0)在屏幕左上角
//  返回值如果是-10，表示该盒子不支持绝对移动功能。返回0表示执行正确。可以用该接口判断盒子是否支持绝对移动功能
int WINAPI M_ResolutionUsed(HANDLE m_hdl, int x, int y);
//将鼠标移动到指定坐标。
//  绝对移动功能，鼠标移动到指定位置时，在某些坐标上最大会有±2的误差
//  使用该接口后，可以调用M_GetCurrMousePos读取鼠标位置
int WINAPI M_MoveTo3(HANDLE m_hdl, int x, int y);
/*******************通用操作函数****************************/
//延时指定时间  time:单位ms
int WINAPI M_Delay(int time);
//在指定的最小最大值之间延时随机时间  Min_time:最小延时时间; Max_time: 最大延时时间 （单位：ms）
int WINAPI M_DelayRandom(int Min_time, int Max_time);
//在最小最大值之间取随机数
int WINAPI M_RandDomNbr(int Min_V, int Max_V);

#ifdef __cplusplus
}
#endif
#endif