json.array!(@submissions) do |submission|
  json.extract! submission, :id, :composite_id, :user_id
  json.url submission_url(submission, format: :json)
end
