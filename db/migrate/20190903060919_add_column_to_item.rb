class AddColumnToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :prefecture_id, :integer,  foreign_key: true
  end
end
