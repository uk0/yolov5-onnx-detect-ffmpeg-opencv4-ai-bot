
// VC_DemoDlg.cpp : ʵ���ļ�
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


// CVC_DemoDlg �Ի���




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


// CVC_DemoDlg ��Ϣ�������

BOOL CVC_DemoDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// ���ô˶Ի����ͼ�ꡣ��Ӧ�ó��������ڲ��ǶԻ���ʱ����ܽ��Զ�
	//  ִ�д˲���
	SetIcon(m_hIcon, TRUE);			// ���ô�ͼ��
	SetIcon(m_hIcon, FALSE);		// ����Сͼ��

	// TODO: �ڴ���Ӷ���ĳ�ʼ������
	msdk_handle = INVALID_HANDLE_VALUE;	//��ʼΪδ��
	return TRUE;  // ���ǽ��������õ��ؼ������򷵻� TRUE
}

// �����Ի��������С����ť������Ҫ����Ĵ���
//  �����Ƹ�ͼ�ꡣ����ʹ���ĵ�/��ͼģ�͵� MFC Ӧ�ó���
//  �⽫�ɿ���Զ���ɡ�

void CVC_DemoDlg::OnPaint()
{
	if (IsIconic())
	{
		CPaintDC dc(this); // ���ڻ��Ƶ��豸������

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// ʹͼ���ڹ����������о���
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// ����ͼ��
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialogEx::OnPaint();
	}
}

//���û��϶���С������ʱϵͳ���ô˺���ȡ�ù��
//��ʾ��
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
		AfxMessageBox("�˿��Ѿ��򿪣���رն˿������´�");
	}
	msdk_handle=M_Open(1);
	if(msdk_handle == INVALID_HANDLE_VALUE){
		AfxMessageBox("�˿ڴ�ʧ�ܣ���ȷ������USB�豸�Ѿ����ϵ���");
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
		AfxMessageBox("��δ�򿪶˿ڣ����ȴ򿪶˿�");
	}
}

void CVC_DemoDlg::OnBnClickedButtonKeypress()
{
	if(msdk_handle == INVALID_HANDLE_VALUE) {
		AfxMessageBox("��δ�򿪶˿ڣ����ȴ򿪶˿�");
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
		AfxMessageBox("��δ�򿪶˿ڣ����ȴ򿪶˿�");
		return;
	}
	unsigned int RetSw;
	RetSw = M_MoveR(msdk_handle,-100, 100);
}

void CVC_DemoDlg::OnBnClickedButtonMoveto()
{
	if(msdk_handle == INVALID_HANDLE_VALUE) {
		AfxMessageBox("��δ�򿪶˿ڣ����ȴ򿪶˿�");
		return;
	}
	unsigned int RetSw;
	RetSw = M_MoveTo(msdk_handle,50, 100);
}

void CVC_DemoDlg::OnBnClickedButtonGetmousepos()
{
	if(msdk_handle == INVALID_HANDLE_VALUE) {
		AfxMessageBox("��δ�򿪶˿ڣ����ȴ򿪶˿�");
		return;
	}
	CString strtemp;
	unsigned int RetSw;
	int x_pos, y_pos;
	RetSw = M_GetCurrMousePos(msdk_handle,&x_pos, &y_pos);
	if (RetSw != 0) {
		AfxMessageBox("��ȡ����������");
		return;
	}
	else {
		strtemp.Format("x=%d, y=%d",x_pos,y_pos);
		AfxMessageBox(strtemp);
	}
}
