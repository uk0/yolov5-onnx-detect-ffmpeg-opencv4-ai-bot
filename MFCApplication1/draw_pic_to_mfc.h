#pragma once

#include "afxdialogex.h"
#include "opencv2/imgproc/imgproc_c.h"

	/****************************
	**���֣�����ͼ����
	**���ܣ�Opencv�����IplImageͼ��������ͼ��ָ�����ڵĿؼ���
	**���ͣ�showWndΪָ�����ڣ�idΪָ������id��imgΪ����ͼ�����
	**���ߣ�weixinhum
	**ʱ�䣺2015/10/29
	****************************/
	class draw_pic_to_mfc : public CDialogEx
	{
	public:
		//λͼ����
		BITMAPINFO *pbmi;//λͼ��Ϣ
		BYTE *bmibuf;//λͼ��Ϣ�ռ�
		BYTE *g_pBits;
		HBITMAP g_hBmp;
		CDC *pDC;
		CRect rect;
		CStatic *pic;
		HDC g_hMemDC;
		void drawpicinit(IplImage* img, unsigned int id, CWnd* showWnd);//��ʼ������������һΪ OpenCV��ͼ�����ݽṹ�࣬������Ϊ�ؼ�id
		void drawpic(IplImage* img);//��ͼ��MFC�� Picture Control �ؼ���غ���������һΪ OpenCV��ͼ�����ݽṹ��
		void drawrelease();//�ͷŻ�ͼ����
		CWnd* mShowWnd;
	};


