FROM ubuntu:22.04
LABEL maintainer="diodonfrost <diodon.frost@diodonfrost.me>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
ansible \
apt-transport-https \
ca-certificates-java \
curl \
fuse
git \
init \
openssh-server openssh-client \
rsync \
snap-confine snapd squashfuse \
sudo \
unzip \
&& rm -rf /var/lib/apt/lists/*

# Configure udev for docker integration
RUN dpkg-divert --local --rename --add /sbin/udevadm && ln -s /bin/true /sbin/udevadm

RUN mkdir /etc/ansible && echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

ENTRYPOINT ["/sbin/init"]