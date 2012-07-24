class BookingsController < ApplicationController

	def create
		@booking = Booking.new(params[:booking])
		@boo = Booking.find_by_house_id(@booking.house_id)

		unless @boo.nil?
			validates_date @booking.check_in,
			:between => [@boo.check_in, @boo.check_out]
		end

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

		def destroy
		@booking = Booking.find(params[:id])
		redirect_to root_path unless current_user?(@booking.user)
    	@booking.destroy
    	redirect_to root_path
	end
end
