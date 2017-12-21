class SearchesController < ApplicationController
	def index
		if params[:term].present?
			Rails.logger.debug "#{params[:term]}"
      		render json: {search: Question.where("question LIKE :query", query: "%#{params[:term]}%")} 
    	else 
    		Rails.logger.debug "lalalalalalalalals"
    		render json: {search: []}
    	end
	end
end
