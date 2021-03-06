#enconding: utf-8
class WatchesController < ApplicationController

	def add
		list = List.public.find(params[:id])
		current_user.watch list
		flash[:notice] = 'Successfully watched'
		redirect_to root_path
	end

	def index
		@user_watches = current_user.watched_lists.public
		respond_with @user_watches
	end

	def destroy
		list = List.find(params[:id])
		current_user.unwatch list
		redirect_to watches_path
	end

end
