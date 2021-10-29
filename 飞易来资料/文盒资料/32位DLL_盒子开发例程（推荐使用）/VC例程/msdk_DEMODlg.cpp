// msdk_DEMODlg.cpp : implementation file
//

#include "stdafx.h"
#include "msdk_DEMO.h"
#include "msdk_DEMODlg.h"
#include "msdk.h"
#include "UsbHidKeyCode.h"
#include <windows.h>
#include <math.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// Cmsdk_DEMODlg dialog

Cmsdk_DEMODlg::Cmsdk_DEMODlg(CWnd* pParent /*=NULL*/)
	: CDialog(Cmsdk_DEMODlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(Cmsdk_DEMODlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void Cmsdk_DEMODlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(Cmsdk_DEMODlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(Cmsdk_DEMODlg, CDialog)
	//{{AFX_MSG_MAP(Cmsdk_DEMODlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON_UIOPEN, OnButtonUIopen)
	ON_BN_CLICKED(IDC_BUTTON_UICLOSE, OnButtonUiclose)
	ON_BN_CLICKED(IDC_BUTTON_MOVER, OnButtonMoveR)
	ON_BN_CLICKED(IDC_BUTTON_MOVETO, OnButtonMoveTo)
	ON_BN_CLICKED(IDC_BUTTON_KEYPRESS, OnButtonKeypress)
	ON_BN_CLICKED(IDC_BUTTON_GETPOS, OnButtonGetpos)
	ON_BN_CLICKED(IDC_BUTTON_GETSN, OnButtonGetsn)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// Cmsdk_DEMODlg message handlers

BOOL Cmsdk_DEMODlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	// TODO: Add extra initialization here
	msdk_handle = INVALID_HANDLE_VALUE;	//初始为未打开
	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void Cmsdk_DEMODlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR Cmsdk_DEMODlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void Cmsdk_DEMODlg::OnButtonUIopen() 
{
	// TODO: Add your control notification handler code here
	CString l_Str;
	if (msdk_handle != INVALID_HANDLE_VALUE) {
		AfxMessageBox("端口已经打开，请关闭端口再重新打开");
	}
	msdk_handle=M_Open(1);
	if(msdk_handle == INVALID_HANDLE_VALUE){
		AfxMessageBox("端口打开失败，请确认您的USB设备已经插上电脑");
	}
	else {
		GetDlgItem(IDC_BUTTON_UIOPEN)->EnableWindow(false);
	}
}

void Cmsdk_DEMODlg::OnButtonUiclose() 
{
	// TODO: Add your control notification handler code here
	if (msdk_handle != INVALID_HANDLE_VALUE) {
		M_Close(msdk_handle);
		msdk_handle = INVALID_HANDLE_VALUE;
		GetDlgItem(IDC_BUTTON_UIOPEN)->EnableWindow(true);
	}
	else {
		AfxMessageBox("还未打开端口，请先打开端口");
	}
}

unsigned char * WINAPI CHexToBin(unsigned char *bin, unsigned char *asc,unsigned int len)
{
	unsigned char *npDest,ucChar;
	
	len=len/2+len%2;
	npDest=bin;
	while(len--){
		ucChar=(*asc<='9'&&*asc>='0')?*asc-'0':*asc-'A'+10;
		ucChar<<=4;
		asc++;
		ucChar|=((*asc<='9'&&*asc>='0')?*asc-'0':*asc-'A'+10)&0x0F;
		asc++;
		*bin++=ucChar;
	}
	return npDest;
}


unsigned char * WINAPI BinToCHex(unsigned char *asc, unsigned char *bin,unsigned int len)
{
	unsigned char *p=asc, *q=bin;
	
	while ( len-- ) {
		*p = ((*q)&0xf0)>>4;
		if (*p >= 10 ) *p+=('A'-10);
		else *p+='0';
		p++;
		*p = (*q)&0x0f;
		if (*p >= 10 ) *p+=('A'-10);
		else *p+='0';
		p++;
		q++;
	}
	*p=0;
	return asc;
}

void Cmsdk_DEMODlg::OnButtonMoveR() 
{
	// TODO: Add your control notification handler code here
	if(msdk_handle == INVALID_HANDLE_VALUE) {
		AfxMessageBox("还未打开端口，请先打开端口");
		return;
	}
	unsigned int RetSw;
	RetSw = M_MoveR(msdk_handle,-100, 100);
}

void Cmsdk_DEMODlg::OnButtonMoveTo() 
{
	// TODO: Add your control notification handler code here
	if(msdk_handle == INVALID_HANDLE_VALUE) {
		AfxMessageBox("还未打开端口，请先打开端口");
		return;
	}
	unsigned int RetSw;
	RetSw = M_MoveTo(msdk_handle,50, 100);
}

void Cmsdk_DEMODlg::OnButtonKeypress() 
{
	// TODO: Add your control notification handler code here
	if(msdk_handle == INVALID_HANDLE_VALUE) {
		AfxMessageBox("还未打开端口，请先打开端口");
		return;
	}
	unsigned int RetSw;
	RetSw = M_DelayRandom(800, 1000);
	RetSw = M_KeyPress(msdk_handle,Keyboard_a, 2);
	//ctrl+a  + delete
	RetSw = M_DelayRandom(800, 1000);
	RetSw = M_KeyDown(msdk_handle,Keyboard_LeftControl);
	RetSw = M_KeyDown(msdk_handle,Keyboard_a);
	RetSw = M_DelayRandom(500, 800);
	RetSw = M_KeyDown(msdk_handle,Keyboard_Delete);
	RetSw = M_DelayRandom(80, 200);
	RetSw = M_ReleaseAllKey(msdk_handle);
}


void Cmsdk_DEMODlg::OnButtonGetpos() 
{
	// TODO: Add your control notification handler code here
	if(msdk_handle == INVALID_HANDLE_VALUE) {
		AfxMessageBox("还未打开端口，请先打开端口");
		return;
	}
	CString strtemp;
	unsigned int RetSw;
	int x_pos, y_pos;
	RetSw = M_GetCurrMousePos(msdk_handle,&x_pos, &y_pos);
	if (RetSw != 0) {
		AfxMessageBox("获取鼠标坐标错误");
		return;
	}
	else {
		strtemp.Format("x=%d, y=%d",x_pos,y_pos);
		AfxMessageBox(strtemp);
	}
}

void Cmsdk_DEMODlg::OnButtonGetsn() 
{
	// TODO: Add your control notification handler code here
	DWORD dwp_LenResponse;
	unsigned char ucp_Response[256];
	unsigned int RetSw;
	CString strtemp;

	if(msdk_handle == INVALID_HANDLE_VALUE) {
		AfxMessageBox("还未打开端口，请先打开端口");
		return;
	}
	RetSw = M_GetDevSn(msdk_handle, &dwp_LenResponse, ucp_Response);
	if (RetSw != 0) {
		AfxMessageBox("获取序列号错误");
		return;
	}
	else {
		strtemp.Format("序列号长度=%d，已保存在ucp_Response数组里",dwp_LenResponse);
		AfxMessageBox(strtemp);
	}
}
