require 'json'
require 'sass'
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

    get '/' do
    	#erb :"index"
    	"hello world"
    end


    get '/stylesheet/:name.css' do
			content_type 'text/css', :charset => 'utf-8'
			scss :"stylesheet/#{params[:name]}"
		end
	end
end