class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user
	def set_current_user
		Rails.logger.debug "there we are >> > >> > >> >> >> >> #{}"
	end

end
