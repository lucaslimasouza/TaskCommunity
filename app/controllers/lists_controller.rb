#encoding: utf-8

class ListsController < ApplicationController

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
		respond_with(@list)
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
		@list = List.find(params[:id])
	end

	def destroy
		@list = List.find(params[:id])
		@list.destroy
		respond_with @list
	end
end
