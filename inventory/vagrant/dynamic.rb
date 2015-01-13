#!/usr/bin/env ruby
# -*- mode: ruby -*-
# # vi: set ft=ruby :

require 'json'

inventory = {
  _meta: {
    hostvars: {}
  },
  cluster: {
    hosts: [],
    vars: {
      ansible_ssh_host: '127.0.0.1',
    }
  }
}

host = ''
vagrant_ssh_config = `vagrant ssh-config`.split("\n")

vagrant_ssh_config.each do |line|
  case line
  when /^Host\s(.+)$/
    host = $1
    inventory[:cluster][:hosts] << host
    inventory[:_meta][:hostvars][host] = {}
  when /^\s+Port\s(\d+)$/
    inventory[:_meta][:hostvars][host]['ansible_ssh_port'] = $1
  when /^\s+User\s(\d+)$/
    inventory[:_meta][:hostvars][host]['ansible_ssh_user'] = $1
  when /^\s+IdentityFile\s(.+)$/
    inventory[:_meta][:hostvars][host]['ansible_ssh_private_key_file'] = $1
  end
end

puts inventory.to_json
