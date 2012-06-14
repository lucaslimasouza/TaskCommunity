#encoding: utf-8

class ListsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@lists = List.where(:user_id => "<> #{current_user}").public
		respond_to do |format|
      			format.html
		end
	end

	def new
		@list = List.new
		1.times {@list.tasks.build}
	end

	def create
		@list = List.new(params[:list])
		@list.user=(current_user)
		if @list.save
		 flash[:notice] = "Successfully created survey."
		 redirect_to root_url
		else
		      render :action => 'new'
		end
	end

	def edit
		@list = List.find(params[:id])
	end

	def update
		@list = List.find(params[:id])
		if @list.update_attributes(params[:list])
			flash[:notice] = "Successfully created survey."
		 	redirect_to root_url
		else
			render :action => 'index'
		end
	end

	def show
		@list = List.find(params[:id])
	end

	def user_lists
		@user_lists = current_user.lists
		respond_to do |format|
			format.html
		end
	end
end
