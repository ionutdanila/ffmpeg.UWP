#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

echo "Make UWP"

if [ "$1" == "x86" ]; then
	echo "Make UWP x86"
	pushd $DIR/ffmpeg
	rm -rf Output/UWP/x86
	mkdir -p Output/UWP/x86
	cd Output/UWP/x86
	../../../configure \
	--toolchain=msvc \
	--disable-programs \
	--disable-doc \
	--arch=x86 \
	--target-os=win32 \
	--extra-cflags="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_APP -D_WIN32_WINNT=0x0A00" \
	--extra-ldflags="-APPCONTAINER WindowsApp.lib" \
	--disable-everything \
	--disable-debug \
	--enable-thumb \
	--enable-shared \
	--enable-cross-compile \
	--enable-d3d11va \
	--disable-dxva2 \
	--enable-small \
	--enable-network \
	--enable-runtime-cpudetect \
	--enable-decoder=mjpeg,mpeg4,mpegvideo,h264,flv,rawvideo,flashsv,flashsv2 \
	--enable-decoder=h264_dxva2,nellymoser,adpcm_swf,aac,pcm_alaw,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8 \
	--enable-parser=mpeg4video,mpegaudio,mpegvideo,h261,h264 \
	--enable-demuxer=mpegvideo,h264,rtsp,flv,mjpeg,rawvideo,mpegts,rm,sdp,mpjpeg,h263 \
	--enable-protocol=http,tcp,udp \
	--enable-hwaccel=h264_dxva2,h264_d3d11va,h264_d3d11va2,h264_cuvid \
	--prefix=../../../../Build/x86
	make -j8
	make install
	popd

elif [ "$1" == "x64" ]; then
	echo "Make UWP x64"
	pushd $DIR/ffmpeg
	rm -rf Output/UWP/x64
	mkdir -p Output/UWP/x64
	cd Output/UWP/x64
	../../../configure \
	--toolchain=msvc \
	--disable-programs \
	--disable-doc \
	--arch=x86_64 \
	--target-os=win32 \
	--extra-cflags="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_APP -D_WIN32_WINNT=0x0A00" \
	--extra-ldflags="-APPCONTAINER WindowsApp.lib" \
	--disable-everything \
	--disable-debug \
	--enable-thumb \
	--enable-shared \
	--enable-cross-compile \
	--enable-d3d11va \
	--disable-dxva2 \
	--enable-small \
	--enable-network \
	--enable-runtime-cpudetect \
	--enable-decoder=mjpeg,mpeg4,mpegvideo,h264,flv,rawvideo,flashsv,flashsv2 \
	--enable-decoder=h264_dxva2,nellymoser,adpcm_swf,aac,pcm_alaw,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8 \
	--enable-parser=mpeg4video,mpegaudio,mpegvideo,h261,h264 \
	--enable-demuxer=mpegvideo,h264,rtsp,flv,mjpeg,rawvideo,mpegts,rm,sdp,mpjpeg,h263 \
	--enable-protocol=http,tcp,udp \
	--enable-hwaccel=h264_dxva2,h264_d3d11va,h264_d3d11va2,h264_cuvid \
	--prefix=../../../../Build/x64
	make -j8
	make install
	popd

elif [ "$1" == "ARM" ]; then
	echo "Make UWP ARM"
	pushd $DIR/ffmpeg
	rm -rf Output/UWP/ARM
	mkdir -p Output/UWP/ARM
	cd Output/UWP/ARM
	../../../configure \
	--toolchain=msvc \
	--disable-programs \
	--disable-doc \
	--arch=arm \
	--as=armasm \
	--cpu=armv7 \
	--target-os=win32 \
	--extra-cflags="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_APP -D_WIN32_WINNT=0x0A00 -D__ARM_PCS_VFP" \
	--extra-ldflags="-APPCONTAINER WindowsApp.lib" \
	--disable-everything \
	--disable-debug \
	--enable-thumb \
	--enable-shared \
	--enable-cross-compile \
	--enable-d3d11va \
	--disable-dxva2 \
	--enable-small \
	--enable-network \
	--enable-runtime-cpudetect \
	--enable-decoder=mjpeg,mpeg4,mpegvideo,h264,flv,rawvideo,flashsv,flashsv2 \
	--enable-decoder=h264_dxva2,nellymoser,adpcm_swf,aac,pcm_alaw,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8 \
	--enable-parser=mpeg4video,mpegaudio,mpegvideo,h261,h264 \
	--enable-demuxer=mpegvideo,h264,rtsp,flv,mjpeg,rawvideo,mpegts,rm,sdp,mpjpeg,h263 \
	--enable-protocol=http,tcp,udp \
	--enable-hwaccel=h264_dxva2,h264_d3d11va,h264_d3d11va2,h264_cuvid \
	--prefix=../../../../Build/ARM
	make -j8
	make install
	popd
	
elif [ "$1" == "ARM64" ]; then
	echo "Make UWP ARM64"
	pushd $DIR/ffmpeg
	rm -rf Output/UWP/ARM64
	mkdir -p Output/UWP/ARM64
	cd Output/UWP/ARM64
	../../../configure \
	--toolchain=msvc \
	--disable-programs \
	--disable-doc \
	--arch=arm64 \
	--target-os=win32 \
	--extra-cflags="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_APP -D_WIN32_WINNT=0x0A00 -D__ARM_PCS_VFP" \
	--extra-ldflags="-APPCONTAINER WindowsApp.lib" \
	--disable-everything \
	--disable-debug \
	--enable-thumb \
	--enable-shared \
	--enable-cross-compile \
	--enable-d3d11va \
	--disable-dxva2 \
	--enable-small \
	--enable-network \
	--enable-runtime-cpudetect \
	--enable-decoder=mjpeg,mpeg4,mpegvideo,h264,flv,rawvideo,flashsv,flashsv2 \
	--enable-decoder=h264_dxva2,nellymoser,adpcm_swf,aac,pcm_alaw,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8 \
	--enable-parser=mpeg4video,mpegaudio,mpegvideo,h261,h264 \
	--enable-demuxer=mpegvideo,h264,rtsp,flv,mjpeg,rawvideo,mpegts,rm,sdp,mpjpeg,h263 \
	--enable-protocol=http,tcp,udp \
	--enable-hwaccel=h264_dxva2,h264_d3d11va,h264_d3d11va2,h264_cuvid \
	--prefix=../../../../Build/ARM64
	make -j8
	make install
	popd

fi

exit 0