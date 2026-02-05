# rsync static

docker image to build a statically linked version for rsync

## Build

```sh
mkdir build

# with latest version
docker run -v ./build:/build ghcr.io/awbari/rsync-static

# with specific version
docker run -e RSYNC_VERSION=3.4.1 -v ./build:/build ghcr.io/awbari/rsync-static

# or use docker compose
docker compose up --build
```
