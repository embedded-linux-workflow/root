FROM ubuntu:20.04

# To avoid this data-enter request, especially when such build is running on CI like Jenkins 
ENV TZ=Europe/Stockholm
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install the 32-bit toolchain for a 32-bit kernel
RUN apt-get update && apt-get install -y \
    crossbuild-essential-armhf \
&& rm -rf /var/lib/apt/lists/*

# Install the 64-bit toolchain for a 64-bit kernel
RUN apt-get update && apt-get install -y \
    crossbuild-essential-arm64 \
&& rm -rf /var/lib/apt/lists/*

# Minimal requirements to compile the Kernel
RUN apt-get update && apt-get install -y \
    git \
    bc \
    bison \
    flex \
    libssl-dev \
    make \
    libc6-dev \
    libncurses5-dev \
    git \
&& rm -rf /var/lib/apt/lists/*

#Add default user
RUN useradd -ms /bin/bash rpi-user

# Get Linux
 RUN cd /home/rpi-user \
    && git clone --progress --verbose --depth=1 --branch rpi-5.4.y https://github.com/raspberrypi/linux.git

 
# Change owner to rpi-user.
RUN chown -R rpi-user:rpi-user /home/rpi-user


USER rpi-user
WORKDIR /home/rpi-user/linux
ENV HOME /home/rpi-user

