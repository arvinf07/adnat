class Shift < ApplicationRecord
  belongs_to :user

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

end
