FROM jenkins/jenkins:2.387.2

# RUN set -xe \
#     && apt-get update \
#     && apt-get install -y python3-pip

# RUN add-apt-repository \
#    "deb [arch=amd64] https://download.docker.com/linux/debian \
#    $(lsb_release -cs) \
#    stable"
# RUN apt-get update  -qq \
#     && apt-get -y install docker-ce-cli:amd64
# RUN usermod -aG docker jenkins


# FROM jenkins/jenkins:2.387.2
# ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# USER 0
# EXPOSE 8080
# EXPOSE 50000


# CMD /bin/bash
# RUN apt-get install -y curl
# RUN apt-get install -y grep
# RUN apt-get install -y inetutils-ping
# RUN apt-get install -y nmap
# RUN apt-get install -y procps
# RUN apt-get install -y sudo
# RUN apt-get install -y tree
# RUN apt-get install -y unzip
# RUN apt-get install -y zip

# RUN apt-get install -y --no-install-recommends cron && \
#     rm -r /var/lib/apt/lists/*

# Install - redhat-lsb-core-4.1-27.el7.1.aarch64 : LSB Core module support
# RUN yum install -y redhat-lsb-core
# # Install - epel-release-7-11.noarch : Extra Packages for Enterprise Linux repository configuration
# RUN yum install -y epel-release; \
#     yum install -y ansible
# # Install PAM and SELinux Headers
# RUN yum install -y pam-devel libselinux-devel
# # Update - OpenSSH
# # RUN wget -c  https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.0p1.tar.gz && \
# #     tar -xzf  openssh-9.0p1.tar.gz && \
# #     cd openssh-9.0p1/; \
# #     ./configure  --with-pam --with-selinux --with-privsep-path=/var/lib/sshd/ --sysconfdir=/etc/ssh; \
# #     make; \
# #     make install

# # Essential Packages
# RUN echo; \
#     yum install -y ac; \
#     yum install -y curl; \
#     yum install -y grep; \
#     yum install -y ln; \
#     yum install -y openssh; \
#     yum install -y python2 python3; \
#     yum install -y sendmail; \
#     yum install -y tac tree; \
#     yum install -y wget; \
#     yum install -y zgrep zip; \
#     echo


# ENV LANG en_US.UTF-8
# ENV LC_ALL en_US.UTF-8

# Configure YUM repositories to allow installations
# RUN cd /etc/yum.repos.d/
# RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
# RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# RUN yum check-update; \
#     # yum install -y gcc libffi-devel python3 epel-release; \
#     # yum install -y gcc openssl-devel bzip2-devel libffi-devel zlib-devel -y; \
#     yum install -y python3; \
#     yum install -y pypi; \
#     yum install -y wget; \
#     yum install -y grep; \
#     yum install -y sudo; 
    # yum install -y tree
    # yum clean all
# RUN pip3 install --upgrade pip; \
#     pip3 install --upgrade virtualenv; \
#     pip3 install pywinrm[kerberos]; \
#     pip3 install pywinrm; \
#     pip3 install jmspath; \
#     pip3 install requests; \
#     python3 -m pip install ansible; \
#     ansible-galaxy collection install azure.azcollection; \
#     pip3 install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements-azure.txt

# ENTRYPOINT [ "echo" ]