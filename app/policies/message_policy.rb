class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true # Anyone can view a message
  end

  def create?
    true # Anyone can create a message
  end

  def update?
    record.user == user # Only message creator can update it
    # - record: the message passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user # Only message creator can destroy it
  end
end
