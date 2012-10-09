require './helpers/helperdo'

module MyApplication
	class Module < App

		get '/' do
			erb :module	
		end

	end
end