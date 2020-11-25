require 'rails_helper'

RSpec.describe 'Invite friend', type: :feature do
  before(:each) do
    User.create(email: 'user@email.com', password: 'password', name: 'user')
    User.create(email: 'user2@email.com', password: 'password', name: 'user2')
    Friendship.create(user_id: 1, friend_id: 2, status: false)    
  end

  it 'Verify if there is a pending invitation on users#index page' do
    visit '/users/sign_in'
    fill_in 'Email',	with: 'user@email.com'
    fill_in 'Password',	with: 'password'

    click_button 'Log in'

    visit '/users'
    expect(page).to have_content 'Pending'
  end
end


RSpec.describe 'Accept friend', type: :feature do
  before(:each) do
    User.create(email: 'user@email.com', password: 'password', name: 'user')
    User.create(email: 'user2@email.com', password: 'password', name: 'user2')
    Friendship.create(user_id: 1, friend_id: 2, status: false)  
    Friendship.update(user_id: 1, friend_id: 2, status: true)  
  end

  it 'Verify if User accepted the invitation' do
    visit '/users/sign_in'
    fill_in 'Email',	with: 'user@email.com'
    fill_in 'Password',	with: 'password'

    click_button 'Log in'

    visit '/users'
    expect(page).to have_content 'Friends'
  end
end
