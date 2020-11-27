class Friendship < ApplicationRecord
  before_update :reverse_id

  self.primary_key = :user_id, :friend_id
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def reverse_id
    self.user_id, self.friend_id = friend_id, user_id if user_id > friend_id
  end
end
