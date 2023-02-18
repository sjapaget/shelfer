json.id @book.id
json.title @book.title
json.blurb @book.blurb
json.number_of_pages @book.number_of_pages
json.long? @book.long?
json.contributors do
  @book.contributions.includes(:contributor).each do |contribution|
    json.set! contribution.role, contribution.name
  end
end
