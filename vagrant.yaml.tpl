---
vm_hostname: "box.chrizmas.de"

vm_vbguest_auto_update: false
vm_vbguest_no_remote: true

ssh_private_key_path: "C:\\Path\\To\\Private\\Key\\.ssh\\id_rsa"
ssh_public_key_path: "C:\\Path\\To\\Public\\Key\\.ssh\\id_rsa.pub"

vm_synced_folders:
  - {host: 'C:\\Path\\To\\Synced\\www', guest: '/var/www'}

############# OPTIONAL SETTINGS #############

# vm_gui: false
# vm_private_ip: "192.168.33.100"

#############################################
