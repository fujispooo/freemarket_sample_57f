class CreateCategorySizes < ActiveRecord::Migration[5.2]
  def change
    create_table :category_sizes do |t|
      t.references :category_id, forign_key: true
      t.references :size_id, forign_key: true
      t.timestamps
    end
  end
end
