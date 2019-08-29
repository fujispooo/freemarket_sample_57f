class RenameBuldingNameColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :bulding_name, :building_name
  end
end
