class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :memberships
  has_many :groups, through: :membership


  has_many :games_created, foreign_key: :creator_id, class_name: "Game"
  has_many :games_challenged, foreign_key: :opponent_id, class_name: "Game"

  # has_many :games_won, foreign_key: :winner_id, class_name: "Game"
  # has_many :games_lost, foreign_key: :loser_id, class_name: "Game"

  validates_presence_of :username
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :phone_number
  validates_presence_of :password
  validates_presence_of :email

  validates_uniqueness_of :username
  validates_uniqueness_of :email
  validates_uniqueness_of :phone_number
  validates :phone_number, :length => { :is => 10 }

  # def numb_draws(games)
  #   count = 0

  #   games.each do |game|
  #     if self.id == game.creator_id
  #       if game.creator_score == game.opponent_score
  #         count = count + 1
  #       end
  #     elsif self.id == game.opponent_id
  #       if game.creator_score == game.opponent_score
  #         count = count + 1
  #       end
  #     end
  #   end

  #   return count

  # end

  def games_played(games)
    count = 0

    games.each do |game|
      if self.id == game.creator_id
        count = count + 1
      elsif self.id == game.opponent_id
        count = count + 1
      end
    end

    return count
  end

  def goals_scored(games)
    count = 0

    games.each do |game|
      if self.id == game.creator_id
        count = count + game.creator_score
      elsif self.id == game.opponent_id
        count = count + game.opponent_score
      end
    end

    return count
  end

  def losses(games)
    numb_losses = 0
    count = 0

    games.each do |game|
      if self.id == game.creator_id
        if game.creator_score < game.opponent_score
          count = count + 1
        end
      elsif self.id == game.opponent_id
        if game.opponent_score < game.creator_score
          count = count + 1
        end
      end
    end

    numb_losses = count

    return numb_losses

  end

  def wins(games)
    numb_wins = 0
    count = 0

    games.each do |game|
      if self.id == game.creator_id
        if game.creator_score > game.opponent_score
          count = count + 1
        end
      elsif self.id == game.opponent_id
        if game.opponent_score > game.creator_score
          count = count + 1
        end
      end
    end

    numb_wins = count


    return numb_wins

  end

  def goals_per_game(games)
    goals_per_game = 0

    if games_played(games) != 0
      goals_per_game = (goals_scored(games) / games_played(games).to_f).round(2)
      return goals_per_game
    elsif games_played(games) == 0
      return goals_per_game
    end

  end

  def ratio(games)
    ratio = 0.0

    if wins(games) == 0 && losses(games) == 0
     return ratio
    elsif wins(games) == 1 && losses(games) == 0
      return 1.0
    else
     calc =  (wins(games).to_f / losses(games).to_f).round(2)
     return calc
    end
  end

end
