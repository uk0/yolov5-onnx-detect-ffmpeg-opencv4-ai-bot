
// VC_DemoDlg.h : ͷ�ļ�
//

#pragma once


// CVC_DemoDlg �Ի���
class CVC_DemoDlg : public CDialogEx
{
// ����
public:
	CVC_DemoDlg(CWnd* pParent = NULL);	// ��׼���캯��

// �Ի�������
	enum { IDD = IDD_VC_DEMO_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV ֧��

	HANDLE msdk_handle;

// ʵ��
protected:
	HICON m_hIcon;

	// ���ɵ���Ϣӳ�亯��
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedOk();
	afx_msg void OnBnClickedButtonOpen();
	afx_msg void OnBnClickedButtonClose();
	afx_msg void OnBnClickedButtonKeypress();
	afx_msg void OnBnClickedButtonMover();
	afx_msg void OnBnClickedButtonMoveto();
	afx_msg void OnBnClickedButtonGetmousepos();
};
