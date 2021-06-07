docker pull mongo
docker pull mongo-express

## Commands:

### create docker network:

docker network create mongo-network

### Connect mongodb to container:

$ docker run -d \
-p 27017:27017 \
-e MONGO_INITDB_ROOT_USERNAME=admin \
-e MONGO_INITDB_ROOT_PASSWORD=password \
--net mongo-network \
--name mongodb \
mongo

### Connect mongo-express to container:

$ docker run -d \
-p 8081:8081 \
-e ME_CONFIG_MONGODB_ADMINUSERNAME=admin \
-e ME_CONFIG_MONGODB_ADMINPASSWORD=password \
--net mongo-network \
--name mongo-express \
-e ME_CONFIG_MONGODB_SERVER=mongodb \
mongo-express

### Connect to AWS ECR:

AWS CLI 2
AWS Credentials

aws configure

### Push commands for AWS ECR Repository:

aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 211899496878.dkr.ecr.us-east-2.amazonaws.com (login)
docker tag my-app:latest 211899496878.dkr.ecr.us-east-2.amazonaws.com/my-app:latest (tag/rename local image to match repository name, provided by AWS)
docker push 211899496878.dkr.ecr.us-east-2.amazonaws.com/my-app:latest (to push an image to AWS Container)
