FROM node:8.11-alpine

RUN npm install pm2 -g

WORKDIR /app
CMD pm2 start index.js -i max --no-daemon