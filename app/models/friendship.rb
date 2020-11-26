class Friendship < ApplicationRecord
  before_save :find_lesser_id

  self.primary_keys = :user_id, :friend_id
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def find_lesser_id
    if user_id > friend_id
      puts "It entered here?"
      id = user_id
      user_id! = friend_id
      friend_id! = id
      puts user_id, friend_id
    end
  end
end
