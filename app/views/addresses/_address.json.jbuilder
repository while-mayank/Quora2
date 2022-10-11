json.extract! address, :id, :address_line, :city, :state, :country, :pincode, :user_id, :created_at, :updated_at
json.url address_url(address, format: :json)
