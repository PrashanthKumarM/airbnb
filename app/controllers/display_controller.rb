class DisplayController < ApplicationController
  def home
  	@title = "Home"
  end

  def search
  	@title = "Search Results"
  end

end
