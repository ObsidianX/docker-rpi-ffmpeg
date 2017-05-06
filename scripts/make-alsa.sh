#!/bin/bash

source config

cd ${SRC_DIR}/alsa-lib

# Configure
CFLAGS=--sysroot=${SYSROOT} \
LDFLAGS=--sysroot=${SYSROOT} \
GITCOMPILE_NO_MAKE=1 \
	./gitcompile \
		--host=${HOST} \
		--prefix=/usr

# Build
make -j${NCORES} DESTDIR=${TEMP_DESTDIR} install

# Make Deb
fakeroot checkinstall \
	-A armhf \
	-Dy \
	--install=no \
	--nodoc \
	--pkgname='alsa-lib' \
	--pakdir='${TEMP_DESTDIR}' \
	--pkgversion='0.git' \
	--provides=libasound2-data \
	--replaces=libasound2-data \
	--fstrans=no \
	make install
