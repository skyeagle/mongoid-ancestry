require 'rubygems'
require 'bundler/setup'

require 'mongoid'
require 'rspec'

require 'mongoid-ancestry'

Mongoid.load!(File.expand_path('../mongoid.yml', __FILE__), 'test')
Mongoid.logger = Logger.new('log/test.log')

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.after :each do
    # Drops all collections in the current environment
    Mongoid::Sessions.default.drop
  end
end
