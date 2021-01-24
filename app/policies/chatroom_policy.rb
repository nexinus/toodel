class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true # Anyone can view a chatroom
  end

  def create?
    true # Anyone can create a chatroom
  end

  def update?
    record.user == user # Only chatroom creator can update it
    # - record: the chatroom passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user # Only chatroom creator can destroy it
  end
end
