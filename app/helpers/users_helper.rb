# rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

module UsersHelper
  def friendship(user)
    not_current_user(user) if user != current_user
  end

  private

  def index_friendship(user)
    invites = current_user.friends_join(current_user.id)
    if invites[:was_invited].any? && !invites[:was_invited].find_by(user_id: user.id).nil?
      if invites[:was_invited].find_by(user_id: user.id).status == false
        render partial: 'accept_form', locals: { friendreq: invites[:was_invited].find_by(user_id: user.id) }
      else
        label_tag 'Friends'
      end
    else
      button_to 'Invite', friendships_path(friend_id: user.id)
    end
  end

  def show_friend(user)
    invited = Friendship.find_by(user_id: current_user.id, friend_id: user.id)
    was_invited = Friendship.find_by(user_id: user.id, friend_id: current_user.id)
    if !invited.nil? && invited.status == false
      label_tag 'Pending'
    elsif !was_invited.nil? && was_invited.status == false
      render partial: 'accept_form', locals: { friendreq: was_invited }
    elsif was_invited.nil? && invited.nil?
      button_to 'Invite', friendships_path(user_id: current_user.id, friend_id: user.id)
    else
      label_tag 'Friends'
    end
  end

  def not_current_user(user)
    friendships = current_user.friendships
    show_friend(user) if current_page?(user_path(user.id))

    if friendships.empty? || friendships.find_by(friend_id: user.id).nil?
      index_friendship(user)
    elsif friendships.find_by(friend_id: user.id).status == false
      label_tag 'Pending'
    else
      label_tag 'Friends'
    end
  end
end

# rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
