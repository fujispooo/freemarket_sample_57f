class ChangePrefectureColumn < ActiveRecord::Migration[5.2]
  def change
    remove_reference :items, :prefecture, foreign_key: true
    add_column :items, :prefecture_id, :integer
  end
end
