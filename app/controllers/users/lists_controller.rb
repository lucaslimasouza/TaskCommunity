class Users::ListsController < ApplicationController

	def index
		@user_lists = current_user.lists
		respond_with @user_lists
	end

	def new
		@list = List.new
		1.times {@list.tasks.build}
	end

	def create
		@list = List.new(params[:list])
		@list.user=(current_user)
		@list.save
    redirect_to user_lists_path(current_user)
	end

	def edit
		@list = current_user.lists.find(params[:id])
	end

	def update
		@list = List.find(params[:id])
		@list.update_attributes(params[:list])
		respond_with(@list)
	end

	def show
		@list = current_user.lists.find(params[:id])
	end

	def destroy
		@list = current_user.lists.find(params[:id])
		@list.destroy
		respond_with @list
	end
end
