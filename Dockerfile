FROM node:10-alpine

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

EXPOSE 3000

WORKDIR /app
CMD pm2 start index.js -o NULL -e NULL -i  max --no-daemon