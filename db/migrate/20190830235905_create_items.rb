class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name,                null:  false, index:true
      t.text       :description,         null:  false
      t.references :category,         null:  false, forign_key: true
      t.references :size,             null:  false, forign_key: true
      t.references :brand,                          forign_key: true
      t.references :item_state,       null:  false, forign_key: true
      t.references :delivery_fee,     null:  false, forign_key: true
      t.references :delivery_method,  null:  false, forign_key: true
      t.references :delivery_day,     null:  false, forign_key: true
      t.integer    :price,               null:  false
      t.references :user,             null:  false, forign_key: true
    end
  end
end
