# 自定义服务

FROM node:12.13.1

MAINTAINER moobusy <75467234@qq.com>

ENV ZIP_PATH=''
ENV ENTRYPOINT='yarn start'
ENV GLOBAL_INSTALL=''

WORKDIR /data/workdir

RUN apt-get install unzip  wget curl -y

RUN npm config set sass_binary_site=https://npm.taobao.org/mirrors/node-sass/
RUN npm config set phantomjs_cdnurl=https://npm.taobao.org/mirrors/phantomjs/
RUN npm config set electron_mirror=https://npm.taobao.org/mirrors/electron/
RUN npm config set registry=https://registry.npm.taobao.org
RUN npm i yarn ${GLOBAL_INSTALL} -g
RUN npm config set user 0
RUN npm config set unsafe-perm true

ENTRYPOINT curl ${ZIP_PATH} -o file.zip && unzip -u file.zip && yarn && chmod +x ./ -R && ${ENTRYPOINT}
