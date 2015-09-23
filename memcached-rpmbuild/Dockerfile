# Build image for php54-pecl-memcached v2.2.0
#
# VERSION       0.0.1
FROM thartman/centos_rpmbuild
MAINTAINER Trevor Hartman

# Add pecl memcached dependencies.
ADD libmemcached10-devel-1.0.16-1.ius.centos6.x86_64.rpm /root/3rdparty/libmemcached10-devel-1.0.16-1.ius.centos6.x86_64.rpm
ADD libmemcached10-1.0.16-1.ius.centos6.x86_64.rpm /root/3rdparty/libmemcached10-1.0.16-1.ius.centos6.x86_64.rpm
ADD memcached-1.4.13-1.el6.x86_64.rpm /root/3rdparty/memcached-1.4.13-1.el6.x86_64.rpm
# Setup build dependencies.
# Add IUS repo for php54-devel packages
RUN yum -y --nogpgcheck localinstall /root/3rdparty/libmemcached10-devel-1.0.16-1.ius.centos6.x86_64.rpm /root/3rdparty/libmemcached10-1.0.16-1.ius.centos6.x86_64.rpm /root/3rdparty/memcached-1.4.13-1.el6.x86_64.rpm \
    && yum -y install https://dl.iuscommunity.org/pub/ius/stable/CentOS/6/x86_64/ius-release-1.0-14.ius.centos6.noarch.rpm \
    && yum -y install php54-devel

# Add pecl memcached source and build script.
## Note using ADD instead of COPY will automatically uncompress, which may be undesirable if the size is too large.
ADD memcached-2.2.0.tgz /root/fpm_build/
ADD build.sh /root/build.sh

# Set default `docker run` command behavior
CMD [ "/root/build.sh" ]
