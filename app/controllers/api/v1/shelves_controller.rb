class Api::V1::ShelvesController < ApiController
  def index
    @shelves = policy_scope(Shelf)
  end

  def show
    @shelf = Shelf.find(params[:id])

    authorize @shelf
  end

  def create
    @shelf = Shelf.new(shelf_params)

    if @shelf.save
      redirect_to api_v1_shelf_path(@shelf)
    else
      render json: @shelf.errors, status: :unprocessable_entity
    end
    authorize @shelf
  end

  def update
    @shelf = Shelf.find(params[:id])
    authorize @shelf
    if @shelf.update(shelf_params)
      redirect_to api_v1_shelf_path(@shelf)
    else
      render json: @shelf.errors, status: :not_modified
    end
  end

  def destroy
    @shelf = Shelf.find(params[:id])

    authorize @shelf
    @shelf.destroy
    redirect_to api_v1_shelves_path
  end

  private

  def shelf_params
    params.require(:shelf).permit(:name, :description, :user_id)
  end
end
