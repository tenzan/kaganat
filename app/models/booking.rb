# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :customer
  has_many_attached :images
end
