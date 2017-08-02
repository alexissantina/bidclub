ENV['RACK_ENV'] = 'test'

require("rspec")
require("pg")
require("sinatra/activerecord")
require("art")

RSpec.configure do |config|
  config.after(:each) do
    Art.all().each() do |art|
      art.destroy()
    end
  end
end
