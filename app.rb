require 'json'
require 'sass'
require 'mongo'
require 'mongo_mapper'
require 'sinatra/base'
require 'sinatra/content_for'
require 'sinatra/reloader'
require './helpers/helperdo'
require 'newrelic_rpm'

#MONGOHQ
if ENV['MONGOHQ_URL']
  uri = URI.parse(ENV['MONGOHQ_URL'])
  MongoMapper.connection = Mongo::Connection.from_uri(ENV['MONGOHQ_URL'])
  MongoMapper.database = uri.path.gsub(/^\//, '')
else
	MongoMapper.database = "SBT_TEST" 
end

module MyApplication
	class App < Sinatra::Base 
		helpers Sinatra::ContentFor
		helpers Sinatra::Helperdo

		#mixins and no clean sessions deploy heroku ;)
		configure do
			enable :methodoverride
		  enable :sessions
		  set :session_secret, ENV['SESSION_SECRET'] ||= 'ClasesEnVivo'
		end
	
		configure :development do
      register Sinatra::Reloader
      enable :logging
			enable :dump_errors
			set :bind, "localhost"
    end
	
		#redirect no wwww
		before do
    	redirect request.url.sub(/www\./, ''), 301 if request.host =~ /^www/
	 	end

		
    get '/' do
    	#erb :"index"
    end


    get '/stylesheet/:name.css' do
			content_type 'text/css', :charset => 'utf-8'
			scss :"stylesheet/#{params[:name]}"
		end
	end
end