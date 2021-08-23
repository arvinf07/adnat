class AddOrganizationIdToShifts < ActiveRecord::Migration[6.1]
  def change
    add_column :shifts, :organization_id, :integer
    add_column :shifts, :departure_date, :datetime

  end
end
