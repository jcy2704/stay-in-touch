class CreatePrimaryKey < ActiveRecord::Migration[5.2]
  def change
    execute "ALTER TABLE friendships ADD PRIMARY KEY (user_id, friend_id);"
  end
end
