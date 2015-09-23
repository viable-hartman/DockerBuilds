# Docker centos-rpmbuild

This Dockerfile provides RPM build container for CentOS6.x environment.

## Usage

##### Step1: Build an image

`docker build` to create base template image file localy.

```sh
cd centos-rpmbuild/
$ docker build --rm -t thartman/centos_rpmbuild . 
```

After finished build, you can see new image like below.

```sh
$ docker images
REPOSITORY                 TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
thartman/centos_rpmbuild   latest              59f519e76a61        15 seconds ago      826.8 MB
centos                     centos6             72703a0520b7        2 weeks ago         190.6 MB
```

##### Step2: Boots up the machine

`docker run` to execute the virtual machie from base template everytime.<br>

```sh
$ docker run -i -t thartman/centos_rpmbuild /bin/bash --login
```

If you don't want containers to persist after you shutdown add the --rm option like so.<br>

```sh
$ docker run -i -t --rm thartman/centos_rpmbuild /bin/bash --login
```

## Specifications

##### rpmbuild path

* root : /root/rpmbuild
* build : /home/build/rpmbuild

**Note**<br>
To switch general build user, type `su - build` command.

## TODO

Pull requests are very welcome!!

## License

* MIT License http://www.opensource.org/licenses/mit-license.php
