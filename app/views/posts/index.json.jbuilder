json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :body, :status, :parent_id
  json.url post_url(post, format: :json)
end
