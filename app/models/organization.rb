class Organization < ApplicationRecord
  has_many :users

  validates :hourly_rate, 
    presence: true, 
    numericality: {greater_than: 0}
  validates :name, presence: true, uniqueness: true


  def shifts
    shifts = self.users.map { |user| user.shifts }
  end

end
