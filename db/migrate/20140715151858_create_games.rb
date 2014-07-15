class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :creator_id, null: false
      t.integer :opponent_id, null: false
      t.integer :winner_id
      t.integer :loser_id
      t.integer :winner_score, null: false
      t.integer :loser_score, null: false
      t.boolean :draw?, default: false

      t.timestamps
    end
  end
end
