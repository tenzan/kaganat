class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :type
      t.integer :rooms
      t.boolean :wifi
      t.string :phone
      t.string :address
      t.text :description
      t.boolean :available
      t.datetime :check_in
      t.datetime :check_out
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
