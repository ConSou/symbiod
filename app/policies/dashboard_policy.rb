# frozen_string_literal: true

# Allows only stuff to manage newcomers applications
class DashboardPolicy < ApplicationPolicy
  def allowed?
    # Using safe operator, because user can be nil here
    # it he is not authenticated
    result = user&.active? || user&.has_role?(:stuff)
    return false if result.nil?
    result
  end

  private

  def stuff?
    user.has_role? :stuff
  end
end
