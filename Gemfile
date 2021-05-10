source 'https://rubygems.org'

ruby '2.7.2'

## For BigDecimal.new support
gem 'bigdecimal', '1.4.4'

gemspec

case version = ENV['MONGOID_VERSION'] || "7"
when /7/
  gem "mongoid", :github => 'mongoid/mongoid'
when /4/
  gem "mongoid", :github => 'mongoid/mongoid'
when /3/
  gem "mongoid", "~> 3.1"
else
  gem "mongoid", version
end
