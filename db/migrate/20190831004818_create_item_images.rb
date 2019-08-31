class CreateItemImages < ActiveRecord::Migration[5.2]
  def change
    create_table :item_images do |t|
      t.string     :image,     null:  false, index: true
      t.references :item_id,  null:  false, forign_key: true
      t.timestamps
    end
  end
end
