class House < ActiveRecord::Base
	attr_accessible :desc, :status, :city, :address, :rent, :r_type, :B_rooms, :min_stay
	belongs_to :user
	default_scope :order => 'created_at DESC'
	validates_presence_of :desc, :user_id, :city, :address, :rent
	validates_presence_of :B_rooms, :min_stay, :status
	validates_length_of :desc, :maximum => 300
	
end
