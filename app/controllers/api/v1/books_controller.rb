class Api::V1::BooksController < ApiController
  def index
    @books = policy_scope(Book)
  end

  def show
    @book = Book.find(params[:id])

    authorize @book
  end
end
