class ApplicationController < ActionController::API
	include ErrorSerializer
	
	def respond_with_errors(object)
  		render json: {errors: ErrorSerializer.serialize(object)}, status: :unprocessable_entity
	end
end
