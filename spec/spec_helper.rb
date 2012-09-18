ENV["RAILS_ENV"] ||= 'test'


require 'rspec'
require 'active_record'
require 'active_model'

# Configuring database for activerecord
ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

# Require test model
require 'test_model'

# Stubing Rails.cache method
class Rails
  def self.cache
   @@cache ||= ActiveSupport::Cache::MemoryStore.new(:expires_in => 5.minutes)
  end
end



# Configure RSpec
RSpec.configure do |config|
  # config.include Rack::Test::Methods
end
