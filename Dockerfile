FROM node:10-alpine

RUN npm install pm2 -g

EXPOSE 3000

WORKDIR /app
CMD pm2 start index.js -i max --no-daemon