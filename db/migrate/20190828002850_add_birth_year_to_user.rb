class AddBirthYearToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birth_year, :integer
    add_column :users, :birth_month, :integer
    add_column :users, :birth_day, :integer
  end
end