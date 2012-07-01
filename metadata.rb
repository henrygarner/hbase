maintainer        "Henry Garner"
maintainer_email  "henry@henrygarner.com"
license           "Apache 2.0"
description       "Installs hbase per Cloudera's quick start docs"
version           "0.0.1"
depends           "java"

recipe "hbase", "Installs hbase from Cloudera's repo"
recipe "hbase::master", "Installs hbase master from Cloudera's repo"
recipe "hbase::regionserver", "Installs hbase regionserver from Cloudera's repo"

%w{ debian ubuntu }.each do |os|
  supports os
end
