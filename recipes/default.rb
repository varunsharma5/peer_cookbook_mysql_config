#
# Cookbook:: mysql_config
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
apt_update

root_password = data_bag_item('passwords', 'mysql')

mysql_service 'foo' do
  port node['mysql']['port']
  version node['mysql']['version']
  initial_root_password root_password['password']
  action [:create, :start]
end
