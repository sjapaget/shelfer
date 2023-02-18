

json.id @book.id
json.title @book.title
json.blurb @book.blurb
json.number_of_pages @book.number_of_pages
json.long? @book.long?
json.contributors do
  json.array! @book.contributions do |contribution|
    contributor = contribution.contributor.to_builder
    json.role contribution.role
    json.merge! contributor
  end
end
