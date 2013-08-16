module DroneApi
  class GeoJson
 	attr_accessor :properties, :coordinates

 	def initialize(properties={}, coordinates=[])
 		@properties = properties
 		@coordinates = coordinates
 	end

 	def [](key)
 		@properties[key]
 	end

 	def []=(key, value)
 		@properties[key] = value
 	end

 	def to_json(*a)
		{ 
			"type" => "Feature", 
			"properties" => @properties, 
			"geometry" => {
				"type" => "Point", 
				"coordinates" => @coordinates
			} 
		}.to_json(a)
 	end

 	def self.json_create(o)
 		GeoJson.new(
 			o['properties'], o['geometry']['coordinates']
 		)
 	end

  end
end