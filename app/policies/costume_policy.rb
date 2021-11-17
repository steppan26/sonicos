class CostumePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    user != nil && (record.user == user || user.admin)
  end

  def destroy?
    user != nil && (record.user == user || user.admin)
  end
end
