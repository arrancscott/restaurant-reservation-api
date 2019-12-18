# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.nil? || user.role.nil?

    send(user.role)
  end

  private

  def admin
    can :manage, :all
  end

  def restaurant
    can :manage, Reservation
  end

  def guest
    can :manage, Reservation
  end
end
