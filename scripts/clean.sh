#!/bin/bash

source config

for d in x264 alsa-lib ffmpeg ; do
	pushd ${TOP}/src/${d}
	git clean -fxd
	popd
done

