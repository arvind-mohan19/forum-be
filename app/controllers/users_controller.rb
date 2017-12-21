class UsersController < ApplicationController
	def index
	    render json: {user: User.first}
  	end
end
