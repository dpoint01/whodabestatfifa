class Game < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  belongs_to :opponent, class_name: "User"
  belongs_to :winner, class_name: "User"
  belongs_to :loser, class_name: "User"

  belongs_to :group

  validates :creator_id, presence: true
  validates :opponent_id, presence: true
  validates :creator_score, presence: true
  validates :opponent_score, presence: true

  after_save :determine_winner

    protected

      def determine_winner

        if creator_score > opponent_score
          winner = creator
          loser = opponent
        elsif opponent_score > creator_score
          winner = opponent
          loser = creator
        end

      end

end
