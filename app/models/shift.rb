class Shift < ApplicationRecord
  belongs_to :user

  validate :finish_cannot_be_before_start
  validates :start, presence: true
  validates :break_length, 
    presence: true,
    numericality: {greater_than: -1, only_integer: true}
  validates :finish, presence: true

  # Default break length to 0 if left blank
  after_initialize :init

  def hours_worked
    hours = self.finish.hour - self.start.hour
    minutes = (self.finish.min - self.start.min).to_f / 60
    shift_length = hours + minutes
    round_to_100( shift_length - (self.break_length.to_f / 60) )
  end

  def cost(rate)
    cost = self.hours_worked * rate
    round_to_100(cost)
  end

  private
  def round_to_100(num)
    (num*100).ceil/100.0
  end

  def init
    self.break_length  ||= 0        
  end

  # To validate start and finish dates
  def finish_cannot_be_before_start
    if start.to_datetime > finish.to_datetime
      errors.add(:base, "Your shift can't finish before it starts") 
    end
  end

end
