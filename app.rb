require 'json'
require 'mongo'
require 'mongo_mapper'
require 'sinatra/base'
require 'sinatra/reloader'

module MyApplication
	class App < Sinatra::Base 

		#set :environment, :development
		
		configure :development do
      register Sinatra::Reloader
    end

	end
end