
// VC_Demo.h : PROJECT_NAME Ӧ�ó������ͷ�ļ�
//

#pragma once

#ifndef __AFXWIN_H__
	#error "�ڰ������ļ�֮ǰ������stdafx.h�������� PCH �ļ�"
#endif

#include "resource.h"		// ������


// CVC_DemoApp:
// �йش����ʵ�֣������ VC_Demo.cpp
//

class CVC_DemoApp : public CWinApp
{
public:
	CVC_DemoApp();

// ��д
public:
	virtual BOOL InitInstance();

// ʵ��

	DECLARE_MESSAGE_MAP()
};

extern CVC_DemoApp theApp;