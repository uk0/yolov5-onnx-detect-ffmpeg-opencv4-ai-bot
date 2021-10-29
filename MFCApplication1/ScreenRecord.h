//
// Created by zhangtao on 2019/9/3.
//

#ifndef SCEENRECORD_H264_SCREENRECORD_H
#define SCEENRECORD_H264_SCREENRECORD_H


#include <iostream>

#include "glvar.h"

extern "C"
{
#include "libavcodec/avcodec.h"
#include "libavcodec/avfft.h"
#include "libavdevice/avdevice.h"
#include "libavfilter/avfilter.h"
#include "libavfilter/buffersink.h"
#include "libavfilter/buffersrc.h"
#include "libavformat/avformat.h"
#include "libavformat/avio.h"
#include "libavutil/opt.h"
#include "libavutil/common.h"
#include "libavutil/channel_layout.h"
#include "libavutil/imgutils.h"
#include "libavutil/mathematics.h"
#include "libavutil/samplefmt.h"
#include "libavutil/time.h"
#include "libavutil/opt.h"
#include "libavutil/pixdesc.h"
#include "libavutil/file.h"
#include "libswscale/swscale.h"
#include <libavcodec/avcodec.h>
#include <libavformat/avformat.h>
#include <libswscale/swscale.h>
};


#pragma comment (lib, "avcodec.lib")
#pragma comment (lib, "avdevice.lib")
#pragma comment (lib, "avfilter.lib")
#pragma comment (lib, "avformat.lib")
#pragma comment (lib, "avutil.lib")
#pragma comment (lib, "postproc.lib")
#pragma comment (lib, "swresample.lib")
#pragma comment (lib, "swscale.lib")




typedef struct StreamContext {
	AVCodecContext *dec_ctx;
	AVCodecContext *enc_ctx;
} StreamContext;

class ScreenRecord {
private:
	AVFormatContext *inFormatContext;
	AVFormatContext *outFormatContext;

	AVInputFormat *avInputFormat;
	AVOutputFormat *avOutputFormat;

	int VideoStreamIndx = -1;

	AVCodecContext *inCodecContext;
	AVCodecContext *outCodecContext;

	AVCodec *inCodec;
	AVCodec *outCodec;

	StreamContext *stream_ctx;
	AVStream *outStream;
	AVStream *inStream;
public:

	ScreenRecord();

	~ScreenRecord();

	int openDevice();
	int getScreenShotForFFmpeg();
	int getScreenShotForFFmpeg2();

	// int init_outputfile();

	// int CaptureVideoFrames();

};

#endif //SCEENRECORD_H264_SCREENRECORD_H
