//------------------------------------------------------------------------------//
//          �����������Ƽ����޹�˾                                              //
//    Ӳ��ģ��������ģ��Ӧ�ñ�̽ӿ�(API)˵��                                 //
//                                                                              //
//    ��API������                                                               //
//    1. ˫ͷ012WUģ��                                                          //
//    2. ��ͷ013Wģ��                                                           //
//    3. windows2000������32/64λ����ϵͳ                                       //
//                                                                              //
//    ��ϸ���½�����������Ƽ����޹�˾�ٷ���վhttp://freeeasy-life.com          //
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

/***********�豸��������;���º����е�m_hdl��ָM_Open���صľ��*******/
//�򿪶˿ڻ�ȡ���;  
//  Nbr�Ƕ˿ںţ�������˫ͷģ�黹�ǵ�ͷģ�飬���Ǵ�1��ʼ������Ϊ2/3/4...�����126�������ϲ���һ����ʼ����1������n�� �˿ڷֱ���1��2....n
//  ʹ��M_Open�ӿڴ�Ĭ��vid pid�ĺ���
HANDLE WINAPI M_Open(int Nbr);
//ʹ��M_Open_VidPid�ӿڿ��Դ�ָ��vid pid�ĵ�ͷ���ӻ���˫ͷ���ӵ����ضˡ����뱣֤������ֻ����һ�����ֺ��ӡ�
HANDLE WINAPI M_Open_VidPid(int Vid, int Pid);
//�رն˿ڣ��ڳ����˳�ǰ�ٹرն˿�; ���� 0: �ɹ���!0: ʧ��
int WINAPI M_Close(HANDLE m_hdl);

//��ȡ�豸���к�
//     ����:
//         dwp_LenResponse: �豸���кŵĳ���(��λ: �ֽ�)
//         ucp_Response: �豸���к�buf(buf�ɵ��ø�API��Ӧ�ó������)
//     ���� 0: �ɹ���-1: ʧ��
int WINAPI M_GetDevSn(HANDLE m_hdl, DWORD *dwp_LenResponse, unsigned char *ucp_Response);
//д�û�����
//     ����:
//         dwp_LenResponse: ���ݳ���(��λ: �ֽ�)�����ܳ���256�ֽ�
//         ucp_UserData   : ����
//     ���� 0: �ɹ�����0: ʧ��
int WINAPI M_SetUserData(HANDLE m_hdl, DWORD dw_LenUserData, unsigned char *ucp_UserData);
//��֤�û����� //��������ͬ��
int WINAPI M_VerifyUserData(HANDLE m_hdl, DWORD dw_LenUserData, unsigned char *ucp_UserData);
//�������Ƿ��ǿ��޸ĺ���; ����: 0:�ǿ��޸ģ� ����:�����޸�
int WINAPI M_ChkSupportMdy(HANDLE m_hdl);
//������VID/PID
//  ֻ֧�ֿ��޸ĵĵ�ͷ��˫ͷ����ͨ��ͷ��˫ͷ��֧��
//     ����:
//         mVid: ���ض�Vid;
//               ������C216��C217��FFFF;
//               �����0����ʾmVid��mPid����Ҫ����; mPid��ֵ�������ԡ�
//               ��ͷ���ض�Vidβ��������0 3 6 9 C F������һ��������C300��C30C
//               ˫ͷ���ض�Vidβ��������1 4 7 A D������һ��������C301��C30A
//         mPid: ���ض�Pid;
//               ���mVid=0���ò�����������;
//               ������0000��FFFF
//         sVid: ���ض�Vid; 
//               ����ǵ�ͷ���ò�����������.
//               ������C216��C217��FFFF;
//               �����0����ʾsVid��sPid����Ҫ����; sPid��ֵ�������ԡ�
//               ˫ͷ���ض�Vidβ��������2 5 8 B E������һ��������C302��C30B
//         sVid: ���ض�Pid; 
//               ����ǵ�ͷ���ò�����������.
//               ���sVid=0���ò�����������;
//               ������0000��FFFF
//     ����  0: �ɹ���  
//           -2���ú��Ӳ�֧���޸ģ�
//           -10: mVID�����Ϲ���  -11: mPID�����Ϲ���
//           -20: sVID�����Ϲ���  -21: sPID�����Ϲ���
//           ����: �޸�ʧ��
int WINAPI M_SetNewVidPid(HANDLE m_hdl, int mVid, int mPid, int sVid, int sPid);
/***********���̲�������;���º����е�m_hdl��ָM_Open���صľ��*******/
/***********������������� 0: �ɹ���-1: ʧ��*******/
///////////���½ӿڲ��õ�HidKeyCode��USB���̵�KeyCode������windows��KeyCode���¿������򲻽�����ʹ��
//����(���º����̵���)����  //HidKeyCode: ������; Nbr: ���´���
int WINAPI M_KeyPress(HANDLE m_hdl, int HidKeyCode, int Nbr);
//����ĳ������������        //HidKeyCode: ������
int WINAPI M_KeyDown(HANDLE m_hdl, int HidKeyCode);
//����ĳ������              //HidKeyCode: ������
int WINAPI M_KeyUp(HANDLE m_hdl, int HidKeyCode);
//��ȡ����״̬              //HidKeyCode: ������ //���� 0: ����״̬��1:����״̬��-1: ʧ��(�˿�δ��)
//ʹ�øýӿڣ��������ֹ��������̣�����ýӿڷ���ֵ�п��ܲ���ȷ
int WINAPI M_KeyState(HANDLE m_hdl, int HidKeyCode);
///////////���Ͻӿڲ��õ�HidKeyCode��USB���̵�KeyCode������windows��KeyCode���¿������򲻽�����ʹ��
///////////���½ӿڲ��õ�KeyCode��windows��KeyCode���¿�����������ʹ��
//����(���º����̵���)����  //KeyCode: ������; Nbr: ���´���
int WINAPI M_KeyPress2(HANDLE m_hdl, int KeyCode, int Nbr);
//����ĳ������������        //KeyCode: ������
int WINAPI M_KeyDown2(HANDLE m_hdl, int KeyCode);
//����ĳ������              //KeyCode: ������
int WINAPI M_KeyUp2(HANDLE m_hdl, int KeyCode);
//��ȡ����״̬              //KeyCode: ������ //���� 0: ����״̬��1:����״̬��-1: ʧ��(�˿�δ��)
//ʹ�øýӿڣ��������ֹ��������̣�����ýӿڷ���ֵ�п��ܲ���ȷ
int WINAPI M_KeyState2(HANDLE m_hdl, int KeyCode);
///////////���Ͻӿڲ��õ�KeyCode��windows��KeyCode���¿�����������ʹ��
//�������а���
int WINAPI M_ReleaseAllKey(HANDLE m_hdl);
//��ȡС����NumLock�Ƶ�״̬ //���� 0:��1:����-1: ʧ��
int WINAPI M_NumLockLedState(HANDLE m_hdl);
//��ȡCapsLock�Ƶ�״̬ //���� 0:��1:����-1: ʧ��
int WINAPI M_CapsLockLedState(HANDLE m_hdl);
//��ȡScrollLock�Ƶ�״̬ //���� 0:��1:����-1: ʧ��
int WINAPI M_ScrollLockLedState(HANDLE m_hdl);
//����һ��ASCII�ַ�������"ABCdef012,.<>"����InputLen���ֽ��ڽ����Է�ASCII�ַ���  //InputStr: ���뻺�����׵�ַ; ע�⣺��֧�ֽ���\n\r��ת���ַ��� InputLen:����ĳ���
int WINAPI M_KeyInputString(HANDLE m_hdl, char *InputStr, int InputLen);
/***********����������;���º����е�m_hdl��ָM_Open���صľ��*******/
/***********������������� 0: �ɹ���-1: ʧ��*******/
//�������   //Nbr: ����ڵ�ǰλ�õ������� 
int WINAPI M_LeftClick(HANDLE m_hdl,int Nbr);
//���˫��   //Nbr: ����ڵ�ǰλ��˫������
int WINAPI M_LeftDoubleClick(HANDLE m_hdl,int Nbr);
//�������������
int WINAPI M_LeftDown(HANDLE m_hdl);
//�������
int WINAPI M_LeftUp(HANDLE m_hdl);
//�Ҽ�����   //Nbr: ����ڵ�ǰλ�õ�������
int WINAPI M_RightClick(HANDLE m_hdl,int Nbr);
//�����Ҽ�������
int WINAPI M_RightDown(HANDLE m_hdl);
//�����Ҽ�
int WINAPI M_RightUp(HANDLE m_hdl);
//�м�����   //Nbr: ����ڵ�ǰλ�õ�������
int WINAPI M_MiddleClick(HANDLE m_hdl,int Nbr);
//�����м�������
int WINAPI M_MiddleDown(HANDLE m_hdl);
//�����м�
int WINAPI M_MiddleUp(HANDLE m_hdl);
//�����������а���
int WINAPI M_ReleaseAllMouse(HANDLE m_hdl);
//��ȡ��������Ҽ�״̬   //MouseKeyCode: 1=��� 2=�Ҽ� 3=�м�  //���� 0: ����״̬��1:����״̬��-1: ʧ��
//ֻ�ܶ�ȡ����������״̬����ȡ����ʵ������״̬
int WINAPI M_MouseKeyState(HANDLE m_hdl, int MouseKeyCode);
//����������;  Nbr: ������,  Ϊ��,���Ϲ�����Ϊ��, ���¹���;
int WINAPI M_MouseWheel(HANDLE m_hdl,int Nbr);
//������ƶ���ԭ��(0,0)  �ڳ����ƶ������쳣ʱ�������øú�������긴λ
int WINAPI M_ResetMousePos(HANDLE m_hdl);
//�ӵ�ǰλ���ƶ����    x: x���򣨺��ᣩ�ľ��루��:����; ��ֵ:����; y: y�������ᣩ�ľ��루��:����; ��ֵ:���ϣ�
int WINAPI M_MoveR(HANDLE m_hdl,int x, int y);
//�ƶ���굽ָ������    x: x���򣨺��ᣩ������; y: y�������ᣩ�����ꡣ����ԭ��(0, 0)����Ļ���Ͻ�
//ע�⣺������ֹ�������ƶ��ľ��볬����Ļ��С���ٴ�MoveTo���ܻ�����޷���ȷ�ƶ���ָ����������⣬������ָ����⣬�����ResetMousePos��λ
int WINAPI M_MoveTo(HANDLE m_hdl,int x, int y);
//��ȡ��ǰ�����������  ����������x��y�С� 
//ע�⣺�ú���������ִ��һ��MoveTo��ResetMousePos�����������ȷִ�У�
//ע�⣺����������ֹ�������ƶ��ľ��볬����Ļ��С�������ȡ��������ֵ�п����ǲ���ȷ�ģ�������ָ����⣬�����ResetMousePos��λ
int WINAPI M_GetCurrMousePos(HANDLE m_hdl,int *x, int *y);
//���ص�ǰ�������Xֵ
int WINAPI M_GetCurrMousePosX(HANDLE m_hdl); //����ĳЩ���Բ�֧��ָ�룬���Ӵ˽ӿ�
//���ص�ǰ�������Yֵ
int WINAPI M_GetCurrMousePosY(HANDLE m_hdl); //����ĳЩ���Բ�֧��ָ�룬���Ӵ˽ӿ�

////////���½ӿڽ��������ػ��ͱ��ػ���ͬһ̨���Ե�ʹ�÷�ʽ(��ͷģ�飻˫ͷģ�������USBͷ�����ӵ�ͬһ̨����)
////////���½ӿڽ�����ϵͳ��API����ȡ��ǰ���λ�ã�DLL������¼����ƶ���λ��
//�ƶ���굽ָ������    x: x���򣨺��ᣩ������; y: y�������ᣩ�����ꡣ
int WINAPI M_MoveR2(HANDLE m_hdl,int x, int y);
//�ƶ���굽ָ������    x: x���򣨺��ᣩ������; y: y�������ᣩ�����ꡣ����ԭ��(0, 0)����Ļ���Ͻ�
int WINAPI M_MoveTo2(HANDLE m_hdl,int x, int y);
//��ȡ��ǰ�����������  ����������x��y�С�
int WINAPI M_GetCurrMousePos2(int *x, int *y);

////////���½ӿڽ�ʹ�þ����ƶ����ܡ��ù���Ŀǰ������֧�ְ�׿
//���뱻�ػ��ֱ���
//  ��ʹ�þ����ƶ�����ǰ�����������뱻�ػ�����Ļ�ֱ��ʣ��򿪶˿ڻ�ȡ�����ֻ��Ҫ����һ�θýӿھͿ���
//  x: x���򣨺��ᣩ������; y: y�������ᣩ�����ꡣ����ԭ��(0, 0)����Ļ���Ͻ�
//  ����ֵ�����-10����ʾ�ú��Ӳ�֧�־����ƶ����ܡ�����0��ʾִ����ȷ�������øýӿ��жϺ����Ƿ�֧�־����ƶ�����
int WINAPI M_ResolutionUsed(HANDLE m_hdl, int x, int y);
//������ƶ���ָ�����ꡣ
//  �����ƶ����ܣ�����ƶ���ָ��λ��ʱ����ĳЩ�����������С�2�����
//  ʹ�øýӿں󣬿��Ե���M_GetCurrMousePos��ȡ���λ��
int WINAPI M_MoveTo3(HANDLE m_hdl, int x, int y);
/*******************ͨ�ò�������****************************/
//��ʱָ��ʱ��  time:��λms
int WINAPI M_Delay(int time);
//��ָ������С���ֵ֮����ʱ���ʱ��  Min_time:��С��ʱʱ��; Max_time: �����ʱʱ�� ����λ��ms��
int WINAPI M_DelayRandom(int Min_time, int Max_time);
//����С���ֵ֮��ȡ�����
int WINAPI M_RandDomNbr(int Min_V, int Max_V);

#ifdef __cplusplus
}
#endif
#endif