# General build RPM environment for CentOS 6.x
#
# VERSION       0.0.2
FROM centos:centos6
MAINTAINER Trevor Hartman

# Install up-to-date epel rpm repository
# Install various packages to get compile environment
# Install git command to access GitHub repository
# Install rpm-build to use rpmrebuild command
# Install yum-utils to use yumdownloader command
# Install rpmdevtools to use rpmdev-setuptree command
# Setup rpm build configuration for root user
# Setup rpm build configuration for general user 'build'
RUN yum -y install http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm \
    && yum -y groupinstall 'Development Tools' \
    && yum -y install git tar rpm-build yum-utils rpmdevtools php54-pear python-setuptools npm php54-cli \
                      gcc g++ make automake autoconf curl-devel openssl-devel zlib-devel httpd-devel \
                      apr-devel apr-util-devel sqlite-devel ruby ruby-rdoc ruby-devel rubygems php54-devel \  
    && gem install fpm \
    && rpmdev-setuptree \
    && echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros \
    && yum -y install sudo \
    && sed -i 's/requiretty/!requiretty/' /etc/sudoers \
    && echo 'build ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && useradd -d /home/build -p `openssl passwd -1 "build"` build \
    && sudo -ubuild rpmdev-setuptree \
    && sudo -ubuild echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros

# Set environment variables
ENV HOME /root
WORKDIR /root/rpmbuild

# Set default `docker run` command behavior
CMD [ "fpm" ]
