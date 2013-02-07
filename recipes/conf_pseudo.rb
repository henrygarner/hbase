include_recipe "hadoop::conf_pseudo"

execute "hadoop namenode -format -y" do
  user "hdfs"
  group "hdfs"
end

include_recipe "hbase"

execute "hadoop fs -mkdir /hbase" do
  user "hbase"
  group "hbase"
  not_if "hadoop fs -test -d /hbase"
end

node[:hbase][:config] = { "hbase.rootdir" => "hdfs://127.0.0.1/hbase", "hbase.cluster.distributed" => "true" }

include_recipe "hbase::master"
include_recipe "hbase::regionserver"

# install hadoop-zookeeper-server
# set server.0 to be lucid64
