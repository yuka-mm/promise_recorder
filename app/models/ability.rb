# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(parent)
    return unless parent&.admin?

    can :access, :rails_admin
    can :manage, :all
  end
end
