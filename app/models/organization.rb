class Organization < ApplicationRecord
  has_many :users
  has_many :shifts

  validates :hourly_rate,
            presence: true,
            numericality: { greater_than: 0 }
  validates :name, presence: true, uniqueness: true

  def valid_shifts
    self.shifts.select {|shift| shift.departure_date.nil? }
  end

  def old_shifts
    self.shifts.select {|shift| shift.departure_date != nil }
  end

end
