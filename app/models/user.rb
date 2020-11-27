class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friendships
  has_many :friends, through: :friendships, source: :friend
  has_many :f_posts, through: :friends, source: :posts
  def friends_join(param)
    i_invited = Friendship.where('user_id = ?', param)
    i_was_invited = Friendship.where('friend_id = ?', param)

    { invited: i_invited, was_invited: i_was_invited }
  end
end
