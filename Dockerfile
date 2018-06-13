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

RUN update-alternatives --set x86_64-w64-mingw32-g++ /usr/bin/x86_64-w64-mingw32-g++-posix
RUN update-alternatives --set x86_64-w64-mingw32-gcc /usr/bin/x86_64-w64-mingw32-gcc-posix
RUN wget https://github.com/wxWidgets/wxWidgets/releases/download/v3.1.0/wxWidgets-3.1.0.tar.bz2 \
    && tar -xvjf wxWidgets-3.1.0.tar.bz2 \
    && cd wxWidgets-3.1.0 && mkdir build_w64 && cd build_w64 && \
    ../configure --prefix=/usr/x86_64-w64-mingw32/ --host=x86_64-w64-mingw32 --build=x86_64-linux --disable-unicode --enable-monolithic --disable-shared CFLAGS=-m64 CXXFLAGS=-m64 LDFLAGS=-m64 && make

