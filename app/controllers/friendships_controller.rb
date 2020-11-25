class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(user_id: current_user.id, friend_id: params[:friend_id], status: false)

    if @friendship.save
      redirect_to users_path
    else
      redirect_to users_path
    end
  end

  def update
    @friendship = Friendship.find(params[:id])

    @friendship.status = true
    @friendship.save
    redirect_to users_path
  end

  def destroy
    @friendship = Friendship.find(params[:id])

    @friendship.delete

    redirect_to users_path
  end
end
