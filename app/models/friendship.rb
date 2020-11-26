class Friendship < ApplicationRecord
  before_save :find_lesser_id

  self.primary_keys = :user_id, :friend_id
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def find_lesser_id
    if self.user_id > self.friend_id
      puts "It entered here?"
      self.user_id, self.friend_id = self.friend_id, self.user_id
      puts self.user_id, self.friend_id
    end
  end
end
