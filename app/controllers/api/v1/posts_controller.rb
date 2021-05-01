class Api::V1::PostsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def webhook
		firebase_db = FirebaseDatabaseService.new
		firebase_db.update('posts', {id: params["queryResult"]["parameters"]["number"].to_i})
		render json: { success: true }
	end
end
