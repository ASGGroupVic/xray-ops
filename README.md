# Local Development

Depends on vagrant and ansible-vagrant (not the built in provisioner).
* Install python and pip
* Install vagrant and virtualbox
* Install ansible
* Install ansible-vagrant: `pip install ansible-vagrant`

Depends on defunctzombie.coreos-bootstrap to install python on coreos hosts.
* Run `ansible-galaxy install defunctzombie.coreos-bootstrap`


# Production Environment

Deploys EC2 core-os using ansible.
