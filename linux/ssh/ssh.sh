# Auth #1:
# ssh root@67.205.171.179
# server password


# Auth #2:
# ssh-keygen -t rsa
# ~/.ssh/id_rsa or id_rsa.pub
# copy key from id_rsa.pub to ~/.ssh/authorized_keys on server

# if keys are not in default folder/default name:
# ssh -i .ssh/id_rsaTEST(absolute path to the key file) root@67.205.171.179

# to copy files to the remote server, scp(secure copy):
# scp test.sh root@67.205.171.179:/root
# OR
# scp -i .ssh/id_rsaTEST(absolute path to the key file) filename.txt user@ip-address:/directory-to-place-file


# ssh-copy-id user@ip-address (to copy PUBLIC key from the machine to the indicated host)