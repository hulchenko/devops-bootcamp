# docker pull
# docker start
# docker run (docker pull + docker start)
# docker run <IMAGE NAME> (pulls the latest version of an image & starts the container) 
#	-d (detached mode / background run)
#	--rm (auto-removes container on stop)
#	-p 6000:6379 (bind host port to container port)(only one can be bind to the same local port, ex: -p 6001:6379)
#	--name <CUSTOM NAME> (to rename a container)
 
# docker run <IMAGE NAME>:4.0 (run specific version, in this case v.4.0)

# docker ps (list running containers) (-a list all: running & stopped containers)

# docker images (list all local images)

# docker stop (stops the container)

# docker logs <CONTAINER ID> or <CONTAINER NAME>

# docker exec -it <CONTAINER ID /OR/ CONTAINER NAME> /bin/bash (-it -> interactive terminal)
