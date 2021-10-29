
#pragma once
// MFCApplication1Dlg.cpp: 实现文件
#define   WIDTHBYTES(bits) (((bits)+31)/32*4)/
#define KEY_DOWN(VK_NONAME) ((GetAsyncKeyState(VK_NONAME) & 0x8000) ? 1:0) //必要的，我是背下来的 
#define myhotkey1 1018
#define myhotkey2 1019

#include "pch.h"
//飞易来
#include "msdk.h"
#include "UsbHidKeyCode.h"
//
#include "framework.h"
#include "MFCApplication1.h"
#include "MFCApplication1Dlg.h"
#include "afxdialogex.h"
#include <opencv2/highgui/highgui_c.h>
//bind
#include<functional>
// ffmpeg 录制屏幕
#include "ScreenRecord.h"

//queue

#include "Queue.h"

// yoloV5

#include "Cutils.h"
#include "detector.h"

//#include "CImg.h"




#include <chrono>

#include <thread>

#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <numeric>


#ifdef _DEBUG
#define new DEBUG_NEW
#endif

using namespace cv;
using namespace std;
using namespace Ort;

// 用于应用程序“关于”菜单项的 CAboutDlg 对话框

class CAboutDlg : public CDialogEx
{
public:
	CAboutDlg();

// 对话框数据
#ifdef AFX_DESIGN_TIME
	enum { IDD = IDD_ABOUTBOX };
#endif

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持

// 实现
protected:
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialogEx(IDD_ABOUTBOX)
{
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialogEx)
END_MESSAGE_MAP()


// CMFCApplication1Dlg 对话框



CMFCApplication1Dlg::CMFCApplication1Dlg(CWnd* pParent /*=nullptr*/)
	: CDialogEx(IDD_MFCAPPLICATION1_DIALOG, pParent)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CMFCApplication1Dlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);

	DDX_Control(pDX, IDC_SLIDER3, m_pSlidHeader);
	DDX_Control(pDX, IDC_SLIDER4, m_pSlidMouseSpeed);
	DDX_Control(pDX, IDC_COMBO1, m_comBox);
}

void CMFCApplication1Dlg::OnClose() {
	UnregisterHotKey(m_hWnd, myhotkey1);//卸载热键
	UnregisterHotKey(m_hWnd, myhotkey2);//卸载热键
}

BEGIN_MESSAGE_MAP(CMFCApplication1Dlg, CDialogEx)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_CBN_SELCHANGE(IDC_COMBO1, &CMFCApplication1Dlg::OnCbnSelchangeCombo1)
	ON_BN_CLICKED(IDC_BUTTON1, &CMFCApplication1Dlg::OnBnClickedButton1)
	ON_STN_CLICKED(IDC_STATIC_PIC, &CMFCApplication1Dlg::OnStnClickedStaticPic)
	ON_NOTIFY(NM_CUSTOMDRAW, IDC_SLIDER3, &CMFCApplication1Dlg::OnNMCustomdrawSlider1)
	ON_BN_CLICKED(IDC_BUTTON3, &CMFCApplication1Dlg::OnBnClickedButton3)
	ON_BN_CLICKED(IDC_BUTTON5, &CMFCApplication1Dlg::OnBnClickedButton5)
	ON_NOTIFY(NM_CUSTOMDRAW, IDC_SLIDER4, &CMFCApplication1Dlg::OnNMCustomdrawSlider4)
	ON_BN_CLICKED(IDC_BUTTON9, &CMFCApplication1Dlg::OnBnClickedButton9)
END_MESSAGE_MAP()


// CMFCApplication1Dlg 消息处理程序

//
int watch_w = 256;
int watch_h = 256;
//



BOOL CMFCApplication1Dlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();


	msdk_handle = INVALID_HANDLE_VALUE;	//初始为未打开
	
	((CComboBox *)GetDlgItem(IDC_COMBO1))->AddString(_T("LEFT&RIGHT"));
	((CComboBox *)GetDlgItem(IDC_COMBO1))->AddString(_T("LEFT"));
	((CComboBox *)GetDlgItem(IDC_COMBO1))->AddString(_T("RIGHT"));
	((CComboBox *)GetDlgItem(IDC_COMBO1))->SetCurSel(2);
	//禁止测试
	this->GetDlgItem(IDC_BUTTON1)->EnableWindow(0);

	int iImgWidth = watch_w * 2, iImgHeight = watch_h * 2;
	int iImgZoomWidth = iImgWidth / 2, iImgZoomHeight = iImgHeight / 2; CRect rectPic;
	GetDlgItem(IDC_STATIC_PIC)->GetWindowRect(&rectPic); // IDC_PICTURE 是 picture control 的 ID 
	ScreenToClient(&rectPic);
	GetDlgItem(IDC_STATIC_PIC)->MoveWindow(rectPic.left, rectPic.top, iImgZoomWidth, iImgZoomHeight, true);
	// 热键
	RegisterHotKey(m_hWnd, myhotkey1, MOD_CONTROL, VK_F1);

	RegisterHotKey(m_hWnd, myhotkey2, MOD_CONTROL, VK_F2);

	CSliderCtrl*pSlidHeader = (CSliderCtrl*)GetDlgItem(IDC_SLIDER3);
	CSliderCtrl*pSlidMouseSpeed = (CSliderCtrl*)GetDlgItem(IDC_SLIDER4);

	pSlidHeader->SetRange(1, 10, TRUE);//設定滑動條範圍
	pSlidMouseSpeed->SetRange(1, 20, TRUE);//設定滑動條範圍

	pSlidHeader->SetPos(4);//設定滑動條位置
	pSlidMouseSpeed->SetPos(10);//設定滑動條位置


	namedWindow("view", WINDOW_AUTOSIZE);
	resizeWindow("view", 256, 256);
	HWND hWnd = (HWND)cvGetWindowHandle("view");
	HWND hParent = ::GetParent(hWnd);
	::SetParent(hWnd, GetDlgItem(IDC_STATIC_PIC)->m_hWnd);
	::ShowWindow(hParent, SW_HIDE);



	// IDM_ABOUTBOX 必须在系统命令范围内。
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != nullptr)
	{
		BOOL bNameValid;
		CString strAboutMenu;
		bNameValid = strAboutMenu.LoadString(IDS_ABOUTBOX);
		ASSERT(bNameValid);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// 设置此对话框的图标。  当应用程序主窗口不是对话框时，框架将自动
	//  执行此操作
	SetIcon(m_hIcon, TRUE);			// 设置大图标
	SetIcon(m_hIcon, FALSE);		// 设置小图标

	// TODO: 在此添加额外的初始化代码

	return TRUE;  // 除非将焦点设置到控件，否则返回 TRUE
}

void CMFCApplication1Dlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialogEx::OnSysCommand(nID, lParam);
	}
}

// 如果向对话框添加最小化按钮，则需要下面的代码
//  来绘制该图标。  对于使用文档/视图模型的 MFC 应用程序，
//  这将由框架自动完成。

void CMFCApplication1Dlg::OnPaint()
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
HCURSOR CMFCApplication1Dlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}

#include "ranges.h"

void CMFCApplication1Dlg::mR(int x, int y)
{

	x = x - 256 / 2;  //# x相对移动距离
	y = y - 256 / 2; //# y相对移动距离
	  // # x相对移动距离
	  //y相对移动距离
	int sd = 2;   // 采样率
	int sx = 1;
	int sy = 1;
	if (x >= 0) {}
	else {
		sx = -1;  // 取x的符号
	}

	if (y >= 0) {}
	else {
		sy = -1;    //取y的符号
	}
	x = abs(x);
	y = abs(y);
	int xn = x / sd;  // x采样次数
	int xnr = x % sd;  // x采样剩余
	int yn = y / sd;
	int	ynr = y % sd;
	if (xn >= yn) {
		for (auto i : XRange(0, yn)) {
			M_MoveR2(msdk_handle, (sx * sd), (sy * sd));
		}
		for (auto i : XRange(0, xn - yn)) {
			M_MoveR2(msdk_handle, (sx * sd), 0);
		}
		M_MoveR2(msdk_handle, (sx * xnr), (sy * ynr));
	}
	else {
		for (auto i : XRange(0, xn)) {
			M_MoveR2(msdk_handle, (sx * sd), (sy * sd));
		}

		for (auto i : XRange(0, yn - xn)) {
			M_MoveR2(msdk_handle, 0, (sy * sd));
		}
		int x1 = sx * xnr;
		int y1 = sy * ynr;
		M_MoveR2(msdk_handle, x1, y1);
	}
}

void CMFCApplication1Dlg::OnCbnSelchangeCombo1()
{
	CString ComSelItem(_T(""));//获取当前下拉框的值 
	m_comBox.GetLBText(m_comBox.GetCurSel(), ComSelItem);//获取CComBox下拉框当前选中的值
	if (ComSelItem == "LEFT&RIGHT") {
		combo = 0;
	}
	if (ComSelItem == "LEFT") {
		combo = 1;
	}
	if (ComSelItem == "RIGHT") {
		combo = 2;
	}
}

int ShowMat(cv::Mat img, HWND hWndDisplay)
{
	if (img.channels() < 3)
	{
		return -1;
	}

	//构造将要显示的Mat版本图片 
	RECT rect;
	::GetClientRect(hWndDisplay, &rect);
	cv::Mat imgShow(abs(rect.top - rect.bottom), abs(rect.right - rect.left), CV_8UC3);
	resize(img, imgShow, imgShow.size());

	//在控件上显示要用到的CImage类图片 
	ATL::CImage CI;
	int w = imgShow.cols;//宽   
	int h = imgShow.rows;//高   
	int channels = imgShow.channels();//通道数   
	CI.Create(w, h, 8 * channels);

	//CI像素的复制 
	uchar* pS;
	uchar* pImg = (uchar*)CI.GetBits();//得到CImage数据区地址   
	int step = CI.GetPitch();
	for (int i = 0; i < h; i++)
	{
		pS = imgShow.ptr<uchar>(i);
		for (int j = 0; j < w; j++)
		{
			for (int k = 0; k < 3; k++)
				*(pImg + i * step + j * 3 + k) = pS[j * 3 + k];
			//注意到这里的step不用乘以3   
		}
	}

	//在控件显示图片 
	HDC dc;
	dc = ::GetDC(hWndDisplay);
	CI.Draw(dc, 0, 0);
	::ReleaseDC(hWndDisplay, dc);
	CI.Destroy();

	return 0;
}


/*
 *显示视频 HWND Mat
 */
void ShowMat2Mx(Mat img, HWND hWndDisplay)
{
	if (img.channels() == 1)
	{
		//调整图片与显示控件大小一致
		RECT rect;
		GetClientRect(hWndDisplay, &rect);
		Mat imgShow(abs(rect.top - rect.bottom), abs(rect.right - rect.left), CV_8UC1);
		resize(img, imgShow, imgShow.size());

		ATL::CImage CI;
		int w = imgShow.cols;//宽  
		int h = imgShow.rows;//高  
		int channels = imgShow.channels();//通道数  
		CI.Destroy();//防止重复创建导致程序崩溃
		CI.Create(w, h, 8 * channels);
		RGBQUAD* ColorTable;
		int MaxColors = 256;
		ColorTable = new RGBQUAD[MaxColors];
		CI.GetColorTable(0, MaxColors, ColorTable);//这里是取得指针  
		for (int i = 0; i < MaxColors; i++)
		{
			ColorTable->rgbBlue = (BYTE)i;
			ColorTable->rgbGreen = (BYTE)i;
			ColorTable->rgbRed = (BYTE)i;
		}
		CI.SetColorTable(0, MaxColors, ColorTable);
		delete[] ColorTable;

		uchar *pS;
		uchar *pImg = (uchar*)CI.GetBits();
		int step = CI.GetPitch();
		for (int i = 0; i < h; i++)
		{
			pS = img.ptr<uchar>(i);
			for (int j = 0; j < w; j++)
			{
				*(pImg + i * step + j) = pS[j];
			}
		}
		HDC dc = GetDC(hWndDisplay);
		CI.Draw(dc, 0, 0);

		ReleaseDC(hWndDisplay, dc);
		CI.Destroy();
	}
	if (img.channels() == 3)
	{
		//调整图片与显示控件大小一致
		RECT rect;
		GetClientRect(hWndDisplay, &rect);
		cv::Mat imgShow(abs(rect.top - rect.bottom), abs(rect.right - rect.left), CV_8UC3);
		resize(img, imgShow, imgShow.size());

		ATL::CImage CI;
		int w = imgShow.cols;//宽  
		int h = imgShow.rows;//高  
		int channels = imgShow.channels();//通道数  
		CI.Destroy();//防止重复创建导致程序崩溃
		CI.Create(w, h, 8 * channels);

		uchar *pS;//图片数据类型：uchar； value range：0~255
		uchar *pImg = (uchar *)CI.GetBits();//得到CImage数据区地址 
		int step = CI.GetPitch();
		for (int i = 0; i < h; i++)
		{
			pS = imgShow.ptr<uchar>(i);
			for (int j = 0; j < w; j++)
			{
				for (int k = 0; k < 3; k++)
					*(pImg + i * step + j * 3 + k) = pS[j * 3 + k];
			}
		}
		HDC dc = GetDC(hWndDisplay);
		CI.Draw(dc, 0, 0);

		ReleaseDC(hWndDisplay, dc);
		CI.Destroy();
	}

}




double clockToMilliseconds(clock_t ticks) {
	// units/(units/time) => time (seconds) * 1000 = milliseconds
	return (ticks / (double)CLOCKS_PER_SEC)*1000.0;
}

std::queue<std::vector<Detection>> detectMessageQueue;

std::queue<std::vector<int>> drawMessageQueue;


// 初始化区域////////////////////////


//const float confThreshold = 0.4f;
//const float iouThreshold = 0.4f;
const std::string classNamesPath = "best.names";
//std::vector<Detection> result;
//yolov5

const std::vector<std::string> classNames = Cutils::loadNames(classNamesPath);

unsigned int frames = 0;

std::mutex fps_lock;
Queue<std::vector<int>> Q_point_x_y; //推理返回的点位
Queue<cv::Mat> Result_img;  //推理返回的图
Queue<cv::Mat> screenshotMessageQueue; // 截图

// 人物位置
int _w = watch_w;
int _h = watch_h;
// 
int y_center = 540 - (_h / 2);
int x_center = 960 - (_w / 2);
/////////////////////////////////////

/**
void DrowMengmenggan(LPVOID pParam) {

	CMFCApplication1Dlg * dlg = (CMFCApplication1Dlg*)pParam;

	//yoloR
	//YOLO mynet(0.25, 0.25);
	//Mat img = screenshot.getScreenshot();
	// 960,540

	// GET FPS
	clock_t deltaTime = 0;
	unsigned int frames = 0;
	double  frameRate = 30;
	double  averageFrameTimeMilliseconds = 33.333;

	detector  = YOLODetector("best.onnx", true, cv::Size(256, 256));
	POINT last_p;
	
cc:while (true) {
		std::chrono::steady_clock::time_point  now = std::chrono::steady_clock::now();

		clock_t beginFrame = clock();
		
		cv::Mat srcimg = screenshot.getScreenshot(x_center, y_center, _w, _h);
		screenshotMessageQueue.push(srcimg);
		//vector<int> u_ =  mynet.detect(srcimg);

		std::vector<Detection> result = detector.detect(srcimg, confThreshold, iouThreshold);
		vector<int> u_  = Cutils::visualizeDetection(srcimg, result, classNames);

		clock_t endFrame = clock();
		deltaTime += endFrame - beginFrame;
		frames++;

		//if you really want FPS
		if (clockToMilliseconds(deltaTime) > 1000.0) { //every second
			frameRate = (double)frames*0.5 + frameRate * 0.5; //more stable
			frames = 0;
			deltaTime -= CLOCKS_PER_SEC;
			averageFrameTimeMilliseconds = 1000.0 / (frameRate == 0 ? 0.001 : frameRate);
			CString fps;
			fps.Format(_T("%lf fps"), averageFrameTimeMilliseconds);
			dlg->GetDlgItem(IDC_STATIC_FPS)->SetWindowText(fps);;
		}


		
		line(srcimg, Point(_w / 2, _h / 2 + 45), Point(_w / 2, _h / 2), Scalar(0, 0, 255), 2);
		// x line
		line(srcimg, Point(_w / 2 - 8, _h / 2), Point(_w / 2 + 8, _h / 2), Scalar(0, 255, 255), 2);
		imshow("view", srcimg);
		GetCursorPos(&last_p);//获取鼠标坐标

		//CString x1y1xy;
		//x1y1xy.Format(_T("鼠标坐标 x1 = %d y1 = %d "), u_[0], u_[1]);
		//dlg->GetDlgItem(IDC_STATIC_XY)->SetWindowText(x1y1xy);
		
		int _aim_x1 = u_[0];
		int _aim_y1 = u_[1];
		int _aim_h = u_[2];
		int _aim_w = u_[3];
		// 对角线
		//设一点坐标为(a, b), 另一点坐标为(c, d)
		//那么这两点坐标中点坐标是((a + c) / 2, (c + d) / 2)
		
		int mov_y = 0;
		int x_pos_temp = dlg->x_pos;
		if (x_pos_temp < 5) {
			mov_y = (540 - (_h / 2)) + _aim_y1 - x_pos_temp;
		}
		if (x_pos_temp == 5) {
			mov_y = (540 - (_h / 2)) + _aim_y1;
		}
		if (x_pos_temp > 5) {
			mov_y = (540 - (_h / 2)) + _aim_y1 + x_pos_temp;
		}

		int mov_x = (960 - (_w / 2)) + _aim_x1;
		//CString aimobt_x1y1xy;
		//aimobt_x1y1xy.Format(_T(" 人体位置 x = %d y = %d h = %d w = %d"), mov_x, mov_y, _aim_h, _aim_w);
		//dlg->GetDlgItem(IDC_STATIC_AIMOBT_X1Y1XY)->SetWindowText(aimobt_x1y1xy);
			


		if (dlg->useAimbot) {
		if (u_[0] != 0 && u_[1] != 0) {
			if (KEY_DOWN(VK_LBUTTON)) {
				// x = 760 y = 420 
				SetCursorPos(mov_x, mov_y);//更改鼠标坐标
			}
		 }
		}

		auto t2 = std::chrono::steady_clock::now();
		std::chrono::duration<double> time_span = std::chrono::duration_cast<std::chrono::duration<double>>(t2 - now);
		CString detectMs;
		detectMs.Format(_T(" %lf ms"), time_span);
		dlg->GetDlgItem(time_detect_consuming)->SetWindowText(detectMs);;
	}
}

*/


LRESULT CMFCApplication1Dlg::DefWindowProc(UINT message, WPARAM wParam, LPARAM lParam)
{
	if (message == WM_HOTKEY)
	{
		if (wParam == myhotkey1)
		{
			this->useAimbot = true;
		}
		if (wParam == myhotkey2)
		{
			this->useAimbot = false;
		}
	}
	return CDialog::DefWindowProc(message, wParam, lParam);
}

void CMFCApplication1Dlg::OnBnClickedButton1() {}
/**
void CMFCApplication1Dlg::OnBnClickedButton1()
{

	std::thread threads[1];
	threads[0] = thread(DrowMengmenggan,this);

	for (auto &t : threads) {
		t.detach();
	}
	this->GetDlgItem(IDC_BUTTON1)->EnableWindow(0);
}
*/


void CMFCApplication1Dlg::OnStnClickedStaticPic()
{
	// TODO: 在此添加控件通知处理程序代码
	
}


void CMFCApplication1Dlg::OnNMCustomdrawSlider1(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMCUSTOMDRAW pNMCD = reinterpret_cast<LPNMCUSTOMDRAW>(pNMHDR);
	// TODO: 在此添加控件通知处理程序代码
	*pResult = 0;

	int nPos = m_pSlidHeader.GetPos(); //獲得滑塊的當前位置

 //另外做一個編輯框顯示所調節的資料；
	x_pos = nPos;
	CString str2;
	str2.Format(_T(" %d"), nPos);
	this->SetDlgItemText(IDC_STATIC_POS, str2);

}

void ambot2(CMFCApplication1Dlg* dlg, vector<int> u_) {


	//目标坐标 x
	int _aim_x1 = u_[0];
	//目标坐标 y
	int _aim_y1 = u_[1];
	int _aim_h = u_[2];
	int _aim_w = u_[3];


	int mov_y = 0;
	int x_pos_temp = dlg->x_pos;
	if (x_pos_temp < 5) {
		mov_y = (540 - (_h / 2)) + _aim_y1 - x_pos_temp;
	}
	if (x_pos_temp == 5) {
		mov_y = (540 - (_h / 2)) + _aim_y1;
	}
	if (x_pos_temp > 5) {
		mov_y = (540 - (_h / 2)) + _aim_y1 + x_pos_temp;
	}
	int mov_x = (960 - (_w / 2)) + _aim_x1;


	//左上角 0，0
	// pos = 100，100
	// mov = 200,200
	// x: x方向（横轴）的距离（正:向右; 负值:向左）; y: y方向（纵轴）的距离（正:向下; 负值:向上）



	if (dlg->useAimbot) {
		if (_aim_x1 != 0 && _aim_y1 != 0) {

			if (dlg->combo == 0) {
				if (KEY_DOWN(VK_LBUTTON)) {
					dlg->mR(_aim_x1, _aim_y1);
				}
				if (KEY_DOWN(VK_RBUTTON)) {
					dlg->mR(_aim_x1, _aim_y1);
				}
			}
			if (dlg->combo == 1) {
				if (KEY_DOWN(VK_LBUTTON)) {
					dlg->mR(_aim_x1, _aim_y1);

				}
			}
			if (dlg->combo == 2) {
				if (KEY_DOWN(VK_RBUTTON)) {
					dlg->mR(_aim_x1, _aim_y1);
				}
			}
		}
	}
}
// 推断
void detectThread(LPVOID pParam) {
	CMFCApplication1Dlg * dlg = (CMFCApplication1Dlg*)pParam;
	//推理
	//confThreshold：分类得分（质量得分）阈值，默认0.45，小于该阈值的框将被丢弃。
	//iouThreshold：NMS中的iou阈值，默认0.3。
	const float confThreshold = 0.6f;
	const float iouThreshold = 0.4f;
	//每次都加载模型
	YOLODetector detector = YOLODetector("best.onnx", true, cv::Size(256, 256));
	while (true) {
			// 先获取截图
		if (screenshotMessageQueue.size()>0) {
			cv::Mat inImg = screenshotMessageQueue.pop();
			// 推理
			std::vector<Detection> result = detector.detect(inImg, confThreshold, iouThreshold);
			// 获取推理后的截图和 点位
			vector<int> u_ = Cutils::visualizeDetection(inImg, result, classNames);
			Q_point_x_y.push(u_);
			//fps_lock.lock();
			frames++;
			//fps_lock.unlock();
		
			Result_img.push(inImg);
		
			inImg.release();
		}
	}
}
// 画图到mfc
void draw(LPVOID pParam) {
	CMFCApplication1Dlg * dlg = (CMFCApplication1Dlg*)pParam;
	while (true) {
		if (Result_img.size()>0) {
		
		cv::Mat srcimg = Result_img.pop();
		CString size_queue;
		size_queue.Format(_T("%d"), screenshotMessageQueue.size());
		dlg->GetDlgItem(IDC_STATIC19)->SetWindowText(size_queue);
		line(srcimg, Point(_w / 2, _h / 2 + 5), Point(_w / 2, _h / 2-5), Scalar(0, 0, 255), 1);
		// x line
		line(srcimg, Point(_w / 2 - 8, _h / 2), Point(_w / 2 + 8, _h / 2), Scalar(0, 255, 255), 1);
		imshow("view", srcimg);
		srcimg.release();
		}
	}
}


void screenshotDeskTop2() {
	ScreenRecord sr;
	sr.openDevice();
	sr.getScreenShotForFFmpeg();
}

// 渲染FPS
void fps_dr(LPVOID pParam) {
	CMFCApplication1Dlg * dlg = (CMFCApplication1Dlg*)pParam;
	//static std::mutex mutex;
	//std::unique_lock<std::mutex> locker(mutex);
	//auto beginFrame = std::chrono::high_resolution_clock::now();

	while (true) {
		   std::this_thread::sleep_for(1000ms);

		    double double_fps = frames / 1;
			//fps_lock.lock();
			frames = 0;
			//fps_lock.unlock();
			
			CString fps;
			fps.Format(_T("%lf fps"), double_fps);
			dlg->GetDlgItem(IDC_STATIC_FPS)->SetWindowText(fps);;
		}
}

// 鼠标操作

//TODO 贝塞尔曲线
void aimbot(LPVOID pParam) {
	CMFCApplication1Dlg * dlg = (CMFCApplication1Dlg*)pParam;
	
	while (true) {
		if (Q_point_x_y.size() > 0) {
		
		std::vector<int> u_ = Q_point_x_y.pop();

		//目标坐标 x
		int _aim_x1 = u_[0];
		//目标坐标 y
		int _aim_y1 = u_[1];
		int _aim_h = u_[2];
		int _aim_w = u_[3];

		//CString x1y1xy;
		//x1y1xy.Format(_T("人物坐标 x1 = %d y1 = %d 鼠标坐标  h = %d  w = %d"), _aim_x1, _aim_y1, _aim_h, _aim_w);
		//dlg->GetDlgItem(IDC_STATIC14)->SetWindowText(x1y1xy);

		CString x1y1xy;
		x1y1xy.Format(_T("鼠标剩余 %d "), Q_point_x_y.size());
		dlg->GetDlgItem(IDC_STATIC14)->SetWindowText(x1y1xy);
		// 对角线
		//设一点坐标为(a, b), 另一点坐标为(c, d)
		//那么这两点坐标中点坐标是((a + c) / 2, (c + d) / 2)

		int mov_y = 0;
		int x_pos_temp = dlg->x_pos;
		if (x_pos_temp < 5) {
			mov_y = (540 - (_h / 2)) + _aim_y1 - x_pos_temp;
		}
		if (x_pos_temp == 5) {
			mov_y = (540 - (_h / 2)) + _aim_y1;
		}
		if (x_pos_temp > 5) {
			mov_y = (540 - (_h / 2)) + _aim_y1 + x_pos_temp;
		}
		int mov_x = (960 - (_w / 2)) + _aim_x1;
		

		//左上角 0，0
		// pos = 100，100
		// mov = 200,200
		// x: x方向（横轴）的距离（正:向右; 负值:向左）; y: y方向（纵轴）的距离（正:向下; 负值:向上）
 		 


	
		//CString aimobt_x1y1xy;
		//aimobt_x1y1xy.Format(_T(" 飞易来相对移动 \r\n msdk_mov_x = %d \r\n msdk_mov_y = %d "), _aim_x1 - 256 / 2, _aim_y1 - 256 / 2);
		//dlg->GetDlgItem(IDC_STATIC_AIMOBT_X1Y1XY)->SetWindowText(aimobt_x1y1xy);
	
		if (dlg->useAimbot) {
			if (_aim_x1 != 0 && _aim_y1 != 0) {
				
				if (dlg->combo == 0) {
					if (KEY_DOWN(VK_LBUTTON)) {
						dlg->mR(_aim_x1, _aim_y1);
					}
					if (KEY_DOWN(VK_RBUTTON)) {
						dlg->mR(_aim_x1, _aim_y1);
					}
				}
				if (dlg->combo == 1) {
					if (KEY_DOWN(VK_LBUTTON)) {
						dlg->mR(_aim_x1, _aim_y1);

					}
				}
				if (dlg->combo == 2) {
					if (KEY_DOWN(VK_RBUTTON)) {
						dlg->mR(_aim_x1, _aim_y1);
					}
				}
			}
		}
		}
	}
}

void startBackend(LPVOID pParam) {

	CMFCApplication1Dlg * dlg = (CMFCApplication1Dlg*)pParam;

	std::vector<std::thread> consumers;
	
	std::thread screenshotDeskTop1WithFFmpeg(screenshotDeskTop2);
	consumers.push_back(std::move(screenshotDeskTop1WithFFmpeg));

	for (int i = 0; i < 4; ++i) {
		std::thread consumer(detectThread, dlg);
		consumers.push_back(std::move(consumer));
	}
	

	std::thread aimbot(aimbot, dlg);
	consumers.push_back(std::move(aimbot));
	//绘制 图像
	
	std::thread draw(draw, dlg);
	consumers.push_back(std::move(draw));
	// 上报fps
	std::thread fps_dr(fps_dr, dlg);
	consumers.push_back(std::move(fps_dr));
	
	
	// 推理 和 画图
	for (auto& consumer : consumers) {
		consumer.join();
	}
	//std::this_thread::sleep_for(std::chrono::milliseconds(1000));
		//截图
	//for (auto& screenshotDeskTop : screenshotDeskTops) {
	//	screenshotDeskTop.join();
	//};
}

void CMFCApplication1Dlg::OnBnClickedButton3()
{
	if (msdk_handle == INVALID_HANDLE_VALUE) {
		msdk_handle = M_Open(1);
		// 设置 鼠标移动 速度
		M_SetParam(msdk_handle, 20, 20, 80);
		M_ResolutionUsed(msdk_handle, 1920, 1080);
		M_MoveR2(msdk_handle,100,102);
		M_MoveR2(msdk_handle,102,100);
	}
	this->GetDlgItem(IDC_BUTTON3)->EnableWindow(0);
	std::thread threads[1];
	threads[0] = thread(startBackend, this);

	for (auto &t : threads) {
		t.detach();
	}
}



void CMFCApplication1Dlg::OnBnClickedButton5()
{
	

	if (msdk_handle == INVALID_HANDLE_VALUE) {
		msdk_handle = M_Open(1);
		// 设置 鼠标移动 速度
		M_SetParam(msdk_handle, 20, 1, 10);
		M_ResolutionUsed(msdk_handle, 1920, 1080);
		M_MoveTo2(msdk_handle, 760, 420);
	}
	// TODO: 在此添加控件通知处理程序代码
	
	//GetDlgItem(IDC_BUTTON5)->EnableWindow(false);
	int x_pos, y_pos;
	CString strtemp;
	M_GetCurrMousePos(msdk_handle, &x_pos, &y_pos);
	strtemp.Format(_T("x=%d, y=%d"), x_pos, y_pos);
	AfxMessageBox(strtemp);
}


void CMFCApplication1Dlg::OnNMCustomdrawSlider4(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMCUSTOMDRAW pNMCD = reinterpret_cast<LPNMCUSTOMDRAW>(pNMHDR);
	// TODO: 在此添加控件通知处理程序代码
	*pResult = 0;

	int nPos = m_pSlidMouseSpeed.GetPos(); //獲得滑塊的當前位置
	
	int add_num = nPos * 10 + 5;
	M_SetParam(msdk_handle, 20, nPos, nPos+20);


	//另外做一個編輯框顯示所調節的資料；
	x_pos_speed = nPos;
	CString str2;
	str2.Format(_T(" %d"), nPos);
	this->SetDlgItemText(IDC_STATIC_POS2, str2);
}


void CMFCApplication1Dlg::OnBnClickedButton9()
{
	ScreenRecord sr;
	//获取视频
	sr.openDevice();
	//开始截图并且推理
	sr.getScreenShotForFFmpeg();

}
