require 'json'
require 'open-uri'

module DroneApi
  module Request
    BASEURL = 'http://api.dronestre.am'
    def self.get(u)
      url = "#{BASEURL}/#{u}"

      Strike.parse open(url).read
    end
  end
end
