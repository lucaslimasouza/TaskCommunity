#encoding: utf-8

class HomeController < ApplicationController

	def index
		@lists_public = List.where("user_id <> ?",current_user).public
		respond_with @lists_public
	end
end
