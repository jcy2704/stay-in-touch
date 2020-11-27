class Friendship < ApplicationRecord
  before_update :reverse_id

  self.primary_key = :user_id, :friend_id
  belongs_to :user, class_name: 'User'
  belongs_to :friend, class_name: 'User'

  validates_uniqueness_of :user_id, scope: :friend_id

  private

  def reverse_id
    # self.user_id, self.friend_id = friend_id, user_id if user_id > friend_id
    @new_user = friend_id
    @new_friend = user_id

    Friendship.create(user_id: @new_user, friend_id: @new_friend, status: true)
  end
end
