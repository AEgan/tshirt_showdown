json.array!(@showdowns) do |showdown|
  json.extract! showdown, :id, :theme, :winning_submission, :end_date
  json.url showdown_url(showdown, format: :json)
end
