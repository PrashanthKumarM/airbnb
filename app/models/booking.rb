class Booking < ActiveRecord::Base
	attr_accessible :check_in, :check_out, :house_id

	belongs_to :house
	belongs_to :user

	default_scope :order => 'created_at DESC'
end
