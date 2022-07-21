FROM node:16

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

ARG PROJECT_ID
ARG FASTCODE_TOKEN
ARG FASTCODE_DEVICE_TOKEN
ARG PORT
RUN apt-get install git -y; git clone https://github.com/Kroy665/fast-dashboard.git
RUN cd fast-dashboard; npm link
RUN cd ..
RUN npm link fast-dashboard
ENV PROJECT_ID=$PROJECT_ID
ENV FASTCODE_TOKEN=$FASTCODE_TOKEN
ENV FASTCODE_DEVICE_TOKEN=$FASTCODE_DEVICE_TOKEN
EXPOSE $PORT
CMD [ "node", "index.js" ]



# FROM node:15
# WORKDIR /app
# COPY package.json .
# COPY package-lock.json .
# RUN npm install
# COPY . .
# # RUN apt-get install git -y; git clone https://github.com/Kroy665/fast-dashboard.git
# # RUN cd fast-dashboard; npm link
# # RUN npm link fast-dashboard
# # RUN cd ..
# EXPOSE 4000
# CMD ["node", "index.js"]
# # End of dockerfile