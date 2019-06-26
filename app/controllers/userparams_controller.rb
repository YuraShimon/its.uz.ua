class UserparamsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_userparam, except:[:new,:create]

	def index
	    if @userparam.nil?
	    	edirect_to new_userparam_path
	    else
	        redirect_to userparam_path(@userparam.id)
	    end
	end

	def show
		 @user = Userparam.find(current_user.id)
	end

	def new
		@userparam=Userparam.new
	end

	def create
		params[:userparam][:user_id]=current_user.id
		@userparam=Userparam.create(userparam_params)
		if @userparam.save
			redirect_to userparam_path(@userparam.id)
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		@userparam.update(userparam_params)
		redirect_to userparam_path(@userparam.id)
	end

	def destroy
		@userparam.destroy
		redirect_to root_path
	end

	private 

	def userparam_params
		params.require(:userparam).permit(:user_id, :firstname, :lastname, :phone, :country, :city, :age)
	end

	def get_userparam
    	@userparam = Userparam.find_by(user_id: current_user.id)
	end

end
