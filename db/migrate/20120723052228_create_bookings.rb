class CreateBookings < ActiveRecord::Migration
  def self.up
    create_table :bookings do |t|
    	t.date :check_in
    	t.date :check_out
    	t.integer :house_id
    	t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bookings
  end
end
