class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
    @invites = Friendship.all.where(user_id: @user.id, status: true)
    @invites = @invites.or(Friendship.where(friend_id: @user.id, status: true))
  end
end
