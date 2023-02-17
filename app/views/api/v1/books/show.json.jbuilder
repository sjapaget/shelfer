json.id @book.id
json.title @book.title
json.blurb @book.blurb
json.number_of_pages @book.number_of_pages
json.long? @book.long?
json.contributors do
  json.authors @book.contributions.where(role: 'author')
  json.editors @book.contributions.where(role: 'editor')
end
