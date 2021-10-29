using System;
using System.Runtime.InteropServices;
using System.Text;

namespace M_dll_demo
{
    public class M_dll_demo
    {
        static void Main()
        {
            Console.WriteLine("|——————————————————————————————————————|");
            Console.WriteLine("|                   C#调用msdk DLL Demo例程                               |");
            Console.WriteLine("| 本Demo例程仅提供C#调用msdk DLL的参考方法，请您不要直接应用在产品开发上！|");
            Console.WriteLine("|——————————————————————————————————————|");

            Console.WriteLine("\n1、调用M_Open：----------------");
            IntPtr M_Handle = msdk_DLL_Ifx.M_Open(1);//不管是单头的013W模块，还是双头的012WU模块，都是从1开始打开，依次为2,3,4...
            if ((int)M_Handle == -1)
            {
                Console.WriteLine("打开设备失败，请检查USB设备是否已经插入");
            }
            else
            {
                Console.WriteLine("打开设备成功");
            }
            Console.WriteLine("\n2、调用M_MoveR：----------------");
            int CommRes = msdk_DLL_Ifx.M_MoveR(M_Handle, 100, -100);
            if (CommRes == 0)
            {
                Console.WriteLine("命令执行成功");
            }
            else
            {
                Console.WriteLine("命令执行失败");
            }

            Console.WriteLine("\n3、调用M_Close：----------------");
            if (msdk_DLL_Ifx.M_Close(M_Handle) == 0)
            {
                Console.WriteLine("关闭端口成功！");
            }
            else
            {
                Console.WriteLine("关闭端口失败！");
            }
            Console.WriteLine("\n\n************请输入回车退出程序************");
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
            
            //获取设备序列号
            [DllImport("msdk.dll", EntryPoint = "M_GetDevSn", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_GetDevSn(IntPtr m_hdl, ref int dwp_LenResponse, ref byte ucp_Response);

            //写入用户数据
            [DllImport("msdk.dll", EntryPoint = "M_SetUserData", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_SetUserData(IntPtr m_hdl, int dw_LenUserData, ref byte ucp_UserData);
            //验证用户数据
            [DllImport("msdk.dll", EntryPoint = "M_VerifyUserData", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_VerifyUserData(IntPtr m_hdl, int dw_LenUserData, ref byte ucp_UserData);

            //DLL内部参数恢复默认值
            [DllImport("msdk.dll", EntryPoint = "M_InitParam", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_InitParam(IntPtr m_hdl);
            //设置DLL内部参数
            [DllImport("msdk.dll", EntryPoint = "M_SetParam", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_SetParam(IntPtr m_hdl, int ParamType, int Param1, int Param2);
            
            /***********键盘操作函数;以下函数中的m_hdl是指M_Open返回的句柄*******/
            /***********以下所有命令返回 0: 成功；-1: 失败*******/
            //单击(按下后立刻弹起)按键  //HidKeyCode: 键盘码; Nbr: 按下次数
            [DllImport("msdk.dll", EntryPoint = "M_KeyPress", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_KeyPress(IntPtr m_hdl, int HidKeyCode, int Nbr);
            //按下某个按键不弹起        //HidKeyCode: 键盘码
            [DllImport("msdk.dll", EntryPoint = "M_KeyDown", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_KeyDown(IntPtr m_hdl, int HidKeyCode);
            //弹起某个按键              //HidKeyCode: 键盘码
            [DllImport("msdk.dll", EntryPoint = "M_KeyUp", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_KeyUp(IntPtr m_hdl, int HidKeyCode);
            //读取按键状态              //HidKeyCode: 键盘码 //返回 0: 弹起状态；1:按下状态；-1: 失败(端口未打开)
            //使用该接口，不允许手工操作键盘，否则该接口返回值有可能不正确
            [DllImport("msdk.dll", EntryPoint = "M_KeyState", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_KeyState(IntPtr m_hdl, int HidKeyCode);

            //单击(按下后立刻弹起)按键  //KeyCode: 键盘码; Nbr: 按下次数
            [DllImport("msdk.dll", EntryPoint = "M_KeyPress2", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_KeyPress2(IntPtr m_hdl, int KeyCode, int Nbr);
            //按下某个按键不弹起        //KeyCode: 键盘码
            [DllImport("msdk.dll", EntryPoint = "M_KeyDown2", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_KeyDown2(IntPtr m_hdl, int KeyCode);
            //弹起某个按键              //KeyCode: 键盘码
            [DllImport("msdk.dll", EntryPoint = "M_KeyUp2", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_KeyUp2(IntPtr m_hdl, int KeyCode);
            //读取按键状态              //KeyCode: 键盘码 //返回 0: 弹起状态；1:按下状态；-1: 失败(端口未打开)
            //使用该接口，不允许手工操作键盘，否则该接口返回值有可能不正确
            [DllImport("msdk.dll", EntryPoint = "M_KeyState2", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_KeyState2(IntPtr m_hdl, int KeyCode);
            
            //弹起所有按键
            [DllImport("msdk.dll", EntryPoint = "M_ReleaseAllKey", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_ReleaseAllKey(IntPtr m_hdl);
            
            //读取小键盘NumLock灯的状态 //返回 0:灭；1:亮；-1: 失败
            [DllImport("msdk.dll", EntryPoint = "M_NumLockLedState", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_NumLockLedState(IntPtr m_hdl);
            //读取CapsLock灯的状态 //返回 0:灭；1:亮；-1: 失败
            [DllImport("msdk.dll", EntryPoint = "M_CapsLockLedState", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_CapsLockLedState(IntPtr m_hdl);
            //读取ScrollLock灯的状态 //返回 0:灭；1:亮；-1: 失败
            [DllImport("msdk.dll", EntryPoint = "M_ScrollLockLedState", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_ScrollLockLedState(IntPtr m_hdl);

            //输入一串ASCII字符串，如"ABCdef012,.<>"，在InputLen个字节内将忽略非ASCII字符，  //InputStr: 输入缓冲区首地址; 注
            [DllImport("msdk.dll", EntryPoint = "M_KeyInputString", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_KeyInputString(IntPtr m_hdl, ref byte InputStr, int InputLen);
            
            //输入一串字符串，支持中文(GBK编码)英文混合，如"啊啊啊ABCdef012,.<>"，在InputLen个字节内将忽略非ASCII和中文字符，  //InputStr: 输入缓冲区首地址; 注意：不支持解析\n\r等转义字符！ InputLen:输出的长度
            [DllImport("msdk.dll", EntryPoint = "M_KeyInputStringGBK", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_KeyInputStringGBK(IntPtr m_hdl, ref byte InputStr, int InputLen);
            
            //输入一串字符串，支持中文(Unicode编码)英文混合，如"啊啊啊ABCdef012,.<>"，在InputLen个字节内将忽略非ASCII和中文字符，  //InputStr: 输入缓冲区首地址; 注意：不支持解析\n\r等转义字符！ InputLen:输出的长度
            [DllImport("msdk.dll", EntryPoint = "M_KeyInputStringUnicode", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_KeyInputStringUnicode(IntPtr m_hdl, ref byte InputStr, int InputLen);

            /***********鼠标操作函数;以下函数中的m_hdl是指M_Open返回的句柄*******/
            /***********以下所有命令返回 0: 成功；-1: 失败*******/
            //左键单击   //Nbr: 左键在当前位置单击次数 
            [DllImport("msdk.dll", EntryPoint = "M_LeftClick", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_LeftClick(IntPtr m_hdl,int Nbr);
            //左键双击   //Nbr: 左键在当前位置双击次数
            [DllImport("msdk.dll", EntryPoint = "M_LeftDoubleClick", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_LeftDoubleClick(IntPtr m_hdl,int Nbr);
            //按下左键不弹起
            [DllImport("msdk.dll", EntryPoint = "M_LeftDown", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_LeftDown(IntPtr m_hdl);
            //弹起左键
            [DllImport("msdk.dll", EntryPoint = "M_LeftUp", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_LeftUp(IntPtr m_hdl);
            //右键单击   //Nbr: 左键在当前位置单击次数
            [DllImport("msdk.dll", EntryPoint = "M_RightClick", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_RightClick(IntPtr m_hdl,int Nbr);
            //按下右键不弹起
            [DllImport("msdk.dll", EntryPoint = "M_RightDown", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_RightDown(IntPtr m_hdl);
            //弹起右键
            [DllImport("msdk.dll", EntryPoint = "M_RightUp", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_RightUp(IntPtr m_hdl);
            //中键单击   //Nbr: 左键在当前位置单击次数
            [DllImport("msdk.dll", EntryPoint = "M_MiddleClick", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_MiddleClick(IntPtr m_hdl,int Nbr);
            //按下中键不弹起
            [DllImport("msdk.dll", EntryPoint = "M_MiddleDown", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_MiddleDown(IntPtr m_hdl);
            //弹起中键
            [DllImport("msdk.dll", EntryPoint = "M_MiddleUp", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_MiddleUp(IntPtr m_hdl);
            //弹起鼠标的所有按键
            [DllImport("msdk.dll", EntryPoint = "M_ReleaseAllMouse", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_ReleaseAllMouse(IntPtr m_hdl);
            //读取鼠标左中右键状态  //MouseKeyCode: 1=左键 2=右键 3=中键  //返回 0: 弹起状态；1:按下状态；-1: 失败
            //只能读取盒子中鼠标的状态，读取不到实体鼠标的状态
            [DllImport("msdk.dll", EntryPoint = "M_MouseKeyState", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_MouseKeyState(IntPtr m_hdl,int MouseKeyCode);
            
            //滚动鼠标滚轮;  Nbr: 滚动量,  为正,向上滚动；为负, 向下滚动;
            [DllImport("msdk.dll", EntryPoint = "M_MouseWheel", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_MouseWheel(IntPtr m_hdl,int Nbr);
            //将鼠标移动到原点(0,0)  在出现移动出现异常时，可以用该函数将鼠标复位
            [DllImport("msdk.dll", EntryPoint = "M_ResetMousePos", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_ResetMousePos(IntPtr m_hdl);
            //从当前位置移动鼠标    x: x方向（横轴）的距离（正:向右; 负值:向左）; y: y方向（纵轴）的距离（正:向下; 负值:向上）
            [DllImport("msdk.dll", EntryPoint = "M_MoveR", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_MoveR(IntPtr M_hdl, int x, int y);
            //移动鼠标到指定坐标    x: x方向（横轴）的坐标; y: y方向（纵轴）的坐标。坐标原点(0, 0)在屏幕左上角
            //注意：如果出现过将鼠标移动的距离超过屏幕大小，再次MoveTo可能会出现无法正确移动到指定坐标的问题，如果出现该问题，需调用ResetMousePos复位
            [DllImport("msdk.dll", EntryPoint = "M_MoveTo", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_MoveTo(IntPtr m_hdl,int x, int y);
            //读取当前鼠标所在坐标  返回坐标在x、y中。 
            //注意：该函数必须在执行一次MoveTo或ResetMousePos函数后才能正确执行！
            //注意：如果曾经出现过将鼠标移动的距离超过屏幕大小，这里读取到的坐标值有可能是不正确的！如果出现该问题，需调用ResetMousePos复位
            [DllImport("msdk.dll", EntryPoint = "M_GetCurrMousePos", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_GetCurrMousePos(IntPtr m_hdl, ref int x,  ref int y);
            
            //以下接口仅适用主控机和被控机是同一台电脑的使用方式(单头模块；双头模块的两个USB头都连接到同一台电脑)
            //以下接口将调用系统的API来获取当前鼠标位置，DLL将不记录鼠标移动的位置
            //移动鼠标到指定坐标    x: x方向（横轴）的坐标; y: y方向（纵轴）的坐标。
            [DllImport("msdk.dll", EntryPoint = "M_MoveR2", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_MoveR2(IntPtr m_hdl,int x, int y);
            //移动鼠标到指定坐标    x: x方向（横轴）的坐标; y: y方向（纵轴）的坐标。坐标原点(0, 0)在屏幕左上角
            [DllImport("msdk.dll", EntryPoint = "M_MoveTo2", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_MoveTo2(IntPtr m_hdl,int x, int y);
            //读取当前鼠标所在坐标  返回坐标在x、y中。
            [DllImport("msdk.dll", EntryPoint = "M_GetCurrMousePos2", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_GetCurrMousePos2(ref int x,  ref int y);

            //以下接口将使用绝对移动功能。该功能目前还不能支持安卓
            //在使用绝对移动功能前，必须先输入被控机的屏幕分辨率
            //x: x方向（横轴）的坐标; y: y方向（纵轴）的坐标。坐标原点(0, 0)在屏幕左上角
            //返回值如果是-10，表示该盒子不支持绝对移动功能。返回0表示执行正确。可以用该接口判断盒子是否支持绝对移动功能
            [DllImport("msdk.dll", EntryPoint = "M_ResolutionUsed", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_ResolutionUsed(IntPtr m_hdl,int x, int y);
            //将鼠标移动到指定坐标。绝对移动功能，鼠标移动到指定位置时，在某些坐标上最大会有±2的误差
            //使用该接口后，可以调用M_GetCurrMousePos读取鼠标位置
            [DllImport("msdk.dll", EntryPoint = "M_MoveTo3", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_MoveTo3(IntPtr m_hdl,int x, int y);
            /*******************通用操作函数****************************/
            //延时指定时间  time:单位ms
            [DllImport("msdk.dll", EntryPoint = "M_Delay", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_Delay(int time);
            //在指定的最小最大值之间延时随机时间  Min_time:最小延时时间; Max_time: 最大延时时间 （单位：ms）
            [DllImport("msdk.dll", EntryPoint = "M_DelayRandom", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_DelayRandom(int Min_time, int Max_time);
            //在最小最大值之间取随机数
            [DllImport("msdk.dll", EntryPoint = "M_RandDomNbr", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
            public static extern int M_RandDomNbr(int Min_V, int Max_V);
        }
    }
}