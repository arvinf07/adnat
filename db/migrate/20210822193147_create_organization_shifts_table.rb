class CreateOrganizationShiftsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :organization_shifts_tables do |t|
      t.integer :organization_id
      t.integer :shift_id
      t.datetime :departure_date

      t.timestamps
    end
  end
end
