#include "pch.h"
#include "draw_pic_to_mfc.h"


#define   WIDTHBYTES(bits) (((bits)+31)/32*4)//����ʹͼ������ռ�ֽ���Ϊ4byte�ı���  

void  draw_pic_to_mfc::drawpicinit(IplImage* img, unsigned int id, CWnd* showWnd)
{
	//λͼ��Ϣ��ʼ��
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

	g_hMemDC = CreateCompatibleDC(pDC->m_hDC);//���������豸�������ڴ�DC
	g_hBmp = CreateDIBSection(g_hMemDC, pbmi, DIB_RGB_COLORS, (void**)&g_pBits, 0, 0);//����Ӧ�ó����ܹ�ֱ��д��ġ����豸�޹ص�λͼ
}

void draw_pic_to_mfc::drawpic(IplImage* img)//CMFCOpenCVShowDlg Ϊ�Ի�������
{
	//�Ķ�ͼ������:g_pBits
	//������ô��һ��ΪBMPͼ������ֽڶ�����ƣ�����������BMPͼ���Ǵ�ͼ������½��_ʼ����ġ�����ֱ�ӿ����ᵼ��ͼ�����µߵ�
	int l_width = WIDTHBYTES(img->width* pbmi->bmiHeader.biBitCount);
	for (int row = 0; row < img->height; row++)
		memcpy(&g_pBits[row*l_width], &img->imageData[(img->height - row - 1)*l_width], l_width);

	SelectObject(g_hMemDC, g_hBmp);//��λͼ����ѡ��g_hMemDC�ڴ�DC��
	//���컭ͼ
	TransparentBlt(pDC->m_hDC, 0, 0, rect.Width(), rect.Height(), g_hMemDC, 0, 0, img->width, img->height, RGB(1, 0, 0));//RGBֵԭ������Ϊ��0,0,0����ֻ���ƺ������ﻭͼ����bug���ǹʸ�Ϊ��1,0,0��
}

void draw_pic_to_mfc::drawrelease()
{
	//�ͷ��ڴ���Դ
	delete[]bmibuf;
	DeleteDC(g_hMemDC);
	DeleteObject(pic);
	DeleteObject(g_hBmp);
	mShowWnd->ReleaseDC(pDC);
}
