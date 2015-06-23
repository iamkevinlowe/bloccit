class PostPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.nil?
        scope.none
      elsif user.admin? || user.moderator?
        scope.all
      elsif user.present?
        scope.where(:user_id => user.id)
      end
    end

  end

  def index?
    true
  end
end