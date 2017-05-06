= Instructions =

== Setup `rpxc` ==
```bash
mkdir ~/bin
echo "export PATH=$PATH:$HOME/bin >> ~/.bashrc"
docker run sdthirlwall/raspberry-pi-cross-compiler > ~/bin/rpxc
chmod +x ~/bin/rpxc
```

== Setup FFmpeg build image ==
```bash
./docker-build.sh
./build.sh
cd output
scp *.deb pi@raspberrypi.local:.
```

== Install packages on Raspberry Pi ==
```bash
sudo dpkg -i x264*deb
sudo dpkg -i alsa-lib*deb
sudo dpkg -i ffmpeg*deb
```
