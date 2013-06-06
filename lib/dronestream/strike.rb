require 'json'

module Dronestream
  class Strike
  	attr_reader :id, :number, :country, :date, :town, :location, :deaths, 
  		:deaths_min, :deaths_max, :civilians, :injuries, :children, :tweet_id, 
  		:bureau_id, :bij_summary_short, :bij_link, :target, :lat, :lon, 
  		:articles, :names

  	# Return array of Strike objects from json string
  	#
  	def self.parse(js)
  		data = JSON.parse(js)
  		strikes = []

  		data['strike'].each	do |s|
  			strike = Strike.new s
  			strikes << strike
  		end unless data['strike'].nil? or data['strike'].empty?

  		return strikes
  	end

  	# Initialize attributes
  	#
  	def initialize(data = nil)
  		unless data.nil?
  			data = JSON.parse(data) if data.is_a? String

  			@id = data['_id'] || ''
			@number = data['number'].to_i || 0
			@country = data['country'] || ''
			@date = data['date'] || ''
			@town = data['town'] || ''
			@location = data['location'] || ''
			@deaths = data['deaths'].to_i || 0
			@deaths_min = data['deaths_min'].to_i || 0
			@deaths_max = data['deaths_max'].to_i || 0
			@civilians = data['civilians'].to_i || 0
			@injuries = data['injuries'].to_i || 0
			@children = data['children'].to_i || 0
			@tweet_id = data['tweet_id'] || ''
			@bureau_id = data['bureau_id'] || ''
			@summary_short = data['bij_summary_short'] || ''
			@link = data['bij_link'] || ''
			@target = data['target'] || ''
			@lat = data['lat'] || ''
			@lon = data['lon'] || ''
			@articles = data['articles'] || ''
			@names = data['names'] || ''
  		end
  	end
  end
end