json.extract! booking, :id, :name, :type, :rooms, :wifi, :phone, :address, :description, :available, :check_in, :check_out, :customer_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
