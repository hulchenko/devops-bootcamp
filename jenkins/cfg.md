### Initial SetUp:

setup VM
setup firewall, connect to VM
ssh root@<VM ip>
apt update (always on new machine/container)
apt install docker.io
docker run -p 8080:8080 -p 50000:50000 -d -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts (installing jenkins container on the VM: 8080 bind local machine port to vm's port, 50000 is for jenkins cluster, jenkins/jenkins:lts is a jenkins server)
in browser window: <VM ip>:8080
initial password location: /var/jenkins_home/secrets/initialAdminPassword (inside the container)
docker exec -it 43184f8cf266 bash (login to the container with container ID)
cat /var/jenkins_home/secrets/initialAdminPassword (to get the password)

### Tools installation in Jenkins:

1. Jenkins Plugins (via UI)
   Dashboard > Manage Jenkins > Manage Plugins > Available > Node > Install
2. Server tools installation(Node.js example):
   docker exec -u 0 -it <container ID> bash (login into the container as root user, for installation privileges [-u 0] command)
   cat /etc/issue (check linux distribution to determine which package to install)
   apt update (always on new machine/container)
   apt install curl (to download scripts for installations)
   curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh (to get NodeSource Node js installation script)
   bash nodesource_setup.sh (to install NodeSource from the script)
   apt install nodejs (npm and node inside of jenkins container)

### Creating a Pipeline Job:
