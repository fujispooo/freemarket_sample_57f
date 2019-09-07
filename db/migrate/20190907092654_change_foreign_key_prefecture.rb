class ChangeForeignKeyPrefecture < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :prefecture_id
    add_reference :items, :prefecture, foreign_key: true
  end
end
