#
# Cookbook:: mysql_config
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
apt_update

mysql_service 'foo' do
  port '3306'
  version '8.0'
  initial_root_password 'varun1234'
  action [:create, :start]
end
