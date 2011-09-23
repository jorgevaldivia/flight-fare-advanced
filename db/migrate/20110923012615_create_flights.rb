class CreateFlights < ActiveRecord::Migration
  def self.up
    create_table :flights do |t|
      t.string :origin
      t.string :destination
      t.string :year
      t.string :month

      t.timestamps
    end
  end

  def self.down
    drop_table :flights
  end
end
