class ShelfPolicy < ApplicationPolicy
  def create?
    true
  end

  def show?
    user.id == record.user_id
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end
  end
end
