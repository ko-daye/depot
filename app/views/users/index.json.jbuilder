json.array!(@users) do |user|
  json.extract! user, :name, :password_figest
  json.url user_url(user, format: :json)
end
