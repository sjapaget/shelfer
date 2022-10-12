class Api::V1::ShelvesController < ApplicationController
  def index
    @shelves = policy_scope(shelf)
  end
end
