require 'cacheefo'
require 'Cacheefo/railtie'

# Ingesting Cacheefo into ActiveRecord::Base
Cacheefo::Railtie.insert

# Define schema for TestModel
ActiveRecord::Schema.define(:version => 20110731035436) do
  create_table "test_models", :force => true do |t|
    t.float "price", :default => "1.99"
    t.boolean "active", :default => true
    t.datetime "updated_at"
    t.datetime "created_at"
  end
end

class TestModel < ::ActiveRecord::Base
end