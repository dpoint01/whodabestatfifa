class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :location, presence: true

  def self.search(search)
    if search
      find(:all, :conditions => ['name ILIKE ? OR location ILIKE ?', "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end

  def member?(user)
    bool = false

    self.memberships.each do |membership|
      if user.id == membership.user_id
        bool = true
      end
    end

    return bool
  end

end
