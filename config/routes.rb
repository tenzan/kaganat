# frozen_string_literal: true

Rails.application.routes.draw do
  root 'bookings#index'

  resources :customers do
    resources :bookings
  end
  resources :bookings, only: :index
end
