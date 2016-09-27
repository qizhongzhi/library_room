class UsersController < ApplicationController

	before_action :find_user, only:[:show, :edit, :update, :destroy,:reservations]

	def index
		@users = User.all.order("created_at DESC")
	end

	def show
		
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if user.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @user.update(user_params)
			redirect_to root_path
		else
			render 'edit'			
		end
	end

	def destroy
		@bookings=Booking.all
      	@bookings.each do |booking|
		    if booking.user_id == @user.id
		        booking.destroy
		    end
		end
	   	@user.destroy
    		respond_to do |format|
      		format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
      		format.json { head :no_content }
      		
    	end
  	end

  	def reservations
  		
  	end

	private

		def user_params
	      params.require(:user).permit(:email, :password, :name, :address, :telephone, :user_type)
	    end

	    def find_user
			@user = User.find(params[:id])
		end
end
