FROM node:12-alpine

WORKDIR /opt/strapi

# COPY ./package.json ./

# Instal dependencies
RUN sed -i 's/dl-cdn\.alpinelinux\.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk --no-cache add git fontconfig texlive texlive-xetex texmf-dist-langchinese && \
    mkdir /usr/share/fonts && \
    wget https://dskb-chengshi.oss-cn-hangzhou.aliyuncs.com/FZHei-B01.ttf -o /usr/share/fonts/FZHei-B01.ttf && \
    fc-cache -fv && \
    npm config set registry=https://registry.npm.taobao.org/ && \
    npm config set sharp_binary_host "https://npm.taobao.org/mirrors/sharp" && \
    npm config set sharp_libvips_binary_host "https://npm.taobao.org/mirrors/sharp-libvips" && \
    npm i --production --ignore-scripts=false

# COPY . .

ENV NODE_ENV production

# RUN npm run build

# EXPOSE 1337

# CMD ["npm", "start"]
