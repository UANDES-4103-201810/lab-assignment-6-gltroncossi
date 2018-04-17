class RegistrationsController < ApplicationController
	def new
	
	end

	def user_params
		params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
	end

	def create
	    #complete this method
		@user = User.new(user_params)

			if @user.save
				cookies.signed[:user_id] = @user.id
				redirect_to root_path

			else
				flash[:notice] = "Action failed"
				redirect_to sign_in_path
			end
		end
end
