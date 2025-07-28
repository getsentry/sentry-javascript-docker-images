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
  gnupg \
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

update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 10

# install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

apt-get update
apt-get install -y --no-install-recommends yarn

apt-get clean
rm -rf /var/lib/apt/lists/*

EOF

CMD ["/bin/bash"]
