<!-- agent forwarding -->

vim testkeyfile
eval ssh-agent -s
sudo chmod 600 testkeyfile
ssh-add testkeyfile
ssh-add -l (to see list of keys)
ssh -i testkeyfile ec2-user@<public/private ip>
ssh -A -i testkeyfile ec2-user@<public/private ip> (to enable agent forwarding, to access another VM within the next one)
