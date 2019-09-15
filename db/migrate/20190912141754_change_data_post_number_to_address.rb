class ChangeDataPostNumberToAddress < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :post_number, :string
    change_column :addresses, :building_tel, :string
  end
end
