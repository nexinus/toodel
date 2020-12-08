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
    # - record: the toilet passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user # Only toilet creator can destroy it
  end
end
