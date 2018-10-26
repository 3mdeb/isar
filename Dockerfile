FROM debian:stretch-backports
MAINTAINER piotr.krol@3mdeb.com

ENV http_proxy ${http_proxy}

# Update the package repository
RUN apt-get update && apt-get upgrade -y && apt-get install -y locales

# Configure locales
# noninteractive installation using debconf-set-selections does not seem
# to work due to a bug in Debian glibc:
# https://bugs.launchpad.net/ubuntu/+source/glibc/+bug/1598326
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN \
    apt-get -qq update && \
    apt-get -qqy install \
        ccache \
        binfmt-support \
        debootstrap \
        dosfstools \
        dpkg-dev \
        git \
        parted \
        python3 \
        qemu \
        qemu-user-static \
        reprepro \
        sudo \
        vim \
    && apt-get clean

ENV PATH="/usr/lib/ccache:${PATH}"
