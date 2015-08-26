json.array!(@users) do |user|
  json.extract! user, :id, :full_name, :user_name, :email, :avatar, :password_hash, :password_salt, :bio, :admin
  json.url user_url(user, format: :json)
end
