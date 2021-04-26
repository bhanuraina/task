FROM node:latest
# for testing purposes
RUN npm install -g jasmine-node
RUN mkdir /app
WORKDIR /app
COPY package.json /app/
RUN npm install & npm install express
COPY . /app
EXPOSE 3000 5858
CMD ["node" ,"server.js"]