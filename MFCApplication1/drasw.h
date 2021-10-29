#pragma once
#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <fstream>
#include <string>
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <cuda_provider_factory.h>
#include <onnxruntime_cxx_api.h>

#include "CImg.h"

#include <thread>

using namespace cv;
using namespace std;
using namespace Ort;


typedef struct BoxInfo
{
	float x1;
	float y1;
	float x2;
	float y2;
	float score;
	int label;
} BoxInfo;

class YOLO
{
public:
	YOLO(float nms_threshold, float objThreshold);
	vector<int> detect(Mat& cv_image);
private:
	float nms_threshold;
	float objThreshold;
	const string model_path = "best.onnx";
	const string classesFile = "best.names";
	vector<string> class_names;
	int num_class;

	Mat resize_image(Mat srcimg, int* newh, int* neww, int* top, int* left);
	vector<float> normalize_(Mat img);
	void nms(vector<BoxInfo>& input_boxes);
	const bool keep_ratio = false;
	const bool swaprgb = true;
	const int inpWidth = 640;
	const int inpHeight = 640;
	int num_anchors;
	Env env = Env(ORT_LOGGING_LEVEL_ERROR, "yolor");
	Ort::Session *ort_session = nullptr;
	SessionOptions sessionOptions = SessionOptions();
	vector<char*> input_names;
	vector<char*> output_names;
	vector<vector<int64_t>> output_node_dims; // >=1 outputs
};
