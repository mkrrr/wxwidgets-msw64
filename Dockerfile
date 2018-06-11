################################################################################
# base system
################################################################################
FROM mkrrr/docker-ubuntu-vnc-desktop:latest as system

################################################################################
# Dev
################################################################################
RUN apt-get update && apt-get -y upgrade 


RUN apt-get -y --no-install-recommends install \
  mingw-w64 wget

RUN update-alternatives --set i686-w64-mingw32-g++ /usr/bin/i686-w64-mingw32-g++-posix
RUN update-alternatives --set i686-w64-mingw32-gcc /usr/bin/i686-w64-mingw32-gcc-posix
RUN wget https://github.com/wxWidgets/wxWidgets/releases/download/v3.1.1/wxWidgets-3.1.1.tar.bz2 \
    && tar -xvjf wxWidgets-3.1.1.tar.bz2 \
    && cd wxWidgets-3.1.1 && mkdir build_w64 && cd build_w64 && \
    ../configure --prefix=/usr/i686-w64-mingw32/ --host=i686-w64-mingw32 --build=i686-linux && make

