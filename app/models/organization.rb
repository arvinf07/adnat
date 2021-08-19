class Organization < ApplicationRecord
  has_many :users

  validates :email_address 
    presence: true,
    format: {without: regex}


  def shifts
    shifts = self.users.map { |user| user.shifts }
  end

end
