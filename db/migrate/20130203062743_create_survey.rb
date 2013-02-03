class CreateSurvey < ActiveRecord::Migration
  def self.up
  	create_table :surveys do |s|
  		s.integer :user_id
  		s.integer :happiness
  		s.text :comments
  		s.integer :speed
  		s.integer :behavior
  		s.integer :score
  		s.timestamps
  	end
  end

  def self.down
  	drop_table :surveys
  end
end
