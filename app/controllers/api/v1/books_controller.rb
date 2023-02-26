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

    if @book.save
      redirect_to api_v1_book_path(@book)
    else
      render json: @book.errors, status: :unprocessable_entity
    end
    authorize @book
  end

  def update
    @book = Book.find(params[:id])

    authorize @book

    if @book.update(book_params)
      redirect_to api_v1_book_path(@book)
    else
      render json: @book.errors, status: :not_modified
    end
  end

  def destroy
    @book = Book.find(params[:id])
    authorize @book
    @book.destroy
    redirect_to api_v1_books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :number_of_pages, :blurb, :user_id)
  end
end
