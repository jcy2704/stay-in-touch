class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = Friendship.new(user_id: current_user.id, friend_id: params[:friend_id], status: false)

    if @friendship.save
      redirect_to users_path
    else
      redirect_to users_path
    end
  end
end
