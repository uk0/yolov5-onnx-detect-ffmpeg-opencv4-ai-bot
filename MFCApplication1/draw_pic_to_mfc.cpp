#include "pch.h"
#include "draw_pic_to_mfc.h"


#define   WIDTHBYTES(bits) (((bits)+31)/32*4)//用于使图像宽度所占字节数为4byte的倍数  

void  draw_pic_to_mfc::drawpicinit(IplImage* img, unsigned int id, CWnd* showWnd)
{
	//位图信息初始化
	bmibuf = new BYTE[sizeof(BITMAPINFO) + 256 * sizeof(RGBQUAD)];
	memset(bmibuf, 0, sizeof(bmibuf));
	pbmi = (BITMAPINFO*)bmibuf;
	pbmi->bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
	pbmi->bmiHeader.biWidth = img->width;
	pbmi->bmiHeader.biHeight = img->height;
	pbmi->bmiHeader.biPlanes = 1;
	pbmi->bmiHeader.biBitCount = 24;
	pbmi->bmiHeader.biCompression = BI_RGB;
	mShowWnd = showWnd;
	pDC = mShowWnd->GetDlgItem(id)->GetDC();
	pic = (CStatic*)mShowWnd->GetDlgItem(id);
	pic->GetClientRect(&rect);

	g_hMemDC = CreateCompatibleDC(pDC->m_hDC);//创建兼容设备环境的内存DC
	g_hBmp = CreateDIBSection(g_hMemDC, pbmi, DIB_RGB_COLORS, (void**)&g_pBits, 0, 0);//创建应用程序能够直接写入的、与设备无关的位图
}

void draw_pic_to_mfc::drawpic(IplImage* img)//CMFCOpenCVShowDlg 为对话框类名
{
	//改动图像内容:g_pBits
	//这里这么做一则为BMP图像的四字节对齐机制，二则是由于BMP图像是从图像的左下角開始算起的。假设直接拷贝会导致图像上下颠倒
	int l_width = WIDTHBYTES(img->width* pbmi->bmiHeader.biBitCount);
	for (int row = 0; row < img->height; row++)
		memcpy(&g_pBits[row*l_width], &img->imageData[(img->height - row - 1)*l_width], l_width);

	SelectObject(g_hMemDC, g_hBmp);//将位图对象选入g_hMemDC内存DC中
	//拉伸画图
	TransparentBlt(pDC->m_hDC, 0, 0, rect.Width(), rect.Height(), g_hMemDC, 0, 0, img->width, img->height, RGB(1, 0, 0));//RGB值原本设置为（0,0,0），只是似乎在这里画图会有bug，是故改为（1,0,0）
}

void draw_pic_to_mfc::drawrelease()
{
	//释放内存资源
	delete[]bmibuf;
	DeleteDC(g_hMemDC);
	DeleteObject(pic);
	DeleteObject(g_hBmp);
	mShowWnd->ReleaseDC(pDC);
}
