class EditpassController < ApplicationController
 	respond_to :json

	def update
		puts 'update_password!!!!!------------------------------------'
		# current_user
		@user = User.find(current_user.id)
		if @user.update(user_params)
			
		  # Sign in the user by passing validation in case their password changed
		  render json: true
		  # sign_in @user, :bypass => true

		  # redirect_to root_path
		else
			render json: false
		  # render "edit"
		end
	end


	def user_params
	    params.require(:user).permit(:password, :password_confirmation)
	end

end