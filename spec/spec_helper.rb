$:.unshift File.expand_path("../..", __FILE__)

require 'dronestream'
require 'rspec'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end