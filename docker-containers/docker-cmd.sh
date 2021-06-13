# to avoid using sudo commands every time, use: sudo usermod -aG docker $USER
# docker pull <image_name> -> downloads an image
# docker start <image_name>
# docker run (docker pull + docker start)
# docker run <IMAGE NAME> (pulls the latest version of an image & starts the container) 
#	-d (detached mode / background run)
#	--rm (auto-removes container on stop)
#	-p 6000:6379 (bind host port to container port, so the entry now is 6000)(only one can be bind to the same local port, ex: -p 27017:27017(MongoDB default port))
#	--name <CUSTOM NAME> (to rename a container)
#   -e (environment variables)
#   -v (volume, to indicate directory to the remote volume, ex: -v /home/mount/data:/var/lib/mysql/data [local directory]:[remote volume directory])
 
# docker run <IMAGE NAME>:4.0 (run specific version, in this case v.4.0)

# docker ps (list running containers) (-a list all: running & stopped containers)

# docker images (list all local images)

# docker stop (stops the container)

# docker logs <CONTAINER ID> or <CONTAINER NAME>

# docker exec -it <CONTAINER ID /OR/ CONTAINER NAME> /bin/bash (-it -> interactive terminal)

# docker network create <NETWORK_NAME>

# docker-compose -f docker-compose.yaml up (run containers straight from compose file, [up - is to RUN all provided containers; down - is to STOP and REMOVE all provided containers])

# docker volume ls (to see local volume data storage)