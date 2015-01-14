# Local Development

Depends on vagrant and ansible.
* Install python and pip
* Install httplib2 (sudo pip install httplib2)
* Install vagrant and virtualbox
* Install ansible

Depends on defunctzombie.coreos-bootstrap to install python on coreos hosts.
* Run `ansible-galaxy install defunctzombie.coreos-bootstrap`


# Production Environment

Deploys EC2 core-os using ansible.
