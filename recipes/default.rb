#
# Cookbook:: firewall
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


public_profile_command = node['firewall']['PublicProfile'] ? 'on' : 'off'
private_profile_command = node['firewall']['PrivateProfile'] ? 'on' : 'off'
public_profile_command = node['firewall']['DomainProfile'] ? 'on' : 'off'

execute 'firewall PublicProfile' do
  command "netsh advfirewall PublicProfile state #{public_profile_command}"
  only_if { is_firewall_enabled('PublicProfile') != node['firewall']['PublicProfile'] }
end

execute 'firewall PrivateProfile' do
  command "netsh advfirewall PrivateProfile state #{private_profile_command}"
  only_if { is_firewall_enabled('PrivateProfile') != node['firewall']['PrivateProfile'] }
end

execute 'firewall DomainProfile' do
  command "netsh advfirewall DomainProfile state #{domain_profile_command}"
  only_if { is_firewall_enabled('DomainProfile') != node['firewall']['DomainProfile'] }
end
