class Organization < ApplicationRecord
  has_many :users
  has_many :shifts

  validates :hourly_rate,
            presence: true,
            numericality: { greater_than: 0 }
  validates :name, presence: true, uniqueness: true

  def shifts
    shifts = users.map { |user| user.shifts }
  end
end
