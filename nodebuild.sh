#!/bin/bash
#CR script
#assume sudo apt install nodejs and sudo apt install npm has been run and those programmes are installed else 
#npm commands wont run
npm install
npm test
##############################
### OLD WAY
#stop container and remove
# docker stop node-app-container
# docker rm node-app-container
# remove image or return true
#docker rmi node-app-image
#create new image
#docker build -t node-app-image .
#run new container
#docker run -d -p 5000:8080 --name node-app-container node-app-image
##############################
# remove images starting with gcr.io
docker rmi $(docker images --filter=reference="gcr.io/lbg-training/node-app:*" -q)
#build image with build number env variable
docker build -t gcr.io/lbg-training/node-app:${BUILD_NUMBER} .
#build and push image to repo 
docker push gcr.io/lbg-training/node-app:${BUILD_NUMBER}
# run the image 
docker run -d -p 5000:8080 --name node-app-container-{BUILD_NUMBER} node-app:{BUILD_NUMBER}
