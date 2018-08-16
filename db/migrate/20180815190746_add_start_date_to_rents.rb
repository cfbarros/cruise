class AddStartDateToRents < ActiveRecord::Migration[5.2]
  def change
    add_column :rents, :start_date, :datetime
    add_column :rents, :end_date, :datetime
  end
end
