# vagrant-osm-tile-server

*NOT MAINTAINED ANYMORE*

Unfortunately I am currently not able to maintain this project anymore. Feel free to fork it or use it in any kind you want!

## Features

- **OSM Tile Server**: Basic installation of an OSM tile server
- **imposm3**: Importing .pbf files into a PostgreSQL PostGIS database
- **Ansible playbook**: Basic configuration, deployment and orchestration of the OSM tile server
- **Vagrant**: The whole setup running locally on Vagrant to develop and test new styles

## Missing Features
- **No styles**: Currently there are no map styles in this bundle - you have to develop a style based on the imposm3 databases yourself (or you can use any other imposm3-based styles you can find)

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

## Importing .pbf files via imposm3

```bash
mkdir -p ~/src/pbf
cd ~/src/pbf
wget http://download.geofabrik.de/europe/greece-latest.osm.pbf
imposm3 import -connection postgis://renderosm:f00b4r@localhost/osm -mapping ~/src/imposm3/default-mapping.json -read ~/src/pbf/greece-latest.osm.pbf -write
imposm3 import -connection postgis://renderosm:f00b4r@localhost/osm -mapping ~/src/imposm3/default-mapping.json -deployproduction
```

To check your imported tables, just connect to the database and check:

```bash
psql -h localhost -U renderosm osm
```

**Special thanks** to [Jeff Tunessen](https://github.com/elnebuloso) for the inspiration of [elnebuloso/vagrant-devbox-php](https://github.com/elnebuloso/vagrant-devbox-php) and therefore helping with the initial setup
