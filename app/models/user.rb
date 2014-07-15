class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :memberships
  has_many :groups, through: :membership


  has_many :games_created, foreign_key: :creator_id, class_name: "Game"
  has_many :games_challenged, foreign_key: :opponent_id, class_name: "Game"
  has_many :games_won, foreign_key: :winner_id, class_name: "Game"
  has_many :games_lost, foreign_key: :loser_id, class_name: "Game"

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

  def games
    games_created + games_challenged
  end

  def goals

  end

end
