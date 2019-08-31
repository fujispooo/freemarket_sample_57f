class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name,                null:  false, index:true
      t.text       :description,         null:  false
      t.references :category_id,         null:  false, forign_key: true
      t.references :size_id,             null:  false, forign_key: true
      t.references :brand_id,                          forign_key: true
      t.references :item_state_id,       null:  false, forign_key: true
      t.references :delivery_fee_id,     null:  false, forign_key: true
      t.references :delivery_method_id,  null:  false, forign_key: true
      t.references :delivery_day_id,     null:  false, forign_key: true
      t.integer    :price,               null:  false
      t.references :user_id,             null:  false, forign_key: true
    end
  end
end
