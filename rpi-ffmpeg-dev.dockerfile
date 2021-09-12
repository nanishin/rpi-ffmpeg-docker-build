FROM rpi_ffmpeg_env:latest

MAINTAINER Nani Shin <nani.shin@gmail.com>

RUN git clone https://github.com/FFmpeg/FFmpeg.git

WORKDIR /FFmpeg

#RUN ./configure --arch=armel --target-os=linux --enable-gpl --enable-omx --enable-omx-rpi --enable-libx264 --enable-nonfree --extra-libs=-latomic
# In docker build, OMX header files are not included in libraspberrypi-dev package.
# So --enable-omx --enable-omx-rpi options only can be included in case of direct build in raspberry pi
#pi@raspberrypi:~ $ dpkg -L libraspberrypi-dev | grep OMX
#/opt/vc/include/IL/OMX_Audio.h
#/opt/vc/include/IL/OMX_Broadcom.h
#/opt/vc/include/IL/OMX_Component.h
#/opt/vc/include/IL/OMX_Core.h
#/opt/vc/include/IL/OMX_ILCS.h
#/opt/vc/include/IL/OMX_IVCommon.h
#/opt/vc/include/IL/OMX_Image.h
#/opt/vc/include/IL/OMX_Index.h
#/opt/vc/include/IL/OMX_Other.h
#/opt/vc/include/IL/OMX_Types.h
#/opt/vc/include/IL/OMX_Video.h
#/opt/vc/include/interface/vmcs_host/khronos/IL/OMX_Audio.h
#/opt/vc/include/interface/vmcs_host/khronos/IL/OMX_Broadcom.h
#/opt/vc/include/interface/vmcs_host/khronos/IL/OMX_Component.h
#/opt/vc/include/interface/vmcs_host/khronos/IL/OMX_Core.h
#/opt/vc/include/interface/vmcs_host/khronos/IL/OMX_ILCS.h
#/opt/vc/include/interface/vmcs_host/khronos/IL/OMX_IVCommon.h
#/opt/vc/include/interface/vmcs_host/khronos/IL/OMX_Image.h
#/opt/vc/include/interface/vmcs_host/khronos/IL/OMX_Index.h
#/opt/vc/include/interface/vmcs_host/khronos/IL/OMX_Other.h
#/opt/vc/include/interface/vmcs_host/khronos/IL/OMX_Types.h
#/opt/vc/include/interface/vmcs_host/khronos/IL/OMX_Video.h

RUN ./configure --arch=armel --target-os=linux --enable-gpl --enable-libx264 --enable-nonfree --extra-libs=-latomic

RUN make -j 5
