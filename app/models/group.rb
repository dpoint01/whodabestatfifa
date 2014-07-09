class Group < ActiveRecord::Base
  has_many :memberships
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :location, presence: true
end
