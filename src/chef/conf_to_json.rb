require 'parseconfig.rb'
require 'json'

config = ParseConfig.new('/opt/hadoop_parameters.conf')
properties = {}

properties["id"] = "properties"

config.groups.each do |type|
	properties[type] = Array.new
	config[type].keys.each do |k|
		values = {}
		
		values["name"] = k
		values["value"] = config[type][k]
		values["description"] = ""
		
		properties[type].push(values)
	end
end


File.open('/data/chef/chef-repo/data_bags/hadoopdfo/hadoop_properties.json', 'w') { |file| file.write(properties.to_json) }