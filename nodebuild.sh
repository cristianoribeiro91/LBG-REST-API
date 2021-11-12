#!/bin/bash
#assume sudo apt install nodejs and sudo apt install npm has been run and those programmes are installed else 
#npm commands wont run
npm install
npm test
#stop container and remove
docker stop node-app-container
docker rm node-app-container
#remove image or return true
docker rmi node-app-image
#create new image
docker build -t node-app-image .
#run new container
docker run -d -p 5000:8080 --name node-app-container node-app-image
