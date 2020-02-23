# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :bookings, dependent: :destroy
end
