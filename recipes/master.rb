include_recipe "hbase"

package "hadoop-hbase-master"

service "hadoop-hbase-master" do
  supports :status => true
  action [ :start, :enable ]
end
