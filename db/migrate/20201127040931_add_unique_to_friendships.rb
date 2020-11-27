class AddUniqueToFriendships < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE friendships ADD CONSTRAINT friendship_unique UNIQUE (user_id, friend_id);
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE friendships DROP CONSTRAINT friendship_unique;
        SQL
      end
    end
  end
end
