#!/bin/bash
git clone https://github.com/NVIDIA-AI-IOT/deepstream_python_apps
apt install python3-gi python3-dev python3-gst-1.0 python-gi-dev git python-dev -y &&\
    python3 python3-pip python3.8-dev cmake g++ build-essential libglib2.0-dev -y &&\
    libglib2.0-dev-bin python-gi-dev libtool m4 autoconf automake -y
cd deepstream_python_apps/bindings/
git submodule update --init
apt-get install -y apt-transport-https ca-certificates -y
update-ca-certificates
cd ../3rdparty/gst-python/
./autogen.sh
make && make install
ldconfig
cd ../../bindings
mkdir build && cd build
cmake ..
make
apt install libgirepository1.0-dev libcairo2-dev -y
#pip install ./pyds-1.1.2-py3-none*.whil
pip install ./pyds-1.1.3-py3-none-linux_x86_64.whl
cd ../../../
mv mahi_logi/ deepstream_python_apps/apps

#mv Fire-detection deepstream_python_apps/apps/
#rm -rf  deepstream_python_apps/apps/deepstream*
#rm -rf demo*
