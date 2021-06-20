<!-- Amazon Linux 2 -->

## Commands:

ansible-doc -l | grep ec2 (show list of commands for ec2)

ansible-inventory --list (list all created groups, servers, variables)

ansible-inventory --graph (to show graph of everything)

ansible all --list-hosts (list all servers)

ansible all -m copy -a "src=hello.txt dest=/home" -b (copy file from main to all other indicated hosts)

ansible all -m shell -a "ls /home" -b (check hosts' files in the indicated folder)

ansible all -m get_url -a "url=https://collectors.sumologic.com/rest/download/linux/64 dest=/home" -b (download files onto servers)

ansible all -m file -a "path=/home/SumoCollector_linux_amd64_19_338-5.sh state=absent" -b (to remove the file)

ansible all -m yum -a "name=httpd state=installed" -b (to install apps)

ansible all -m yum -a "name=httpd state=removed" -b (to uninstall apps)

ansible all -m service -a "name=httpd state=started enabled=yes" -b (to run a service)

ansible all -m uri -a "url=http://www.google.ca return_content=yes" (read and get content from the url)

ansible staging_servers -m shell -a "ls /var" -v(can be 1-5: -vvvvv for debugging)

ansible <host_name> -m setup (to see info and list of vars for the host)

ansible-playbook playbook.yml --extra-var "MYHOSTS=ALL_LINUX" (external variables upon request, that's if ansible hosts: "{{ MY HOSTS }}" and hosts.txt has [ALL_LINUX] section with hosts)

<!-- regular files encryption -->

ansible-vault create file.txt (password to encrypt)
ansible-vault view file.txt (password to cat)
ansible-vault edit file.txt (password to change)
ansible-vault rekey file.txt (password to change password)

<!-- yml files encryption -->

ansible-vault encrypt playbook.yml
ansible-vault decrypt playbook.yml

ansible-playbook playbook.yml --ask-vault-pass (to execute playbook with password, otherwise it will error out)
ansible-playbook playbook.yml --vault-password-file file.txt (to execute playbook with file, that contains password, without prompt)

<!-- sudo amazon-linux-extras install ansible2 -->

### Installation:

sudo amazon-linux-extras install ansible2

### Optional:

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
