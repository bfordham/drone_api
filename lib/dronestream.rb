require 'dronestream/request'
require 'dronestream/strike'
require 'dronestream/version'

module Dronestream
  # Returns entire list of strikes
  #
  def self.all
    Request.get('/data')
  end

  # Return the dronestream gem version
  #
  def self.version
    "Dronestream version #{Dronestream::VERSION}"
  end
end
