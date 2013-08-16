require 'drone_api/client'
require 'drone_api/request'
require 'drone_api/strike'
require 'drone_api/geo_json'
require 'drone_api/version'

module DroneApi

  # Returns a new client
  #
  def self.new
    Client.new
  end

  # Return the drone_api gem version
  #
  def self.version
    "DroneApi version #{DroneApi::VERSION}"
  end

end
