class CreateCategorySizes < ActiveRecord::Migration[5.2]
  def change
    create_table :category_sizes do |t|
      t.references :category, forign_key: true
      t.references :size, forign_key: true
      t.timestamps
    end
  end
end
