# Spotweb

Alpine based Image for creating docker container with nginx as a webserver serving [Spotweb](https://github.com/spotweb/spotweb) and monitored by s6-overlay.

Database server not included use https://hub.docker.com/r/linuxserver/mariadb as a database server and point to this MYSQL instance when running the initial spotweb setup.

#### weekly builds @Saturday at 3:00 (AM)
* Rebuilds new base image from scratch @http://nl.alpinelinux.org/alpine (Alpine 3.12)
  * Base OS is updated
  * Packages are updated
  * Application within image(container) gets updated if new release is available. 
  * Don't manual update Application within container unless you know what you're 		doing.
  * Application settings are restored if mapped correctly to a host folder, your /config folder and settings will be preserved

### docker setup

```
docker create \
  --name=spotweb \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Amsterdam \
  -e APP_URL=/spotweb `#optional` \
  -p 80:80 \
  -p 443:443 `#optional` \
  -v /path/to/config:/config \
  --restart unless-stopped \
  thies88/spotweb
```
After starting the container check log for instructions. go to https://ipdockerhost/spotweb

### update your container:

Via Docker Run/Create

    -Update the image: docker pull thies88/containername
    -Stop the running container: docker stop containername
    -Delete the container: docker rm containername
    -Recreate a new container with the same docker create parameters used at the setup of the container (if mapped correctly to a host folder, your /config folder and settings will be preserved)
    -Start the new container: docker start containername
    -You can also remove the old dangling images: docker image prune

Unraid users can use "Check for updates" within Unraid WebGui

&nbsp;

A custom base image built with [Alpine linux](https://alpinelinux.org/) and [S6 overlay](https://github.com/just-containers/s6-overlay) Based on: https://github.com/linuxserver/docker-baseimage-alpine
