class DisplayController < ApplicationController
  def home
  	
  	@title = "Home"
  	@house = House.new
  	@feed_items = House.all 
  	@bookers = Booking.all
  end

  def search
  	@title = "Search Results"
  end

end
