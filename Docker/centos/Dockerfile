FROM centos:7
LABEL maintainer="diodonfrost <diodon.frost@diodonfrost.me>"

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Install systemd -- See https://hub.docker.com/_/centos/
RUN yum -y swap -- remove fakesystemd -- install systemd systemd-libs && yum clean all
RUN yum -y update && yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*; \
rm -f /etc/systemd/system/*.wants/*; \
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*; \
rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN yum -y install \
           git \
           python3-pip \
           sudo \
           openssh-server \
           openssh-clients \
           unzip \
           rsync \
           which \
           fuse-libs \
           && yum clean all

RUN python3 -m pip install pip==21.3.1 && \
    python3 -m pip install ansible==2.10.7

RUN sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/'  /etc/sudoers

RUN mkdir /etc/ansible && \
    echo -e '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts

VOLUME ["/sys/fs/cgroup"]

ENTRYPOINT ["/usr/sbin/init"]









# FROM centos:7


# # Install indenpendent packages
# RUN yum -y install \
# iproute \
# net-tools \
# openssh openssh-clients openssh-server

# # Install packages with dependencies (not required)
# # RUN yum -y install \
# # ansible

# # Setup image to automatically allow SSH
# RUN mkdir /root/.ssh
# RUN chmod 700 /root/.ssh && chown root:root /root/.ssh
# WORKDIR /root/.ssh
# # Inject public key inside the image as an authorized key file
# COPY id_rsa.pub authorized_keys
# # Change ownership of the authorized key file to root
# RUN chmod 600 authorized_keys && chown root:root authorized_keys
# # Change work directory to top-level
# WORKDIR /
# # Expose SSH port
# EXPOSE 22

# CMD ["/usr/lib/systemd/systemd"]