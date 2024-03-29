#!/bin/bash

set -e

VERSION=$1

tmp_dir=.debpkg/usr/lib/yagna/installer

mkdir -p ${tmp_dir}
mkdir -p .debpkg/DEBIAN

cp -r certs/ ${tmp_dir}/certs
cp -r whitelist/ ${tmp_dir}/whitelist
cp -r golem-certs/ ${tmp_dir}/golem-certs

cp debian/install.sh ${tmp_dir}/install.sh
chmod +x ${tmp_dir}/install.sh

cp debian/* .debpkg/DEBIAN/

chmod +x .debpkg/DEBIAN/preinst
chmod +x .debpkg/DEBIAN/postinst

VERSION="$(echo "$VERSION" | sed -E "s,^refs/tags/,,")"
FIXED_VERSION="$(echo "$VERSION" | sed -E 's/^v//')"
sed -i "s/#version/${FIXED_VERSION}/g" .debpkg/DEBIAN/control

DEB_FILE="ya-installer-resources_${VERSION}.deb"

dpkg-deb --build .debpkg "$DEB_FILE"
echo "deb=$DEB_FILE" >> "${GITHUB_OUTPUT}"
