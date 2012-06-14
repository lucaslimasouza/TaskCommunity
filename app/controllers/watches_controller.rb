
class WatchesController < ApplicationController

	def index
		@watches = Watch.includes(:list)
	end

	def new
		@watch = Watch.new
	end

	def add
		@watch = Watch.new
		@watch.list_id=(List.find(params[:id]).id)
		@watch.user_id=(current_user.id)
		if@watch.save
			flash[:notice] = "Successfully created."
		 	redirect_to root_url
		else
			flash[:notice] = "Falha."
		 	redirect_to root_url
		end
	end

	def user_watches
		@user_watches = current_user.watches
		respond_to do |format|
			format.html
		end
	end

end
