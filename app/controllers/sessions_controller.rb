class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.authenticate(params[:user_name], params[:password])
		if @user
			session[:user_id] = @user.id
			flash[:notice] = current_user.user_name << " is logged in."
			redirect_to "/"
		else
			flash[:notice] = "There was a problem logging you in. "
			redirect_to root_path
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You've been logged out successfully."
		redirect_to "/"
	end

end