class BookingsController < ApplicationController

	def create
		@booking = Booking.new(params[:booking])
		@booking.user_id = current_user.id
		if @booking.save
      	flash[:notice] = "house booked!"
      	redirect_back_or_default account_url
      	else
      	redirect_to show_path
    	end
	end

	def book

	end
end
