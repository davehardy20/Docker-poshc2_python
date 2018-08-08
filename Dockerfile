# From the Kali linux base image
FROM kalilinux/kali-linux-docker:latest

# Update and apt install programs. Don't dist-upgrade with docker.
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
openssh-server \
python \
python-pip \
curl \
git \
screen \
python-setuptools \
python-dev \
build-essential \
mingw-w64-tools \
mingw-w64 \
mingw-w64-x86-64-dev \
mingw-w64-i686-dev \
mingw-w64-common \
espeak \
tmux \
wget \
graphviz

RUN mkdir /opt/PoshC2_Python
RUN git clone https://github.com/nettitude/PoshC2_Python /opt/PoshC2_Python/
RUN pip install -r /opt/PoshC2_Python/requirements.txt
RUN wget https://raw.githubusercontent.com/davehardy20/Docker-poshc2_python/master/tmux-sessions.sh -P /root/
RUN chmod +x /root/tmux-sessions.sh

EXPOSE 80
EXPOSE 443

# Set the working directory
WORKDIR /opt/PoshC2_Python
#CMD [ "/root/tmux-sessions.sh" ]