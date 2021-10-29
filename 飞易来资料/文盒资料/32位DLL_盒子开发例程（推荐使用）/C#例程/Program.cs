using System;
using System.Runtime.InteropServices;
using System.Text;

namespace M_dll_demo
{
    public class M_dll_demo
    {
        static void Main()
        {
            Console.WriteLine("|����������������������������������������������������������������������������|");
            Console.WriteLine("|                   C#����msdk DLL Demo����                               |");
            Console.WriteLine("| ��Demo���̽��ṩC#����msdk DLL�Ĳο�������������Ҫֱ��Ӧ���ڲ�Ʒ�����ϣ�|");
            Console.WriteLine("|����������������������������������������������������������������������������|");

            Console.WriteLine("\n1������M_Open��----------------");
            IntPtr M_Handle = msdk_DLL_Ifx.M_Open(1);//�����ǵ�ͷ��013Wģ�飬����˫ͷ��012WUģ�飬���Ǵ�1��ʼ�򿪣�����Ϊ2,3,4...
            if ((int)M_Handle == -1)
            {
                Console.WriteLine("���豸ʧ�ܣ�����USB�豸�Ƿ��Ѿ�����");
            }
            else
            {
                Console.WriteLine("���豸�ɹ�");
            }
            Console.WriteLine("\n2������M_MoveR��----------------");
            int CommRes = msdk_DLL_Ifx.M_MoveR(M_Handle, 100, -100);
            if (CommRes == 0)
            {
                Console.WriteLine("����ִ�гɹ�");
            }
            else
            {
                Console.WriteLine("����ִ��ʧ��");
            }

            Console.WriteLine("\n3������M_Close��----------------");
            if (msdk_DLL_Ifx.M_Close(M_Handle) == 0)
            {
                Console.WriteLine("�رն˿ڳɹ���");
            }
            else
            {
                Console.WriteLine("�رն˿�ʧ�ܣ�");
            }
            Console.WriteLine("\n\n************������س��˳�����************");
            Console.ReadLine();
        }
        public class msdk_DLL_Ifx
        {
            [DllImport("msdk.dll", EntryPoint = "M_Open", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern IntPtr M_Open(int port);
            [DllImport("msdk.dll", EntryPoint = "M_Open_VidPid", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern IntPtr M_Open_VidPid(int Vid, int Pid);

            [DllImport("msdk.dll", EntryPoint = "M_Close", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_Close(IntPtr m_hdl);
            
            //��ȡ�豸���к�
            [DllImport("msdk.dll", EntryPoint = "M_GetDevSn", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_GetDevSn(IntPtr m_hdl, ref int dwp_LenResponse, ref byte ucp_Response);

            //д���û�����
            [DllImport("msdk.dll", EntryPoint = "M_SetUserData", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_SetUserData(IntPtr m_hdl, int dw_LenUserData, ref byte ucp_UserData);
            //��֤�û�����
            [DllImport("msdk.dll", EntryPoint = "M_VerifyUserData", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_VerifyUserData(IntPtr m_hdl, int dw_LenUserData, ref byte ucp_UserData);

            //DLL�ڲ������ָ�Ĭ��ֵ
            [DllImport("msdk.dll", EntryPoint = "M_InitParam", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_InitParam(IntPtr m_hdl);
            //����DLL�ڲ�����
            [DllImport("msdk.dll", EntryPoint = "M_SetParam", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_SetParam(IntPtr m_hdl, int ParamType, int Param1, int Param2);
            
            /***********���̲�������;���º����е�m_hdl��ָM_Open���صľ��*******/
            /***********������������� 0: �ɹ���-1: ʧ��*******/
            //����(���º����̵���)����  //HidKeyCode: ������; Nbr: ���´���
            [DllImport("msdk.dll", EntryPoint = "M_KeyPress", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_KeyPress(IntPtr m_hdl, int HidKeyCode, int Nbr);
            //����ĳ������������        //HidKeyCode: ������
            [DllImport("msdk.dll", EntryPoint = "M_KeyDown", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_KeyDown(IntPtr m_hdl, int HidKeyCode);
            //����ĳ������              //HidKeyCode: ������
            [DllImport("msdk.dll", EntryPoint = "M_KeyUp", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_KeyUp(IntPtr m_hdl, int HidKeyCode);
            //��ȡ����״̬              //HidKeyCode: ������ //���� 0: ����״̬��1:����״̬��-1: ʧ��(�˿�δ��)
            //ʹ�øýӿڣ��������ֹ��������̣�����ýӿڷ���ֵ�п��ܲ���ȷ
            [DllImport("msdk.dll", EntryPoint = "M_KeyState", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_KeyState(IntPtr m_hdl, int HidKeyCode);

            //����(���º����̵���)����  //KeyCode: ������; Nbr: ���´���
            [DllImport("msdk.dll", EntryPoint = "M_KeyPress2", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_KeyPress2(IntPtr m_hdl, int KeyCode, int Nbr);
            //����ĳ������������        //KeyCode: ������
            [DllImport("msdk.dll", EntryPoint = "M_KeyDown2", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_KeyDown2(IntPtr m_hdl, int KeyCode);
            //����ĳ������              //KeyCode: ������
            [DllImport("msdk.dll", EntryPoint = "M_KeyUp2", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_KeyUp2(IntPtr m_hdl, int KeyCode);
            //��ȡ����״̬              //KeyCode: ������ //���� 0: ����״̬��1:����״̬��-1: ʧ��(�˿�δ��)
            //ʹ�øýӿڣ��������ֹ��������̣�����ýӿڷ���ֵ�п��ܲ���ȷ
            [DllImport("msdk.dll", EntryPoint = "M_KeyState2", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_KeyState2(IntPtr m_hdl, int KeyCode);
            
            //�������а���
            [DllImport("msdk.dll", EntryPoint = "M_ReleaseAllKey", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_ReleaseAllKey(IntPtr m_hdl);
            
            //��ȡС����NumLock�Ƶ�״̬ //���� 0:��1:����-1: ʧ��
            [DllImport("msdk.dll", EntryPoint = "M_NumLockLedState", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_NumLockLedState(IntPtr m_hdl);
            //��ȡCapsLock�Ƶ�״̬ //���� 0:��1:����-1: ʧ��
            [DllImport("msdk.dll", EntryPoint = "M_CapsLockLedState", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_CapsLockLedState(IntPtr m_hdl);
            //��ȡScrollLock�Ƶ�״̬ //���� 0:��1:����-1: ʧ��
            [DllImport("msdk.dll", EntryPoint = "M_ScrollLockLedState", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_ScrollLockLedState(IntPtr m_hdl);

            //����һ��ASCII�ַ�������"ABCdef012,.<>"����InputLen���ֽ��ڽ����Է�ASCII�ַ���  //InputStr: ���뻺�����׵�ַ; ע
            [DllImport("msdk.dll", EntryPoint = "M_KeyInputString", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_KeyInputString(IntPtr m_hdl, ref byte InputStr, int InputLen);
            
            //����һ���ַ�����֧������(GBK����)Ӣ�Ļ�ϣ���"������ABCdef012,.<>"����InputLen���ֽ��ڽ����Է�ASCII�������ַ���  //InputStr: ���뻺�����׵�ַ; ע�⣺��֧�ֽ���\n\r��ת���ַ��� InputLen:����ĳ���
            [DllImport("msdk.dll", EntryPoint = "M_KeyInputStringGBK", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_KeyInputStringGBK(IntPtr m_hdl, ref byte InputStr, int InputLen);
            
            //����һ���ַ�����֧������(Unicode����)Ӣ�Ļ�ϣ���"������ABCdef012,.<>"����InputLen���ֽ��ڽ����Է�ASCII�������ַ���  //InputStr: ���뻺�����׵�ַ; ע�⣺��֧�ֽ���\n\r��ת���ַ��� InputLen:����ĳ���
            [DllImport("msdk.dll", EntryPoint = "M_KeyInputStringUnicode", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_KeyInputStringUnicode(IntPtr m_hdl, ref byte InputStr, int InputLen);

            /***********����������;���º����е�m_hdl��ָM_Open���صľ��*******/
            /***********������������� 0: �ɹ���-1: ʧ��*******/
            //�������   //Nbr: ����ڵ�ǰλ�õ������� 
            [DllImport("msdk.dll", EntryPoint = "M_LeftClick", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_LeftClick(IntPtr m_hdl,int Nbr);
            //���˫��   //Nbr: ����ڵ�ǰλ��˫������
            [DllImport("msdk.dll", EntryPoint = "M_LeftDoubleClick", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_LeftDoubleClick(IntPtr m_hdl,int Nbr);
            //�������������
            [DllImport("msdk.dll", EntryPoint = "M_LeftDown", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_LeftDown(IntPtr m_hdl);
            //�������
            [DllImport("msdk.dll", EntryPoint = "M_LeftUp", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_LeftUp(IntPtr m_hdl);
            //�Ҽ�����   //Nbr: ����ڵ�ǰλ�õ�������
            [DllImport("msdk.dll", EntryPoint = "M_RightClick", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_RightClick(IntPtr m_hdl,int Nbr);
            //�����Ҽ�������
            [DllImport("msdk.dll", EntryPoint = "M_RightDown", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_RightDown(IntPtr m_hdl);
            //�����Ҽ�
            [DllImport("msdk.dll", EntryPoint = "M_RightUp", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_RightUp(IntPtr m_hdl);
            //�м�����   //Nbr: ����ڵ�ǰλ�õ�������
            [DllImport("msdk.dll", EntryPoint = "M_MiddleClick", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_MiddleClick(IntPtr m_hdl,int Nbr);
            //�����м�������
            [DllImport("msdk.dll", EntryPoint = "M_MiddleDown", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_MiddleDown(IntPtr m_hdl);
            //�����м�
            [DllImport("msdk.dll", EntryPoint = "M_MiddleUp", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_MiddleUp(IntPtr m_hdl);
            //�����������а���
            [DllImport("msdk.dll", EntryPoint = "M_ReleaseAllMouse", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_ReleaseAllMouse(IntPtr m_hdl);
            //��ȡ��������Ҽ�״̬  //MouseKeyCode: 1=��� 2=�Ҽ� 3=�м�  //���� 0: ����״̬��1:����״̬��-1: ʧ��
            //ֻ�ܶ�ȡ����������״̬����ȡ����ʵ������״̬
            [DllImport("msdk.dll", EntryPoint = "M_MouseKeyState", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_MouseKeyState(IntPtr m_hdl,int MouseKeyCode);
            
            //����������;  Nbr: ������,  Ϊ��,���Ϲ�����Ϊ��, ���¹���;
            [DllImport("msdk.dll", EntryPoint = "M_MouseWheel", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_MouseWheel(IntPtr m_hdl,int Nbr);
            //������ƶ���ԭ��(0,0)  �ڳ����ƶ������쳣ʱ�������øú�������긴λ
            [DllImport("msdk.dll", EntryPoint = "M_ResetMousePos", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_ResetMousePos(IntPtr m_hdl);
            //�ӵ�ǰλ���ƶ����    x: x���򣨺��ᣩ�ľ��루��:����; ��ֵ:����; y: y�������ᣩ�ľ��루��:����; ��ֵ:���ϣ�
            [DllImport("msdk.dll", EntryPoint = "M_MoveR", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_MoveR(IntPtr M_hdl, int x, int y);
            //�ƶ���굽ָ������    x: x���򣨺��ᣩ������; y: y�������ᣩ�����ꡣ����ԭ��(0, 0)����Ļ���Ͻ�
            //ע�⣺������ֹ�������ƶ��ľ��볬����Ļ��С���ٴ�MoveTo���ܻ�����޷���ȷ�ƶ���ָ����������⣬������ָ����⣬�����ResetMousePos��λ
            [DllImport("msdk.dll", EntryPoint = "M_MoveTo", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_MoveTo(IntPtr m_hdl,int x, int y);
            //��ȡ��ǰ�����������  ����������x��y�С� 
            //ע�⣺�ú���������ִ��һ��MoveTo��ResetMousePos�����������ȷִ�У�
            //ע�⣺����������ֹ�������ƶ��ľ��볬����Ļ��С�������ȡ��������ֵ�п����ǲ���ȷ�ģ�������ָ����⣬�����ResetMousePos��λ
            [DllImport("msdk.dll", EntryPoint = "M_GetCurrMousePos", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_GetCurrMousePos(IntPtr m_hdl, ref int x,  ref int y);
            
            //���½ӿڽ��������ػ��ͱ��ػ���ͬһ̨���Ե�ʹ�÷�ʽ(��ͷģ�飻˫ͷģ�������USBͷ�����ӵ�ͬһ̨����)
            //���½ӿڽ�����ϵͳ��API����ȡ��ǰ���λ�ã�DLL������¼����ƶ���λ��
            //�ƶ���굽ָ������    x: x���򣨺��ᣩ������; y: y�������ᣩ�����ꡣ
            [DllImport("msdk.dll", EntryPoint = "M_MoveR2", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_MoveR2(IntPtr m_hdl,int x, int y);
            //�ƶ���굽ָ������    x: x���򣨺��ᣩ������; y: y�������ᣩ�����ꡣ����ԭ��(0, 0)����Ļ���Ͻ�
            [DllImport("msdk.dll", EntryPoint = "M_MoveTo2", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_MoveTo2(IntPtr m_hdl,int x, int y);
            //��ȡ��ǰ�����������  ����������x��y�С�
            [DllImport("msdk.dll", EntryPoint = "M_GetCurrMousePos2", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_GetCurrMousePos2(ref int x,  ref int y);

            //���½ӿڽ�ʹ�þ����ƶ����ܡ��ù���Ŀǰ������֧�ְ�׿
            //��ʹ�þ����ƶ�����ǰ�����������뱻�ػ�����Ļ�ֱ���
            //x: x���򣨺��ᣩ������; y: y�������ᣩ�����ꡣ����ԭ��(0, 0)����Ļ���Ͻ�
            //����ֵ�����-10����ʾ�ú��Ӳ�֧�־����ƶ����ܡ�����0��ʾִ����ȷ�������øýӿ��жϺ����Ƿ�֧�־����ƶ�����
            [DllImport("msdk.dll", EntryPoint = "M_ResolutionUsed", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_ResolutionUsed(IntPtr m_hdl,int x, int y);
            //������ƶ���ָ�����ꡣ�����ƶ����ܣ�����ƶ���ָ��λ��ʱ����ĳЩ�����������С�2�����
            //ʹ�øýӿں󣬿��Ե���M_GetCurrMousePos��ȡ���λ��
            [DllImport("msdk.dll", EntryPoint = "M_MoveTo3", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_MoveTo3(IntPtr m_hdl,int x, int y);
            /*******************ͨ�ò�������****************************/
            //��ʱָ��ʱ��  time:��λms
            [DllImport("msdk.dll", EntryPoint = "M_Delay", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_Delay(int time);
            //��ָ������С���ֵ֮����ʱ���ʱ��  Min_time:��С��ʱʱ��; Max_time: �����ʱʱ�� ����λ��ms��
            [DllImport("msdk.dll", EntryPoint = "M_DelayRandom", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_DelayRandom(int Min_time, int Max_time);
            //����С���ֵ֮��ȡ�����
            [DllImport("msdk.dll", EntryPoint = "M_RandDomNbr", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_RandDomNbr(int Min_V, int Max_V);
        }
    }
}