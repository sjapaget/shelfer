class BookPolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    true
  end

  def update?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  private

  def user_is_owner?
    user.id == record.user_id
  end
end
