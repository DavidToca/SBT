require_relative '../app.rb'
require 'rspec'
require 'rack/test'

#set :environment, :test

describe "App service" do 

	include Rack::Test::Methods

  def app
    Sinatra::Application.new
  end

	it "Testing home page" do
		
	end

	it "Testing module page" do

	end

end