class Room < ActiveRecord::Base
  def self.search(search)
    if search
      where(["name LIKE ?" , "%#{search}%"])
    else
      all
    end
  end

  validates :location, :size, presence: true, uniqueness: false
  validates :status, presence:true
  validates_uniqueness_of :name, scope: :location
  has_many :bookings
  has_many :searches
end
