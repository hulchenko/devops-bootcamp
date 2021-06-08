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

pom.xml
Jenkinsfile:

1.  <VM ip>:<port>/env-vars.html list of jenkins env vars
2.  post {} (attribute to execute script after all stages executed):
    1. always (regardless of stage outcome)
    2. success (if true)
    3. failure (if false)
3.  stage('test'){when { expression {BRANCH_NAME == 'dev' || BRANCH_NAME == 'master' }}steps{echo 'Hello World!'}} (the rest of test will run only if 'when' part met)
4.  environment {NEW_VERSION = '1.5.5'} (to define custom environment variables, env vars will be available to ALL stages in pipeline. NEW_VERSION is an example):
    1.  env vars has to be indicated within double quotes, ex: echo "This is version: ${NEW_VERSION})
    2.  credentials can be provided within file, if credentials plugin installed(can be system or global):
        1.  Dashboard > Manage Jenkins > Manage Credentials > Scoped to Jenkins > global > Add Credentials
        1.  SERVER_CREDENTIALS = credentials('<credentials-id>')
5.  tools { maven 'Maven' } (attribute to access tools for the project, only 3 available: gradle, maven, jdk)
6.  parameters {} (for extra custom configuration)

### Types of Jobs:

Freestyle (for single task: Test, Build, Deploy)
Pipeline (for combined tasks, with GUI timeline, with 1 branch)
Multi-Branch Pipeline (for combined tasks and multiple branches)
