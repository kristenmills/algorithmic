require 'rspec'
require 'simplecov'

SimpleCov.start
require File.join(File.dirname(__FILE__), '..', 'lib', 'algorithmic')

RSpec.configure do |config|
  config.color_enabled = true
end