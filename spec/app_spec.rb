require_relative '../app.rb'
require 'rspec'
require 'rack/test'

#set :environment, :test

describe "App service" do 

	include Rack::Test::Methods

  def app
    MyApplication::App
  end

	it "Testing home page" do
		get '/'
		last_response.should be_ok
		last_response.body.should == 'hello world'
	end

	it "Testing module page" do

	end

end