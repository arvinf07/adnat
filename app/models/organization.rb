class Organization < ApplicationRecord
  has_many :users

  def shifts
    shifts = self.users.map { |user| user.shifts }
  end

end
