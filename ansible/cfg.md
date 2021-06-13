<!-- Amazon Linux 2 -->

<!-- sudo amazon-linux-extras install ansible2 -->

### Installation:

sudo su
yum update -y
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install epel-release-latest-7.noarch.rpm
yum install git python python-devel python-pip openssl ansible -y
ansible --version
exit

### hosts.txt:

[staging_servers]
linux1 ansible_host=172.31.16.209 ansible_user=ec2-user ansible_ssh_private_key_file=/home/ec2-user/secret_key

[production_servers]
linux2 ansible_host=172.31.30.212 ansible_user=ec2-user ansible_ssh_private_key_file=/home/ec2-user/secret_key
linux3 ansible_host=172.31.27.137 ansible_user=ec2-user ansible_ssh_private_key_file=/home/ec2-user/secret_key

<!-- before cfg file: ansible -i hosts.txt all -m ping -->

### ansible.cfg:

[defaults]
host_key_checking = false
inventory = /home/ec2-user/ansible/hosts.txt

<!-- after cfg file: ansible all -m ping -->
