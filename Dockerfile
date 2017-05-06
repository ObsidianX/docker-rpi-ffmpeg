FROM sdthirlwall/raspberry-pi-cross-compiler

RUN install-debian --update checkinstall libtool pkg-config fakeroot

RUN install-raspbian --update libass-dev libfreetype6-dev libtheora-dev libvorbis-dev texinfo zlib1g-dev libv4l-dev
