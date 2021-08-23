class Shift < ApplicationRecord
  belongs_to :user
  belongs_to :organization

  validate :cannot_finish_before_start
  validates :start, presence: true
  validates :break_length,
            presence: true,
            numericality: { greater_than: -1, only_integer: true }
  validates :finish, presence: true

  # Default break length to 0 if left blank
  after_initialize :init

  def hours_worked
    hours = finish.hour - start.hour
    minutes = (finish.min - start.min).to_f / 60
    shift_length = hours + minutes
    round_to_100(shift_length - (break_length.to_f / 60))
  end

  def cost(rate)
    cost = hours_worked * rate
    round_to_100(cost)
  end

  private

  def round_to_100(num)
    (num * 100).ceil / 100.0
  end

  def init
    self.break_length ||= 0
  end

  # To validate start and finish dates
  def cannot_finish_before_start
    errors.add(:base, "Your shift can't finish before it starts") if start.to_datetime > finish.to_datetime
  end
end
