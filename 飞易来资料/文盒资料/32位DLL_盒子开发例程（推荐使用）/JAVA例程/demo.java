public class demo{
    public static void main(String[] args){
        msdkDllBridge Dev = new msdkDllBridge();
        int Hdl = Dev.M_Open(1);
        System.out.printf("OpenPort result = %d, 0x%x\n", Hdl, Hdl);
        if (Hdl <= 0) {
            System.out.printf("OpenPort Error\n");
            return;
        }
        byte[] DataBuf = new byte[256];
        int CmdRes;
        //����
        Dev.M_DelayRandom(600, 1000);//��ʱֻ��Ϊ�˷���debug
        Dev.M_KeyPress(Hdl, 4, 1); //����һ��a
        String str = "Java demo";//java��string����unicode
        DataBuf = str.getBytes(); //Ҫȡ�÷�unicode��ascii����
        Dev.M_KeyInputString(Hdl, DataBuf, 9);
        //���
        int[] x = new int[1];  //javaû��ָ�룬�������������
        int[] y = new int[1];  //javaû��ָ�룬�������������
        Dev.M_GetCurrMousePos2(x, y);
        System.out.printf("M_GetCurrMousePos2 result = %d, %d\n", x[0], y[0]);
        Dev.M_MoveTo(Hdl, 100, 100);

        int res = Dev.M_Close(Hdl);
        System.out.println("ClosePort res = " + res);
    }
}