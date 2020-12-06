class ToiletPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true # Anyone can view a toilet
  end

  def create?
    return true # Anyone can create a toilet
  end

  def update?
    record.user == user # Only toilet creator can update it
  end

  def destroy
    record.user == user # Only toilet creator can destroy it
  end
end
