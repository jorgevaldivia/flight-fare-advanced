class CreateStats < ActiveRecord::Migration
  def self.up
    create_table :stats do |t|
      t.references :flight
      t.float :price
      t.string :airline
      t.text :link
      t.string :departure_date
      t.string :return_date

      t.timestamps
    end
  end

  def self.down
    drop_table :stats
  end
end
