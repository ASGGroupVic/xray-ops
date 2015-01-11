# -*- mode: ruby -*-
# # vi: set ft=ruby :
VAGRANT_API_VERSION = "2"
Vagrant.require_version ">= 1.6.0"

# Defaults for config options defined in CONFIG
$num_minions = 3
$vb_memory = 1024
$vb_cpus = 2

$update_channel = "alpha"
$enable_serial_logging = false
$vb_gui = false

$base_ip = "172.17.8"
$master_ip = "#{$base_ip}.10"

Vagrant.configure(VAGRANT_API_VERSION) do |config|
  config.vm.box = "coreos-%s" % $update_channel
  config.vm.box_version = ">= 308.0.1"
  config.vm.box_url = "http://%s.release.core-os.net/amd64-usr/current/coreos_production_vagrant.json" % $update_channel

  config.vm.provider :vmware_fusion do |vb, override|
    override.vm.box_url = "http://%s.release.core-os.net/amd64-usr/current/coreos_production_vagrant_vmware_fusion.json" % $update_channel
  end

  config.vm.provider :virtualbox do |v|
    # On VirtualBox, we don't have guest additions or a functional vboxsf
    # in CoreOS, so tell Vagrant that so it can be smarter.
    v.check_guest_additions = false
    v.functional_vboxsf     = false
  end

  # plugin conflict
  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = false
  end

  config.vm.define vm_name = "master" do |machine|
    machine.vm.hostname = vm_name

    machine.vm.provider :vmware_fusion do |vb|
      vb.gui = $vb_gui
    end

    machine.vm.provider :virtualbox do |vb|
      vb.gui = $vb_gui
      vb.memory = $vb_memory
      vb.cpus = $vb_cpus
    end

    machine.vm.network :private_network, ip: $master_ip
  end


  (1..$num_minions).each do |instance|
    config.vm.define vm_name = "minion-%d" % instance do |machine|
      machine.vm.hostname = vm_name

      machine.vm.provider :vmware_fusion do |vb|
        vb.gui = $vb_gui
      end

      machine.vm.provider :virtualbox do |vb|
        vb.gui = $vb_gui
        vb.memory = $vb_memory
        vb.cpus = $vb_cpus
      end

      ip = "#{$base_ip}.#{instance + 100}"
      machine.vm.network :private_network, ip: ip
    end
  end
end
