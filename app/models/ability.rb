class Ability
  include CanCan::Ability

  def initialize(user)
    can :update, Post do |post|
        post.user==user
    end
    can :destroy, Post do |post|
        post.user==user
    end

    can :update, Comment do |comment|
        comment.user==user
    end
    can :destroy, Comment do |comment|
        comment.user==user
    end
    can :create,Post
    can :create,Comment
  end
end
