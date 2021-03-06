FROM nvcr.io/nvidia/deepstream:6.1-devel
RUN apt-get update
RUN apt install python3-gi python3-dev python3-gst-1.0 -y
RUN apt-get install python3-pip python-dev -y
RUN apt-get install -y build-essential
RUN pip3 install --upgrade pip
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN pip install setuptools --upgrade
RUN apt-get install libglib2.0 libglib2.0-dev
RUN apt-get install libjansson4  libjansson-dev
#RUN apt-get install librdkafka1=0.11.3-1build1

RUN pip install pymongo
#RUN pip install confluent_kafka
RUN apt-get install -y python3-opencv
RUN pip install pyyaml
WORKDIR /opt/nvidia/deepstream/deepstream/sources/
COPY . .
RUN bash ./bind.sh
WORKDIR /opt/nvidia/deepstream/deepstream-6.1/sources/deepstream_python_apps/apps/mahi_logi
CMD echo "runing program"
