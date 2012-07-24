class Booking < ActiveRecord::Base
	attr_accessible :check_in, :check_out, :house_id

	belongs_to :house
	belongs_to :user

	default_scope :order => 'created_at DESC'

	validates_date :check_in, :before => :check_out

		def self.vali(god)
		@boo = Booking.all
		
		@boo.each do |d|
			if(d.house_id == god)
			validates_date :check_in, :between => [d.check_in, d.check_out]
			validates_date :check_out, :between => [d.check_in, d.check_out]
			end
		end
	end

end
