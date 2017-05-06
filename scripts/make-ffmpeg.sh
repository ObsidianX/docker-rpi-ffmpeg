#!/bin/bash

source config

cd ${SRC_DIR}/ffmpeg

# Configure
#pkg_config="$(which pkg-config)" \
#CFLAGS="--sysroot=${SYSROOT} -I${TEMP_DESTDIR}/usr/include" \
#LDFLAGS="--sysroot=${SYSROOT} -L${TEMP_DESTDIR}/usr/lib" \
#PKG_CONFIG_PATH=${SYSROOT}/usr/lib/${HOST}/pkgconfig:${TEMP_DESTDIR}/usr/lib/pkgconfig \
#	./configure \
#		--enable-cross-compile \
#		--sysroot=${SYSROOT} \
#		--cross-prefix=${CROSS_COMPILE} \
#		--arch=armel \
#		--target-os=linux \
#		--prefix=/usr \
#		--enable-gpl \
#		--enable-nonfree \
#		--enable-libx264 \
#		--enable-libv4l2

# Build (multiple threads causes issues)
#make DESTDIR=${TEMP_DESTDIR} -j${NCORES} install

# Make Deb
checkinstall \
	-A armhf \
	-Dy \
	--install=no \
	--nodoc \
	--pkgname="ffmpeg" \
	--pkgversion="0.git" \
	--pakdir="${TEMP_DESTDIR}" \
	--fstrans=no \
	make install
