#!/bin/sh

export DOCKER_BUILDKIT=0

RPI_FFMPEG_ENV_DOCKERFILE=rpi-ffmpeg-env.dockerfile
RPI_FFMPEG_ENV_IMAGE=rpi_ffmpeg_env
RPI_FFMPEG_DEV_DOCKERFILE=rpi-ffmpeg-dev.dockerfile
RPI_FFMPEG_DEV_IMAGE=rpi_ffmpeg_dev

# 1. Check docker env image for RPI FFmpeg environment
CHECK_BASE_IMAGE=`docker images | awk '{print $1}' | grep $RPI_FFMPEG_ENV_IMAGE`
if [ -z $CHECK_BASE_IMAGE ]
then
    docker build --rm -t $RPI_FFMPEG_ENV_IMAGE -f $RPI_FFMPEG_ENV_DOCKERFILE .
else
    echo "Found docker image - $CHECK_BASE_IMAGE. So skip to build env image"
fi

# 2. Check docker dev image for RPI FFmpeg development
CHECK_DEV_IMAGE=`docker images | awk '{print $1}' | grep $RPI_FFMPEG_DEV_IMAGE`
if [ -z $CHECK_DEV_IMAGE ]
then
    docker build --rm -t $RPI_FFMPEG_DEV_IMAGE -f $RPI_FFMPEG_DEV_DOCKERFILE .
else
    echo "Found docker image - $CHECK_DEV_IMAGE. So skip to build dev image"
fi

