#!/bin/bash

BUILD_DIR='/root/fpm_build'
OUT_DIR='/root/fpm'

cd "$BUILD_DIR/memcached-2.2.0"
phpize
./configure
make

# Make FPM dir and copy package files to it
# mkdir -p "$OUT_DIR" # OUT_DIR should be a host mount so we can have the RPMS on the build host.
cd "$OUT_DIR"
mkdir -p etc/php.d/
mkdir -p usr/lib64/php/modules/

# Copy memcached.so file to FPM package directory
mv "$BUILD_DIR/memcached-2.2.0/modules/memcached.so" usr/lib64/php/modules/memcached.so

# Generate default memcached.ini file for loading php.
cat << EOF > etc/php.d/memcached.ini
; Enable memcached extension module
extension=memcached.so

; ----- Options to use the memcached session handler

;  Use memcache as a session handler
session.save_handler=memcached
;  Defines a comma separated list of server urls to use for session storage
session.save_path="127.0.0.1:11211"
EOF

# Use FPM to build RPM package
fpm --epoch 1 -s dir -t rpm -n php54-pecl-memcached -v 2.2.0 -m 'viable.hartman' --description 'Extension to work with the Memcached caching daemon' -a x86_64 -d 'libmemcached10 >= 1.0.16' -d 'memcached >= 1.4.13' .

# Clean up
rm -rf "$OUT_DIR/usr" "$OUT_DIR/etc"
