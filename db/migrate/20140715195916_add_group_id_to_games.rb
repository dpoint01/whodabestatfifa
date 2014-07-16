class AddGroupIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :group_id, :integer
  end
end
