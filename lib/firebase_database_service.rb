require 'firebase-ruby'

class FirebaseDatabaseService
	attr_reader :firebase_db

	def initialize
		base_uri = 'https://voicewebapp-8c75c-default-rtdb.firebaseio.com/'
		
		@firebase_db = Firebase::Client.new(base_uri)
	end

	def update(channel, data)
		@firebase_db.set(channel, data)
	end
end