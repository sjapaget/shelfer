json.array! @shelves do |shelf|
  json.id shelf.id
  json.name shelf.name
  json.description shelf.description
  json.user shelf.user
end
