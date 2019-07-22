FROM node:lts-alpine

# Install base packages
RUN apk update
RUN apk upgrade

# Change TimeZone
RUN apk add --update tzdata
ENV TZ=Asia/Shanghai

# Clean APK cache
RUN rm -rf /var/cache/apk/*

# Install PM2
RUN npm install pm2 -g

WORKDIR /app
CMD pm2 start index.js -o NULL -e NULL ${INSTANCE_NUM:+"-i ${INSTANCE_NUM}"} && pm2 log all