require './dronestream/client'
require './dronestream/request'
require './dronestream/strike'
require './dronestream/version'

module Dronestream

  # Returns a new client
  #
  def self.new
    Client.new
  end

  # Return the dronestream gem version
  #
  def self.version
    "Dronestream version #{Dronestream::VERSION}"
  end
end
