json.array! @toilets do |toilet|
  json.extract! toilet, :id, :name, :description, :address
end
