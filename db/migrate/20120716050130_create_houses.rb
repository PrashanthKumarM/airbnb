class CreateHouses < ActiveRecord::Migration
  def self.up
    create_table :houses do |t|
      t.string :desc
      t.integer :user_id
      t.string :status
      t.string :city
      t.string :address
      t.integer :rent
      t.string :r_type
      t.integer :B_rooms
      t.integer :min_stay

      t.timestamps
    end
    add_index :houses, :user_id
  end

  def self.down
    drop_table :houses
  end
end
