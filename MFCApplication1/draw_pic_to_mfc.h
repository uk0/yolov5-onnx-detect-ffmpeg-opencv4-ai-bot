#pragma once

#include "afxdialogex.h"
#include "opencv2/imgproc/imgproc_c.h"

	/****************************
	**名字：绘制图像类
	**功能：Opencv输入的IplImage图像对象绘制图像到指定窗口的控件中
	**解释：showWnd为指定窗口，id为指定窗口id。img为输入图像对象
	**作者：weixinhum
	**时间：2015/10/29
	****************************/
	class draw_pic_to_mfc : public CDialogEx
	{
	public:
		//位图对象
		BITMAPINFO *pbmi;//位图信息
		BYTE *bmibuf;//位图信息空间
		BYTE *g_pBits;
		HBITMAP g_hBmp;
		CDC *pDC;
		CRect rect;
		CStatic *pic;
		HDC g_hMemDC;
		void drawpicinit(IplImage* img, unsigned int id, CWnd* showWnd);//初始化函数。參数一为 OpenCV的图像数据结构类，參数二为控件id
		void drawpic(IplImage* img);//画图到MFC的 Picture Control 控件相关函数，參数一为 OpenCV的图像数据结构类
		void drawrelease();//释放画图对象
		CWnd* mShowWnd;
	};


