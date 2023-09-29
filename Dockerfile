FROM 3-alpine-nginx

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thies88"

# environment settings
ENV gitprojectname="spotweb"
ENV giturl="https://github.com/spotweb/spotweb.git"
ENV configfile="dbsettings.inc.php"

# install spotweb packages
RUN \
echo "**** install build packages ****" && \
apk add --no-cache --virtual=build-dependencies \
	git && \
echo "Setup Application" && \
	mkdir -p /app/www && \
	cd /app/www && \
	git clone ${giturl} && \
	chown -R abc:abc /app/${gitprojectname} && \
echo "**** cleanup ****" && \
apk del --purge \
    build-dependencies && \
rm -rf \
	/tmp/*

#Copy local files
COPY root/ /
