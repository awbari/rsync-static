#!/bin/bash

# get latest version from github
TAG_NAME_LATEST=$(curl -s https://api.github.com/repos/RsyncProject/rsync/releases/latest | jq -r .tag_name | sed 's/^v//')
_version=${RSYNC_VERSION:-$TAG_NAME_LATEST}

wget https://rsync.samba.org/ftp/rsync/src/rsync-$_version.tar.gz && 

rm .wget-hsts &&

tar xzf rsync-$_version.tar.gz &&

rm rsync-$_version.tar.gz &&

cd rsync-$_version &&

./configure PKG_CONFIG="pkg-config --static" LIBS="-lz" LDFLAGS="-static" --disable-openssl && 

make && 

cd .. &&

cp rsync-$_version/rsync . &&

chmod +x rsync &&

rm -r rsync-$_version
