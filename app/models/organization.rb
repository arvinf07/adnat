class Organization < ApplicationRecord
  has_many :users

  def shifts
    shifts = self.user.map { |user| user.shifts }
  end

end
