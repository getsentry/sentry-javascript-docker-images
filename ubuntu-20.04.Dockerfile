# Dockerfile for building a development environment based on Ubuntu 20.04
#
# This is primarily used for building Node.js native modules that support
# Linux distros still using older versions of glibc.

FROM ubuntu:focal-20240530

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN /bin/bash <<EOF
set -euxo pipefail
apt-get update
apt-get install -y --no-install-recommends \
  build-essential \
  ca-certificates \
  curl \
  autoconf \
  automake \
  bc \
  cmake \
  gcc-10 \
  g++-10 \
  git \
  git-lfs \
  libclang-dev \
  libtool
apt-get clean
rm -rf /var/lib/apt/lists/*
EOF

CMD ["/bin/bash"]
