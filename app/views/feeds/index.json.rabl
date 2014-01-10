collection @feeds
attributes :id, :url, :title, :created_at, :updated_at
child :entries, :object_root => false do
  attributes :id, :guid, :link, :title, :published_at, :json, :created_at, :updated_at
end
node(:has_favorited) { |feed| feed.has_favorited?(@current_user_id) }
