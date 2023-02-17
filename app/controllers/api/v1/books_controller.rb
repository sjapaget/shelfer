class Api::V1::BooksController < ApiController
  def index
    @books = policy_scope(Book)
  end
end
