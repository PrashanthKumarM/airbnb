class Survey < ActiveRecord::Base
	attr_accessible :happiness, :comments, :speed, :behavior, :user_id

	belongs_to :user

	before_create :calculate_score

	validates_presence_of :user_id, :happiness, :speed, :behavior

	private

	def calculate_score
		self.score = self.happiness + self.speed + self.behavior
	end

end