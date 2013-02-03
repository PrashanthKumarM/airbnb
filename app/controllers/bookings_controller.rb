class BookingsController < ApplicationController
	before_filter :require_user, :only => :create

	def create
		@booking = Booking.new(params[:booking])

		Booking.vali(@booking.house_id)

		@booking.user_id = current_user.id
		if @booking.save
      	flash[:notice] = "house booked!"
      	redirect_back_or_default account_url
      	else
      	flash[:notice] = "house not available for those dates"
      	redirect_to index_path
    	end
	end

	def destroy
		@booking = Booking.find(params[:id])
		redirect_to root_path unless current_user?(@booking.user)
    	@booking.destroy
    	redirect_to root_path
	end
end
