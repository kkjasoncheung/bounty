json.extract! forum, :id, :title, :description, :location, :radius, :duration, :created_at, :updated_at
json.url forum_url(forum, format: :json)