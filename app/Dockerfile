FROM node:10-alpine

# Setting working directory. All the path will be relative to WORKDIR
WORKDIR /usr/src/app

# Copying source files
COPY . .

# Installing dependencies
RUN npm install

# Building app
RUN npm run build

# Running the app
CMD [ "npm", "start" ]