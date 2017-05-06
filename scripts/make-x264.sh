#!/bin/bash

source config

cd ${SRC_DIR}/x264

# Configure
CFLAGS=--sysroot=${SYSROOT} \
LDFLAGS=--sysroot=${SYSROOT} \
	./configure \
		--host=${HOST} \
		--cross-prefix=${CROSS_COMPILE} \
		--enable-static \
		--extra-cflags='-march=armv6' \
		--extra-ldflags='-march=armv6' \
		--disable-asm \
		--prefix=/usr

# Build
make DESTDIR=${TEMP_DESTDIR} -j${NCORES} install

# Make Deb
checkinstall \
	-A armhf \
	-Dy \
	--install=no \
	--nodoc \
	--pkgname='x264' \
	--pakdir='${TEMP_DESTDIR}' \
	--pkgversion='0.git' \
	make install
