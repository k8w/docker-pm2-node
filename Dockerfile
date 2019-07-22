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

# Add Test Program
ADD index.js /app/

ENV INSTANCE_NUM 1

WORKDIR /app
CMD pm2 start index.js -o NULL -e NULL -i $INSTANCE_NUM && pm2 log all