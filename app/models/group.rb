class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :location, presence: true
end
