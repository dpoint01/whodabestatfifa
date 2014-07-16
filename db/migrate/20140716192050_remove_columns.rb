class RemoveColumns < ActiveRecord::Migration
  def change
    remove_column :users , :wins
    remove_column :users , :losses
    remove_column :users , :points
    remove_column :users , :goals_scored
    remove_column :users , :games_played

    add_column :users , :position , :float
  end
end
