FROM debian:stretch-backports
MAINTAINER piotr.krol@3mdeb.com

ENV http_proxy ${http_proxy}

RUN \
    useradd -p locked -m isar && \
    apt-get -qq update && \
    apt-get -qqy install \
        dosfstools \
        git \
        debootstrap \
        dpkg-dev \
        parted \
        python3 \
        qemu \
        qemu-user-static \
        binfmt-support \
        sudo \
        reprepro \
    && apt-get clean

ENV PATH="/usr/lib/ccache:${PATH}"
RUN mkdir /home/isar/.ccache && \
    chown isar:isar /home/isar/.ccache


