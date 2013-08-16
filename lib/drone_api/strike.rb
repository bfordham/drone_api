require 'date'
require 'json'

module DroneApi
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

        @id = parse_string(data['_id'])
        @number = parse_int(data['number'])
        @country = parse_string(data['country'])
        @date = parse_date(data['date'])
        @town = parse_string(data['town'])
        @location = parse_string(data['location'])
        @deaths = parse_int(data['deaths'])
        @deaths_min = parse_int(data['deaths_min'])
        @deaths_max = parse_int(data['deaths_max'])
        @civilians = parse_int(data['civilians'])
        @injuries = parse_int(data['injuries'])
        @children = parse_int(data['children'])
        @tweet_id = parse_string(data['tweet_id'])
        @bureau_id = parse_string(data['bureau_id'])
        @summary_short = parse_string(data['bij_summary_short'])
        @link = parse_string(data['bij_link'])
        @target = parse_string(data['target'])
        @lat = parse_string(data['lat'])
        @lon = parse_string(data['lon'])
        @articles = parse_string(data['articles'])
        @names = parse_string(data['names'])

  		end
  	end

    private

    def parse_int(val)
      val.nil? ? 0 : val.to_i
    end

    def parse_date(val)
      val.nil? ? nil : DateTime.strptime(val, '%Y-%m-%dT%H:%M:%S.%LZ')
    end

    def parse_string(val)
      val.nil? ? '' : val
    end
  end
end