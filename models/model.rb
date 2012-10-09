class Model
	include MongoMapper::Document

	key :name, String
	key :cont, String, :unique => true

	attr_accessible :name, :cont

	validates_presence_of :name, :cont
	
end