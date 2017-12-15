# vagrant-osm-tile-server

*CURRENTLY UNDER DEVELOPMENT*

## Features

- this
- that

## Table of Contents

- [Features](#features)
- [Getting started](#getting-started)

## Getting started

Copy vagrant.yaml.tpl to vagrant.yaml and configure all non-optional settings.
Please edit at least the variable osm_user_password in ansible/roles/postgresql/vars/database.yaml to make sure you won't use default passwords.

*Note: box.chrizmas.de is only working with vm_private_ip: "192.168.33.100".*

```bash
vagrant up
```

The osm-tile-server will automatically be provisioned by Vagrant.

## Manually running the Ansible playbook

```bash
ansible-playbook -i 'localhost,' -c local /vagrant/ansible/main.yaml
```

**Special thanks** to [Jeff Tunessen](https://github.com/elnebuloso) for the inspiration of [elnebuloso/vagrant-devbox-php](https://github.com/elnebuloso/vagrant-devbox-php) and therefore helping with the initial setup
