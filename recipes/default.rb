include_recipe "java"

package "curl"

execute "curl -s http://archive.cloudera.com/debian/archive.key | apt-key add -" do
  not_if "apt-key list | grep 'Cloudera Apt Repository'"
end

execute "apt-get update" do
  action :nothing
end

template "/etc/apt/sources.list.d/cloudera.list" do
  owner "root"
  mode "0644"
  source "cloudera.list.erb"
  notifies :run, resources("execute[apt-get update]"), :immediately
end

package 'hadoop-hbase'

template "/usr/lib/hbase/conf/hbase-site.xml" do
  owner "root"
  mode "0644"
  source "hbase-site.xml.erb"
  notifies :restart, "service[hadoop-hbase-master]"
end
