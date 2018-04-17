FROM buildpack-deps:jessie

# Install OpenCV
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
  libopencv-dev=2.4.9.1+dfsg-1+deb8u1

# Install Python
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
  python=2.7.9-1 \
  python-dev=2.7.9-1 \
  python-pip=1.5.6-5 \
  python-setuptools=5.5.1-1 \
  python-opencv=2.4.9.1+dfsg-1+deb8u1 \
  python-matplotlib=1.4.2-3.1 \
  python-skimage=0.10.1-2

# Install dlib dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
  build-essential=11.7 \
  cmake=3.0.2-1+deb8u1 \
  gfortran=4:4.9.2-2 \
  git=1:2.1.4-2.1+deb8u5 \
  wget=1.16-1+deb8u4 \
  curl=7.38.0-4+deb8u10 \
  graphicsmagick=1.3.20-3+deb8u2 \
  libgraphicsmagick1-dev=1.3.20-3+deb8u2 \
  libatlas-dev=3.10.2-7 \
  libavcodec-dev=6:11.12-1~deb8u1 \
  libavformat-dev=6:11.12-1~deb8u1 \
  libavdevice-dev=6:11.12-1~deb8u1 \
  libavfilter-dev=6:11.12-1~deb8u1 \
  libavresample-dev=6:11.12-1~deb8u1 \
  libavutil-dev=6:11.12-1~deb8u1 \
  libboost-all-dev=1.55.0.2 \
  libgtk2.0-dev=2.24.25-3+deb8u2 \
  libjpeg-dev=1:1.3.1-12 \
  liblapack-dev=3.5.0-4 \
  libswscale-dev=6:11.11-1~deb8u1 \
  pkg-config=0.28-1 \
  python-numpy=1:1.8.2-2 \
  python-protobuf=2.6.1-1 \
  software-properties-common=0.92.25debian1 \
  zip=3.0-8

# Install dlib
RUN cd ~ && \
    mkdir -p dlib && \
    wget https://github.com/davisking/dlib/archive/v19.4.tar.gz && \
    tar -xvzf v19.4.tar.gz && \
    cd  dlib-19.4/ && \
    python setup.py install --yes USE_AVX_INSTRUCTIONS
