class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
    @invited = Friendship.find_by(user_id: current_user.id, friend_id: @user.id)
    @was_invited = Friendship.find_by(user_id: @user.id, friend_id: current_user.id)
  end
end
