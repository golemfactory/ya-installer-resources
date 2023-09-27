#!/bin/bash

tmp_dir=.debpkg/tmp/ya-installer

mkdir -p ${tmp_dir}
mkdir -p .debpkg/DEBIAN

cp -r certs/ ${tmp_dir}/certs
cp -r whitelist/ ${tmp_dir}/whitelist
cp -r golem-certs/ ${tmp_dir}/golem-certs

cp debian/postinst .debpkg/DEBIAN/postinst
chmod +x .debpkg/DEBIAN/postinst