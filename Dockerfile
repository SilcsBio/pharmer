FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:ubuntu-toolchain-r/test && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential wget git cmake python gfortran zlib1g zlib1g-dev
#    apt-get install -y gcc-4.9 g++-4.9 gfortran-4.9 gcc-4.9-base && \
#    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 100 && \
#    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 100 && \
#    update-alternatives --install /usr/bin/gforran gfortran /usr/bin/gfortran-4.9 100 


#
# install various dependencies
#

WORKDIR /usr/local/src

# add git token
RUN git config --global url."https://140dfbafd33a8cd092cef85885ad787d72e7ccf5:@github.com/".insteadOf "https://github.com/"

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

# GOSU for docker image permission issue
RUN apt-get update && apt-get -y --no-install-recommends install \
    ca-certificates \
    curl

RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.4/gosu-$(dpkg --print-architecture)" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.4/gosu-$(dpkg --print-architecture).asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu

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
# entrypoint
#

#COPY entrypoint.sh /usr/local/bin/entrypoint.sh
#RUN chmod +x /usr/local/bin/entrypoint.sh

#ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
