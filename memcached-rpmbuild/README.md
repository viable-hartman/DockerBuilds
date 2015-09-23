# Docker centos-memcached build environment

This Dockerfile creates build environment for php54-pecl-memcached v2.2.0 on CentOS 6.x x86_64 environment.

## Usage

##### Step1: Build an image (NOTE: you must build the thartman\centos_rpmbuild image first)

`sudo docker build` to create base template image file localy.

```sh
cd memcached-rpmbuild/
$ sudo docker build --rm -t thartman/memcached_rpmbuild . 
```

After finished build, you can see new image like below.

```sh
$ sudo docker images
REPOSITORY                    TAG                 IMAGE ID            CREATED              VIRTUAL SIZE
thartman/memcached_rpmbuild   latest              869705edd558        9 seconds ago        889.4 MB
thartman/centos_rpmbuild      latest              59f519e76a61        About a minute ago   826.8 MB
centos                        centos6             72703a0520b7        2 weeks ago          190.6 MB
```

##### Step2: Boots up the machine, runs build, puts php54-pecl-memcached in ~/RPMS host dir, removes the image when done.

`sudo docker run` to execute the virtual machie from base template everytime.<br>

```sh
$ mkdir ~/RPMS
$ sudo docker run -v ~/RPMS:/root/fpm -it --rm thartman/memcached_rpmbuild
```

## Specifications

##### rpmbuild path

* root : /root/fpm_build
* build : /root/fpm

## License

* MIT License http://www.opensource.org/licenses/mit-license.php
