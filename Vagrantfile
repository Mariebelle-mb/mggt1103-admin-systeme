# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Définition de l'image de base (Ubuntu 22.04 LTS Server)
  config.vm.box = "ubuntu/jammy64"

  # Configuration Réseau : IP privée statique pour notre serveur d'infrastructure
  config.vm.network "private_network", ip: "192.168.56.50"

  # Personnalisation des ressources de l'hyperviseur VirtualBox
  config.vm.provider "virtualbox" do |vb|
    vb.name = "VM-Ubuntu-Mggt1103"
    vb.memory = "1024"
    vb.cpus = 1
  end
end