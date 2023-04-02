class PlacementPolicy < ApplicationPolicy

  def create?
    true
  end

  def destroy?
    user_is_owner?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  private

  # overiding ApplicationPolicy's implementation of the #user_is_owner? method to cope with fact that a placement doesn't directly belong to a user
  def user_is_owner?
    user.id == record.shelf.user_id
  end
end
