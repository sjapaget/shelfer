class Api::V1::PlacementsController < ApplicationController
  def create
    @placement = Placement.new(placement_params)
  
    if @placement.save
      redirect_to api_v1_shelves_path(@placement.shelf)
    else
      render json: @placement.errors, status: :unprocessable_entity
    end
    authorize @placement
  end

  def destroy
    @placement = Placement.find(params[:id])

    authorize @placement

    @placement.destroy
  end

  private

  def placement_params
    params.require(:placement).permit(:book_id, :shelf_id)
  end
end
