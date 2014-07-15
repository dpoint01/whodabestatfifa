class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :games, :winner_score, :creator_score
    rename_column :games, :loser_score, :opponent_score
  end

  def self.down
  end
end
