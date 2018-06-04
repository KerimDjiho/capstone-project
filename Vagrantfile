@initializeSwarm = <<SHELL
  docker swarm init
SHELL

@createDockerNetwork = <<SHELL
  docker network create --driver="overlay" --scope="swarm" capstone-net
SHELL

@leaveSwarm = <<SHELL
  docker swarm leave --force
SHELL

@deployStack = <<SHELL

  cd /
  cd vagrant
  docker stack deploy --compose-file docker-stack.yml cp-stack
SHELL

@importMysqliIntoConfig = <<SHELL
  docker exec -it $(docker ps | grep apache | awk '(print $1)') "echo "
SHELL

Vagrant.configure("2") do |config|
    config.vm.synced_folder "./vagrant", "/vagrant"
    config.vm.provision "docker"

  
 config.vm.define "capstone-machine" do |d|
    d.vm.box = "centos/7"
    d.vm.hostname = "capstone-machine"
    d.vm.provision :shell, inline: "ls -la"
    d.vm.network "forwarded_port", guest: 8080, host: 8080,
      auto_correct: true
    d.vm.network "forwarded_port", guest: 8008, host: 8008,
      auto_correct: true
    d.vm.network "forwarded_port", guest: 8800, host: 8800,
      auto_correct: true
    d.vm.provision :shell, inline: @initializeSwarm
    d.vm.provision :shell, inline: @createDockerNetwork
    d.vm.provision :shell, inline: @deployStack
    #d.vm.provision :shell, inline: @importMysqliIntoConfig
    #d.vm.provision :shell, inline: @deployStack
    d.vm.provider "virtualbox" do |v|
      v.memory = 4096
    end
  end
end
