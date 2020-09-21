json.extract! timelog, :id, :project_id, :user_id, :amount, :created_at, :updated_at
json.url timelog_url(timelog, format: :json)
