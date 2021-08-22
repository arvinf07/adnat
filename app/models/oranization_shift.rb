class OrganizationShift < ApplicationRecord
  belongs_to :organization
  belongs_to :shift
end