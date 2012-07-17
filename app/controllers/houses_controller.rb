class HousesController < ApplicationController

	def index
		@search = House.search(params[:search])
		@house = @search.all
		@house_count = @search.count
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
		@house = House.find(params[:id])
		redirect_to root_path unless current_user?(@house.user)
    	@house.destroy
    	redirect_to root_path
	end
end
