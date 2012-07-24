class House < ActiveRecord::Base
	attr_accessible :desc, :status, :city, :address, :rent, :r_type, :B_rooms, :min_stay

	before_create :set_status

	belongs_to :user

	has_many :booking, :dependent => :destroy

	default_scope :order => 'created_at DESC'
	
	validates_presence_of :desc, :user_id, :city, :address, :rent
	validates_presence_of :r_type, :B_rooms, :min_stay
	
	validates_length_of :desc, :maximum => 300
	validates_inclusion_of :r_type, :in => 0..10


	private

	def set_status
		self.status = r_type
	end
end
