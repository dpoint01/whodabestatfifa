class Game < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  belongs_to :opponent, class_name: "User"
  belongs_to :winner, class_name: "User"
  belongs_to :loser, class_name: "User"

end
