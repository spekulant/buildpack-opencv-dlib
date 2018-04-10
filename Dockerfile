FROM buildpack-deps:jessie

# Install OpenCV
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
  libopencv-dev

# Install Python
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
  python \
  python-dev \
  python-pip \
  python-opencv \
  python-matplotlib \
  python-skimage

# Install dlib dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
  build-essential \
  cmake \
  gfortran \
  git \
  wget \
  curl \
  graphicsmagick \
  libgraphicsmagick1-dev \
  libatlas-dev \
  libavcodec-dev \
  libavformat-dev \
  libavdevice-dev \
  libavfilter-dev \
  libavresample-dev \
  libavutil-dev \
  libboost-all-dev \
  libgtk2.0-dev \
  libjpeg-dev \
  liblapack-dev \
  libswscale-dev \
  pkg-config \
  python-numpy \
  python-protobuf\
  software-properties-common \
  zip

# Install dlib
RUN cd ~ && \
    mkdir -p dlib && \
    wget https://github.com/davisking/dlib/archive/v19.4.tar.gz && \
    tar -xvzf v19.4.tar.gz && \
    cd  dlib-19.4/ && \
    python setup.py install --yes USE_AVX_INSTRUCTIONS
