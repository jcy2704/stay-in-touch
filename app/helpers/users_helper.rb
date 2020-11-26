module UsersHelper
  def friendship(user)
    not_current_user(user) if user != current_user
  end

  private

  def none_friendship(user)
    invites = current_user.friends_join(current_user.id)
    if invites[:was_invited].any? && !invites[:was_invited].find_by(user_id: user.id).nil?
      if invites[:was_invited].find_by(user_id: user.id).status == false
        render partial: 'accept_form', locals: { invites: invites, user: user }
      else
        label_tag 'Friends'
      end
    else
      button_to  'Invite', friendships_path(friend_id: user.id)
    end
  end

  def not_current_user(user)
    friendships = current_user.friendships
    if friendships.empty? || friendships.find_by(friend_id: user.id).nil?
      none_friendship(user)
    elsif friendships.find_by(friend_id: user.id).status == false
      label_tag 'Pending'
    else
      label_tag 'Friends'
    end
  end
end
