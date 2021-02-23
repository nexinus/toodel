class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true # Anyone can view a review
  end

  def create?
    # true # Anyone can create a review
    !user.nil? # Any logged in user can create a review
    # !record.user == user # Toilet owner cannot create own review
    # - record: the review passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def update?
    record.user == user # Only review creator can update it
    # - record: the review passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    # record.user == user # Only review creator can destroy it
    update? # same logic
  end
end
