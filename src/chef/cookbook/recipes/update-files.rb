#
# Cookbook Name:: hadoopdfo
# Recipe:: update-files.rb
#


properties = data_bag_item('hadoopdfo', 'properties')

template "/mnt/hadoop-1.0.4/conf/core-site.xml" do
        source "base.xml.erb"
        owner "hadoop"
        group "hadoop"
        mode 0644
        variables( :props => properties['core'] )
end

template "/mnt/hadoop-1.0.4/conf/hdfs-site.xml" do
        source "base.xml.erb"
        owner "hadoop"
        group "hadoop"
        mode 0644
        variables( :props => properties['hdfs'] )
end

template "/mnt/hadoop-1.0.4/conf/mapred-site.xml" do
        source "base.xml.erb"
        owner "hadoop"
        group "hadoop"
        mode 0644
        variables( :props => properties['mapred'] )
end