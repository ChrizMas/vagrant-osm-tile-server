# -*- mode: ruby -*-
# vi: set ft=ruby :

require "yaml"
setting = YAML.load_file "vagrant.yaml"

Vagrant.configure(2) do |config|
    config.vm.box = "bento/ubuntu-16.04"

    config.vm.hostname = setting['vm_hostname']
    config.vm.network "private_network", ip: setting.fetch('vm_private_ip', "192.168.33.100");

    config.vm.provider "virtualbox" do |v|
        v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
        v.gui = setting.fetch('vm_gui', false);
    end
 
    config.vbguest.auto_update = setting['vm_vbguest_auto_update']
    config.vbguest.no_remote = setting['vm_vbguest_no_remote']

    config.vm.provision "shell", inline: "sudo rm -f /var/lib/dpkg/lock"

    # TODO: Only set private ssh if config is set
    #config.vm.provision "shell", privileged = false, inline = "echo \"$1\" > /vagrant/.ssh/$2 && chmod 600 /home/vagrant/.ssh/$2", args = [File.read(File.expand_path(setting['ssh_private_key_path'])), setting['ssh_private_key_path'].split('/').last]
    
    # Add given public key to vagrant user's authorized keys
    config.vm.provision "shell", privileged: false, inline: "echo $1 | grep -xq \"$1\" /home/vagrant/.ssh/authorized_keys || echo $1 | tee -a /home/vagrant/.ssh/authorized_keys", args: [File.read(File.expand_path(setting['ssh_public_key_path']))]
    
    # Install ansible
    config.vm.provision "shell", inline: "apt-add-repository -y ppa:ansible/ansible"
    config.vm.provision "shell", inline: "apt-get update"
    config.vm.provision "shell", inline: "apt-get -y install ansible"

    setting['vm_synced_folders'].each do |i|
        config.vm.synced_folder i['host'], i['guest']
    end
end
