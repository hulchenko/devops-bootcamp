# Dockerfile name is a MUST

# pulls and installs node from Docker Hub into our image(ex: v.13-alpine)
FROM node:13-alpine

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

# execute linux commands inside of the !CONTAINER! (RUN is always for CONTAINERS)
RUN mkdir -p /home/node-app

# executes command on host machine(in our case copies ./app folder to /home/app inside of the container)
COPY ./app /home/node-app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# will execute npm install in /home/app because of WORKDIR
RUN npm install

# no need for /home/app/server.js because of WORKDIR
# runs command node server.js inside the CONTAINER
CMD ["node", "server.js"]
# CMD is an entrypoint command, while RUN can have multiple commands
