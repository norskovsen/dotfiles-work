#!/bin/bash
sudo apt install build-essential git nitrogen rofi python3-pip binutils gcc make pkg-config fakeroot cmake-data cmake python3-xcbgen xcb-proto wireless-tools libiw-dev libasound2-dev libpulse-dev libcurl4-openssl-dev libmpdclient-dev libjsoncpp-dev libasound2-dev libcurl3-dev python3-sphinx python3-packaging python3 pkg-config clang libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev -y

cd /tmp/
git clone https://github.com/jaagr/polybar
# shellcheck disable=SC2164
cd polybar
# shellcheck disable=SC2164
USE_GCC=ON ENABLE_I3=ON ENABLE_ALSA=ON ENABLE_PULSEAUDIO=ON ENABLE_NETWORK=ON ENABLE_MPD=ON ENABLE_CURL=ON ENABLE_IPC_MSG=ON INSTALL=OFF INSTALL_CONF=OFF ./build.sh -f
# shellcheck disable=SC2164
cd build
sudo make install
sudo make userconfig
cd ../..
rm -fr polybar
