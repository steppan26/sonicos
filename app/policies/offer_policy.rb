class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def destroy?
    if user == record.user
      true
    end
  end

  def accept?
    true
  end

  def cancel?
    true
  end
end
