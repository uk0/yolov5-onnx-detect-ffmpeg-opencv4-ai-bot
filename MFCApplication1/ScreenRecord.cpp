#pragma once
#include "pch.h"

#include "ScreenRecord.h"
#include "Queue.h"


#include "glvar.h"
#include <opencv2/opencv.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
using namespace std;
using namespace cv;

ScreenRecord::ScreenRecord() {
	//av_register_all();
//	avcodec_register_all();
	avdevice_register_all();

	inFormatContext = NULL;
	outFormatContext = NULL;

	avInputFormat = NULL;
	avOutputFormat = NULL;

	inCodecContext = NULL;
	outCodecContext = NULL;

	inCodec = NULL;
	outCodec = NULL;

}

ScreenRecord::~ScreenRecord() {
	avformat_close_input(&inFormatContext);
	if (!inFormatContext) {
	}
	else {
		exit(1);
	}

	avformat_free_context(inFormatContext);
	if (!inFormatContext) {
	}
	else {
		exit(1);
	}

	avformat_close_input(&outFormatContext);
	if (!outFormatContext) {
	}
	else {
		exit(1);
	}

	avformat_free_context(outFormatContext);
	if (!outFormatContext) {
	}
	else {
		exit(1);
	}
}

int ScreenRecord::openDevice() {

	int value = -1;
	inFormatContext = avformat_alloc_context();

	AVDictionary *options = NULL;
	

	value = av_dict_set(&options, "pixel_format", "yuyv422", 0);
	if (value < 0) {
		exit(1);
	}

	value = av_dict_set(&options, "crf", "16", 0);
	if (value < 0) {
		exit(1);
	}
	value = av_dict_set(&options, "preset", "ultrafast", 0);
	if (value < 0) {
		exit(1);
	}
	value = av_dict_set(&options, "tune", "zerolatency", 0);
	if (value < 0) {
		exit(1);
	}
	value = av_dict_set(&options, "framerate", "130", 0);
	if (value < 0) {
		exit(1);
	}
	value = av_dict_set(&options, "fps", "130", 0);
	if (value < 0) {
		exit(1);
	}
	 //960 - 128
	 //540 - 128
	av_dict_set(&options,"offset_x","832",0);  
//The distance from the top edge of the screen or desktop  
	av_dict_set(&options,"offset_y","412",0);  

	value = av_dict_set(&options, "video_size", "256x256", 0);
	if (value < 0) {
		exit(1);
	}

	value = av_dict_set(&options, "vcodec", "libx265", 0);
	if (value < 0) {
		exit(1);
	}

	avInputFormat = av_find_input_format("gdigrab");
	value = avformat_open_input(&inFormatContext, "desktop", avInputFormat, &options);
	if (value != 0) {
		exit(1);
	}

	stream_ctx = static_cast<StreamContext *>(av_mallocz_array(inFormatContext->nb_streams, sizeof(*stream_ctx)));
	if (!stream_ctx)
		return AVERROR(ENOMEM);

	for (int i = 0; i < inFormatContext->nb_streams; i++) // find video stream posistion/index.
	{
		if (inFormatContext->streams[i]->codecpar->codec_type == AVMEDIA_TYPE_VIDEO) {
			AVCodec *dec = avcodec_find_decoder(inFormatContext->streams[i]->codecpar->codec_id);
			AVCodecContext *_inCodecContext = NULL;
			_inCodecContext = avcodec_alloc_context3(dec);
			if (!_inCodecContext) {
				exit(1);
			}

			value = avcodec_parameters_to_context(_inCodecContext, inFormatContext->streams[i]->codecpar);
			if (value < 0) {
			
				return value;
			}

			_inCodecContext->framerate = av_guess_frame_rate(inFormatContext, inFormatContext->streams[i], NULL);
			stream_ctx[0].dec_ctx = _inCodecContext;

			inStream = inFormatContext->streams[i];
			VideoStreamIndx = i;
			break;
		}
	}

	if (VideoStreamIndx == -1) {
		exit(1);
	}


	inCodec = avcodec_find_decoder(stream_ctx[0].dec_ctx->codec_id);
	if (!inCodec) {
		exit(1);
	}

	inCodecContext = avcodec_alloc_context3(inCodec);
	inCodecContext->width = 256;
	inCodecContext->height = 256;
	inCodecContext->pix_fmt = AV_PIX_FMT_YUYV422;

	AVDictionary *_options = NULL;

	//value = av_dict_set(&_options, "pixel_format", "rgb8", 0);
	value = av_dict_set(&_options, "pixel_format", "yuyv422", 0);
	if (value < 0) {
		exit(1);
	}

	value = avcodec_open2(inCodecContext, inCodec, &_options);
	if (value < 0) {
		exit(1);
	}

	av_dump_format(inFormatContext, 0, "1", 0);

	return value;
}




#include <opencv2/core/mat.hpp>
#include <opencv2/highgui/highgui.hpp>




int ScreenRecord::getScreenShotForFFmpeg2() {
	// Init


	int value = -1;
	AVPacket *ipacket = NULL;
	ipacket = av_packet_alloc();

	AVFrame *iframe = NULL;
	AVFrame *oframe = NULL;
	iframe = av_frame_alloc();
	oframe = av_frame_alloc();


	av_log(NULL, AV_LOG_INFO, "oFrame->linesize %3d\n", oframe->linesize);

	/***
	SwsContext *swsCtx_ = sws_getContext(inCodecContext->width,
			inCodecContext->height,
			inCodecContext->pix_fmt,
			inCodecContext->width,
			inCodecContext->height,
			inCodecContext->pix_fmt,
			SWS_BICUBIC, NULL, NULL, NULL);
			**/
	av_image_alloc(oframe->data, oframe->linesize, inCodecContext->width, inCodecContext->height, AV_PIX_FMT_BGR24,
		1);




	while (av_read_frame(inFormatContext, ipacket) >= 0) {

		if (ipacket->stream_index == VideoStreamIndx) {
			value = avcodec_send_packet(inCodecContext, ipacket);
			if (value < 0) {
				fprintf(stderr, "Error sending a packet for decoding\n");
				exit(1);
			}

			while (value >= 0) {
				double t1 = static_cast<double>(cv::getTickCount());

				value = avcodec_receive_frame(inCodecContext, iframe);
				if (value == AVERROR(EAGAIN) || value == AVERROR_EOF) {
					break;
				}
				else if (value < 0) {
					fprintf(stderr, "Error during decoding\n");
					exit(1);
				}


				//sws_scale(swsCtx_, iframe->data, iframe->linesize, 0, inCodecContext->height, oframe->data,
				//	oframe->linesize);

				int width = iframe->width;
				int height = iframe->height;

				cv::Mat image(height, width, CV_8UC3);



				/**SwsContext *cswsCtx_2 = sws_getContext(
					inCodecContext->width,
					inCodecContext->height,
					(AVPixelFormat)iframe->format,
					inCodecContext->width,
					inCodecContext->height,
					AVPixelFormat::AV_PIX_FMT_BGR24,
					SWS_FAST_BILINEAR,
					NULL,
					NULL,
					NULL);
					**/
				SwsContext *cswsCtx_2 = sws_getContext(
					inCodecContext->width,
					inCodecContext->height,
					(AVPixelFormat)iframe->format,
					inCodecContext->width,
					inCodecContext->height,
					AVPixelFormat::AV_PIX_FMT_BGR24,
					SWS_BICUBIC,
					NULL,
					NULL,
					NULL);


				sws_scale(cswsCtx_2,
					iframe->data,
					iframe->linesize,
					0,
					inCodecContext->height,
					&image.data,
					oframe->linesize
				);


				//clear 
				av_packet_unref(ipacket);
					// 进行推理
				if (!image.empty())
				{
					image.release();
				}
				sws_freeContext(cswsCtx_2);
			}
		}
	}
}

int ScreenRecord::getScreenShotForFFmpeg() {
	// Init


	int value = -1;
	AVPacket *ipacket = NULL;
 	ipacket = av_packet_alloc();
 
	AVFrame *iframe = NULL;
	AVFrame *oframe = NULL;
	iframe = av_frame_alloc();
	oframe = av_frame_alloc();

  
	av_log(NULL, AV_LOG_INFO, "oFrame->linesize %3d\n", oframe->linesize);

	/***
	SwsContext *swsCtx_ = sws_getContext(inCodecContext->width,
			inCodecContext->height,
			inCodecContext->pix_fmt,
			inCodecContext->width,
			inCodecContext->height,
			inCodecContext->pix_fmt,
			SWS_BICUBIC, NULL, NULL, NULL);
			**/
	av_image_alloc(oframe->data, oframe->linesize, inCodecContext->width, inCodecContext->height, AV_PIX_FMT_BGR24,
		1);

	

 
	while (av_read_frame(inFormatContext, ipacket) >= 0) {

		if (ipacket->stream_index == VideoStreamIndx) {
			value = avcodec_send_packet(inCodecContext, ipacket);
			if (value < 0) {
				fprintf(stderr, "Error sending a packet for decoding\n");
				exit(1);
			}

			while (value >= 0) {
				double t1 = static_cast<double>(cv::getTickCount());

				value = avcodec_receive_frame(inCodecContext, iframe);
				if (value == AVERROR(EAGAIN) || value == AVERROR_EOF) {
					break;
				}
				else if (value < 0) {
					fprintf(stderr, "Error during decoding\n");
					exit(1);
				}


				//sws_scale(swsCtx_, iframe->data, iframe->linesize, 0, inCodecContext->height, oframe->data,
				//	oframe->linesize);

				int width = iframe->width;
				int height = iframe->height;

				cv::Mat image(height, width, CV_8UC3);

				

				/**SwsContext *cswsCtx_2 = sws_getContext(
					inCodecContext->width, 
					inCodecContext->height,
					(AVPixelFormat)iframe->format, 
					inCodecContext->width, 
					inCodecContext->height,
					AVPixelFormat::AV_PIX_FMT_BGR24,
					SWS_FAST_BILINEAR, 
					NULL,
					NULL, 
					NULL);
					**/
				SwsContext *cswsCtx_2 = sws_getContext(
					inCodecContext->width,
					inCodecContext->height,
					(AVPixelFormat)iframe->format,
					inCodecContext->width,
					inCodecContext->height,
					AVPixelFormat::AV_PIX_FMT_BGR24,
					SWS_BICUBIC,
					NULL,
					NULL,
					NULL);
			

				sws_scale(cswsCtx_2,
					iframe->data,
					iframe->linesize,
					0,
					inCodecContext->height,
					&image.data,
					oframe->linesize
				);
				
			
				//clear 
				av_packet_unref(ipacket);
				 
				screenshotMessageQueue.push(image);
				if (!image.empty())
				{
					image.release();
				}
				sws_freeContext(cswsCtx_2);
			}
		}
	}
}