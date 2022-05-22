json.extract! attendance, :id, :user_id, :time_in, :time_out, :created_at, :updated_at
json.url attendance_url(attendance, format: :json)
