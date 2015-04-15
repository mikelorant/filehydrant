# -*- mode: ruby -*-
# vi: set ft=ruby :

if RbConfig::CONFIG['host_os'] =~ /darwin/
  network      = `route -n get default`.lines.grep(/interface/).first.split(':').last.strip
  network_name = `VBoxManage list bridgedifs`.lines.grep(/^Name:.*#{network}/).first.split('Name:').last.strip
  cpu_cores    = `sysctl -n hw.ncpu`
end

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  # Requires network interface supporting promiscuous mode.
  config.vm.network "public_network", bridge: network_name ||= nil, use_dhcp_assigned_default_route: 'true'
  config.vm.network "forwarded_port", guest: 3000, host: 8080

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
    vb.cpus   = cpu_cores ||= nil

    vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
  end

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    sudo apt-get install -y ruby1.9.1-dev libghc-zlib-dev libsqlite3-dev nodejs libssl-dev
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    curl -sSL https://get.rvm.io | bash -s stable
    source ~/.rvm/scripts/rvm
    sed 's/rvm_io.global.ssl.fastly.net/rvm.io/' -i ~/.rvm/config/db
    rvm install ruby
    gem install bundler
    bundle config --global jobs 4
    cd /vagrant
    bundle install
    echo vagrant ssh
    echo cd /vagrant
    echo export TRANSMISSION_HOST=HOST
    echo export TRANSMISSION_USERNAME=USERNAME
    echo export TRANSMISSION_PASSWORD=PASSWORD
    echo puma
  SHELL
end
