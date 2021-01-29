json.extract! @toilet, :id, :name, :description, :address
json.reviews @toilet.reviews do |review|
  json.extract! review, :id, :content
end
