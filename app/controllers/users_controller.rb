class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
    #@friendships = Friendship.find_by(user_id: current_user, friend_id: @user.id)
    @invited = current_user.friends_join(current_user.id)
    @invited = @invited[:invited].find_by(friend_id: @user.id)
  end
end
