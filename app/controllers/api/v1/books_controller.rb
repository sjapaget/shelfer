class Api::V1::BooksController < ApiController
  def index
    @books = policy_scope(Book)
  end

  def show
    @book = Book.find(params[:id])

    authorize @book
  end

  def create
    @book = Book.new(book_params)

    @book.save
    redirect_to api_v1_book_path(@book)
    authorize @book
  end

  private

  def book_params
    params.require(:book).permit(:title, :number_of_pages, :blurb)
  end
end
