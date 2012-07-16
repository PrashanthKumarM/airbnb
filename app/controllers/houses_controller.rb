class HousesController < ApplicationController
		before_filter :authenticate, :only => [:create, :destroy]

	def index
	end

	def create 
	  @house = current_user.houses.build(params[:house]) 
	  	if @house.save
      		flash[:success] = "Your house is added out to rent!!"
      		redirect_to root_path
		else
			@feed_items = []
			render 'display/home' 
		end
	end

	def destroy
    	@house.destroy
    	redirect_back_or root_path
	end
end
