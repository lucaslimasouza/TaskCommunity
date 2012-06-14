#encoding: utf-8

class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		respond_to do |format|
			format.html
		end
	end

end
