#encoding: utf-8

class HomeController < ApplicationController
	def index
		@lists_public = List.where("user_id <> ?",current_user).public
		respond_to do |format|
      			format.html
		end
	end
end
