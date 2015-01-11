# Local Development

Depends on vagrant to build coreos VMs
* Install python and pip
* Install vagrant and virtualbox

Depends on ansible for provisioning
* Install ansible

Depends on defunctzombie.coreos-bootstrap to install python on coreos hosts.
* Run `ansible-galaxy install defunctzombie.coreos-bootstrap`


# Production Environment

NOT YET IMPLEMENTED. Deploys EC2 core-os using ansible.
