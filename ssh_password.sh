USER="zhihan"

for i in 1 2 3 4 5 6 7
do
	ssh -t ${USER}@192.168.100.10$i -p 12345 "ssh-keygen;
	ssh-copy-id   -i   ~/.ssh/id_rsa.pub ${USER}@192.168.100.101 -p 12345;
	ssh-copy-id   -i   ~/.ssh/id_rsa.pub ${USER}@192.168.100.102 -p 12345;
	ssh-copy-id   -i   ~/.ssh/id_rsa.pub ${USER}@192.168.100.103 -p 12345;
	ssh-copy-id   -i   ~/.ssh/id_rsa.pub ${USER}@192.168.100.104 -p 12345;
	ssh-copy-id   -i   ~/.ssh/id_rsa.pub ${USER}@192.168.100.105 -p 12345;
	ssh-copy-id   -i   ~/.ssh/id_rsa.pub ${USER}@192.168.100.106 -p 12345;
	ssh-copy-id   -i   ~/.ssh/id_rsa.pub ${USER}@192.168.100.107 -p 12345;
	chmod  600  ~/.ssh/authorized_keys"
done