class Friendship < ApplicationRecord
  # before_save :find_lesser_id

  self.primary_key = :user_id, :friend_id
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  # def find_lesser_id
  #   self.user_id, self.friend_id = friend_id, user_id if user_id > friend_id
  # end
end
