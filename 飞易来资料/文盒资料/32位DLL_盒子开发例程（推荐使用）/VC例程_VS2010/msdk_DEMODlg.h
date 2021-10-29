// msdk_DEMODlg.h : header file
//

#if !defined(AFX_msdk_DEMODLG_H__84857503_5702_4D12_AC39_8399C0081193__INCLUDED_)
#define AFX_msdk_DEMODLG_H__84857503_5702_4D12_AC39_8399C0081193__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// Cmsdk_DEMODlg dialog

class Cmsdk_DEMODlg : public CDialog
{
// Construction
public:
	Cmsdk_DEMODlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(Cmsdk_DEMODlg)
	enum { IDD = IDD_msdk_DEMO_DIALOG };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(Cmsdk_DEMODlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL
	
	HANDLE msdk_handle;
	int   i_CmdLen;
	

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(Cmsdk_DEMODlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnButtonUIopen();
	afx_msg void OnButtonUiclose();
	afx_msg void OnButtonMoveR();
	afx_msg void OnButtonMoveTo();
	afx_msg void OnButtonKeypress();
	afx_msg void OnButtonGetpos();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_msdk_DEMODLG_H__84857503_5702_4D12_AC39_8399C0081193__INCLUDED_)
