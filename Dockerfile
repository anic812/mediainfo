FROM ubuntu:22.04

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 LANGUAGE=en_US:en TZ=Asia/Kolkata

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    libtinyxml2-9 \
    libcurl3-gnutls \
    libmms0 \
    libzen0v5 \
    libcurl4-gnutls-dev \
    libzen-dev \
    wget \
    ffmpeg \
    mediainfo \
    libsox-fmt-mp3 \
    sox \
    locales \
    megatools \
  && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

RUN pip install --upgrade tgcrypto telegraph python-dotenv m3u8 requests bs4 https://github.com/KurimuzonAkuma/pyrogram/archive/refs/tags/v2.1.23.zip
COPY . .
RUN chmod +x start.sh
CMD ["bash", "start.sh"]
