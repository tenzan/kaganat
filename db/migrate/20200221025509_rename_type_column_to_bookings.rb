# frozen_string_literal: true

class RenameTypeColumnToBookings < ActiveRecord::Migration[6.0]
  def change
    rename_column :bookings, :type, :category
  end
end
