json.array! @books do |book|
  json.id book.id
  json.authors book.authors
  json.title book.title
  json.blurb book.blurb
  json.number_of_pages book.number_of_pages
end
