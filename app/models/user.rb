class User < ApplicationRecord
  belongs_to :organization, optional: true
  has_many :shifts
  has_secure_password

  validates :email_address, 
    presence: true, 
    format: { with: /(.+)@(.+)/, message: "is invalid"  },
    uniqueness: { case_sensitive: false },
    length: { minimum: 4, maximum: 254 }
  validates :name, presence: true

end
