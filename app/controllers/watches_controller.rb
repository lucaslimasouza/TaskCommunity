
class WatchesController < ApplicationController

	def add
		@watch = Watch.new
		@watch.list_id=(List.find(params[:id]).id)
		@watch.user_id=(current_user.id)
		if @watch.save
			flash[:notice] = 'Successfully watched'
			redirect_to root_path
		end
	end

	def index
		@user_watches = current_user.watches
		respond_with @user_watches
	end

	def destroy
		@watch = Watch.find(params[:id])
		@watch.destroy
		respond_with @watch
	end

end
