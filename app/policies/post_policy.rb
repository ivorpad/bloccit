class PostPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  class Scope < Scope
    def resolve
      if user.present?
        if user.admin? || user.moderator?
          scope.all
        else
          scope.where(published: true)
        end
      else
        scope
      end
    end

    def update?
      user.admin? || !post.published?
    end
end
end
