require 'rubygems'
require 'mongo'



ENV["MongoConnectionString"]="flex"

Mongo::Logger.logger.level = ::Logger::DEBUG

puts "driver activated"

client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'testdbx')
#collection=client[:sampler]
#collection.create

client.collections.each { |coll| puts coll.name }

 client[:cars].find.each do |doc| 
 	#puts "#{doc.class} -- #{doc}"
 	puts doc['name']
 end



#client[:copyGroups].insert_one hashMap


arrayOfData=[]

arrayOfData << {:name=>"toby",:stats=>{:strength=>10,:dex=>15,:powers=>[{:p1=>"fly",:p2=>"run"}]}}
arrayOfData << {:name=>"joan",:stats=>{:strength=>4,:dex=>9,:powers=>[{:p1=>"see",:p2=>"run"}]}}
arrayOfData << {:name=>"julie",:stats=>{:strength=>9,:dex=>17,:powers=>[{:p1=>"invis",:p2=>"swim"}]}}
arrayOfData << {:name=>"jackie",:stats=>{:strength=>8,:dex=>21,:powers=>[{:p1=>"sew",:p2=>"smell"}]}}



arrayOfData.each do |dataSet|
	#client[:sampler].insert_one dataSet
end

results=client[:sampler].find
puts "!!!!!!!!!!!!! #{results.count}"

results=client[:sampler].find("stats.dex":21)
puts results.count
results.each do |result|
	puts result["name"]
end

client.close