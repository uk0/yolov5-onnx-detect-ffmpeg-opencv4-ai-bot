// msdk_DEMO.h : main header file for the msdk_DEMO application
//

#if !defined(AFX_msdk_DEMO_H__4DAEA81B_037A_409E_9CFE_81E83BD49F43__INCLUDED_)
#define AFX_msdk_DEMO_H__4DAEA81B_037A_409E_9CFE_81E83BD49F43__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// Cmsdk_DEMOApp:
// See msdk_DEMO.cpp for the implementation of this class
//

class Cmsdk_DEMOApp : public CWinApp
{
public:
	Cmsdk_DEMOApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(Cmsdk_DEMOApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(Cmsdk_DEMOApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_msdk_DEMO_H__4DAEA81B_037A_409E_9CFE_81E83BD49F43__INCLUDED_)
