class User < ApplicationRecord
  belongs_to :organization, optional: true
  has_many :shifts
  has_secure_password
end
