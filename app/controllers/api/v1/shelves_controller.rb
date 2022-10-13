class Api::V1::ShelvesController < ApiController
  def index
    @shelves = policy_scope(Shelf)
  end
end
