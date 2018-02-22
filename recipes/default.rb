#
# Cookbook:: firewall
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

public_profile_command = node['firewall']['publicprofile'] ? 'on' : 'off'
private_profile_command = node['firewall']['privateprofile'] ? 'on' : 'off'
domain_profile_command = node['firewall']['domainprofile'] ? 'on' : 'off'

batch 'firewall publicprofile' do
  code "netsh advfirewall set publicprofile state #{public_profile_command}"
  only_if { is_firewall_enabled('publicprofile') != node['firewall']['publicprofile'] }
end

batch 'firewall privateprofile' do
  code "netsh advfirewall set privateprofile state #{private_profile_command}"
  only_if { is_firewall_enabled('privateprofile') != node['firewall']['privateprofile'] }
end

batch 'firewall domainprofile' do
  code "netsh advfirewall set domainprofile state #{domain_profile_command}"
  only_if { is_firewall_enabled('domainprofile') != node['firewall']['domainprofile'] }
end
