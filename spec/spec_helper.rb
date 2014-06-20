$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require "simplecov"
SimpleCov.start do
  add_filter "spec"
end

require "hotel_reservation"
require "rspec"
require 'factory_girl'
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

