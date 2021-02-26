FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:ubuntu-toolchain-r/test && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential wget git cmake python gfortran zlib1g zlib1g-dev

#
# install various dependencies
#

WORKDIR /usr/local/src

# cmake
RUN wget "https://github.com/Kitware/CMake/releases/download/v3.17.2/cmake-3.17.2.tar.gz" && \
    tar -xvzf cmake-3.17.2.tar.gz && \
    cd cmake-3.17.2 && cmake . -DCMAKE_USE_OPENSSL=OFF && make -j4 && make install 
RUN rm -f /usr/local/src/cmake-3.17.2.tar.gz

# boost library

RUN wget "https://downloads.sourceforge.net/project/boost/boost/1.63.0/boost_1_63_0.tar.gz" && \
    tar -xzf boost_1_63_0.tar.gz && \
    cd boost_1_63_0 && \
    ./bootstrap.sh --with-libraries=regex,thread,serialization,date_time,filesystem,iostreams,program_options && \
    ./b2 -j4 --link=static && \
    ./b2 -j4 install
RUN rm -f /usr/local/src/boost_1_63_0.tar.gz

# openbabel

RUN wget "https://github.com/openbabel/openbabel/archive/openbabel-2-4-1.tar.gz" && \
    tar -xzf openbabel-2-4-1.tar.gz && \
    cd openbabel-openbabel-2-4-1 && \
    mkdir build && cd build && cmake .. -DBUILD_SHARED=OFF && make -j4 && make install
RUN rm -f /usr/local/src/openbabel-2-4-1.tar.gz

# jsoncpp

RUN wget "https://github.com/open-source-parsers/jsoncpp/archive/00.11.0.tar.gz" && \
    tar -xzf 00.11.0.tar.gz && \
    cd jsoncpp-00.11.0/ && cmake . && make -j4 && make install
RUN rm -f /usr/local/src/00.11.0.tar.gz

# eigen3

RUN apt-get install -y libeigen3-dev

# gperftools

RUN wget "https://github.com/gperftools/gperftools/releases/download/gperftools-2.7/gperftools-2.7.tar.gz" && \
    tar -xvzf gperftools-2.7.tar.gz && \
    cd gperftools-2.7 && ./configure && make -j4 && make install 
RUN rm -f /usr/local/src/gperftools-2.7.tar.gz

#
# compile pharmer
#

COPY . /pharmer

WORKDIR /pharmer/Release
RUN make clean ; make all

#RUN chmod +x /usr/local/bin/entrypoint.sh

#ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
