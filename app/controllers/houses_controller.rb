class HousesController < ApplicationController

	
	def show
		@house = House.find(params[:id])
		@booking = Booking.new
	end
	
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

 	def set_book
 		@house = House.find(params[:id])
 		@house.booker_id = current_user.id
 		current_user.booked_id = @house.id
 		if params[:n].to_i > @house.r_type
 			flash[:notice] = "higher number"
 		else
 		@house.r_type = @house.r_type - params[:n].to_i
 		if @house.update_attributes(params[:user])
 			if @house.update_attributes(params[:r_type])
      			flash[:notice] = "booking status updated."
      			redirect_to @house
			else
 				flash[:notice] = "u r wrong."
 			end
		
		else
			flash[:notice] = "u r wrong"
		end
		current_user.update_attributes(params[:booked_id])
	end
 end

end
