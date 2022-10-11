json.extract! profile, :id, :name, :contact_no, :age, :gender, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
