class SessionsController < ApplicationController
	def new
	end

	def user_params
		params.require(:session).permit(:email, :password)
	end

	def create
		#complete this method

		session[:current_user] = @user.id
	end

	def destroy
		#complete this method
		@session = SessionsController.find(params[:id])
		@session.destroy

		respond_to do |format|
			format.html { redirect_to session_url }
			format.json { head :no_content }
		end
	end
end
