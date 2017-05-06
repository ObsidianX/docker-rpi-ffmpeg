
all: x264 alsa ffmpeg

prepare: $(TEMP_DESTDIR)
	@echo Creating output directory...
	@mkdir -p $(TEMP_DESTDIR)

docker:
	@echo Building Docker image...
	@scripts/docker-build.sh

x264: prepare
	@echo Building libx264...
	@rpxc scripts/make-x264.sh

alsa: prepare
	@echo Building alsa-lib...
	@rpxc scripts/make-alsa.sh

ffmpeg: prepare
	@echo Building FFmpeg...
	@rpxc scripts/make-ffmpeg.sh

clean:
	@echo Cleaning source folders...
	@scripts/clean.sh
