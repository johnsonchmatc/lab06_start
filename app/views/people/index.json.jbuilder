json.array!(@people) do |person|
  json.extract! person, :id, :first_name, :last_name, :height_feet, :height_inches, :weight, :ssn, :date_of_birth, :email, :phone
  json.url person_url(person, format: :json)
end
