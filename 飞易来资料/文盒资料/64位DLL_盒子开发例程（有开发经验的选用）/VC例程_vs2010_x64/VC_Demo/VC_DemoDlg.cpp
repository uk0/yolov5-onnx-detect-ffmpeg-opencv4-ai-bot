
// VC_DemoDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "VC_Demo.h"
#include "VC_DemoDlg.h"
#include "afxdialogex.h"
#include "msdk.h"
#include "UsbHidKeyCode.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CVC_DemoDlg 对话框




CVC_DemoDlg::CVC_DemoDlg(CWnd* pParent /*=NULL*/)
	: CDialogEx(CVC_DemoDlg::IDD, pParent)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CVC_DemoDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CVC_DemoDlg, CDialogEx)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDOK, &CVC_DemoDlg::OnBnClickedOk)
	ON_BN_CLICKED(IDC_BUTTON_OPEN, &CVC_DemoDlg::OnBnClickedButtonOpen)
	ON_BN_CLICKED(IDC_BUTTON_CLOSE, &CVC_DemoDlg::OnBnClickedButtonClose)
	ON_BN_CLICKED(IDC_BUTTON_KEYPRESS, &CVC_DemoDlg::OnBnClickedButtonKeypress)
	ON_BN_CLICKED(IDC_BUTTON_MOVER, &CVC_DemoDlg::OnBnClickedButtonMover)
	ON_BN_CLICKED(IDC_BUTTON_MOVETO, &CVC_DemoDlg::OnBnClickedButtonMoveto)
	ON_BN_CLICKED(IDC_BUTTON_GETMOUSEPOS, &CVC_DemoDlg::OnBnClickedButtonGetmousepos)
END_MESSAGE_MAP()


// CVC_DemoDlg 消息处理程序

BOOL CVC_DemoDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// 设置此对话框的图标。当应用程序主窗口不是对话框时，框架将自动
	//  执行此操作
	SetIcon(m_hIcon, TRUE);			// 设置大图标
	SetIcon(m_hIcon, FALSE);		// 设置小图标

	// TODO: 在此添加额外的初始化代码
	msdk_handle = INVALID_HANDLE_VALUE;	//初始为未打开
	return TRUE;  // 除非将焦点设置到控件，否则返回 TRUE
}

// 如果向对话框添加最小化按钮，则需要下面的代码
//  来绘制该图标。对于使用文档/视图模型的 MFC 应用程序，
//  这将由框架自动完成。

void CVC_DemoDlg::OnPaint()
{
	if (IsIconic())
	{
		CPaintDC dc(this); // 用于绘制的设备上下文

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// 使图标在工作区矩形中居中
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// 绘制图标
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialogEx::OnPaint();
	}
}

//当用户拖动最小化窗口时系统调用此函数取得光标
//显示。
HCURSOR CVC_DemoDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}

void CVC_DemoDlg::OnBnClickedOk()
{
	// TODO: Add your control notification handler code here
}

void CVC_DemoDlg::OnBnClickedButtonOpen()
{
	CString l_Str;
	if (msdk_handle != INVALID_HANDLE_VALUE) {
		AfxMessageBox("端口已经打开，请关闭端口再重新打开");
	}
	msdk_handle=M_Open(1);
	if(msdk_handle == INVALID_HANDLE_VALUE){
		AfxMessageBox("端口打开失败，请确认您的USB设备已经插上电脑");
	}
	else {
		GetDlgItem(IDC_BUTTON_OPEN)->EnableWindow(false);
	}
}

void CVC_DemoDlg::OnBnClickedButtonClose()
{
	if (msdk_handle != INVALID_HANDLE_VALUE) {
		M_Close(msdk_handle);
		msdk_handle = INVALID_HANDLE_VALUE;
		GetDlgItem(IDC_BUTTON_OPEN)->EnableWindow(true);
	}
	else {
		AfxMessageBox("还未打开端口，请先打开端口");
	}
}

void CVC_DemoDlg::OnBnClickedButtonKeypress()
{
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

void CVC_DemoDlg::OnBnClickedButtonMover()
{
	if(msdk_handle == INVALID_HANDLE_VALUE) {
		AfxMessageBox("还未打开端口，请先打开端口");
		return;
	}
	unsigned int RetSw;
	RetSw = M_MoveR(msdk_handle,-100, 100);
}

void CVC_DemoDlg::OnBnClickedButtonMoveto()
{
	if(msdk_handle == INVALID_HANDLE_VALUE) {
		AfxMessageBox("还未打开端口，请先打开端口");
		return;
	}
	unsigned int RetSw;
	RetSw = M_MoveTo(msdk_handle,50, 100);
}

void CVC_DemoDlg::OnBnClickedButtonGetmousepos()
{
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
