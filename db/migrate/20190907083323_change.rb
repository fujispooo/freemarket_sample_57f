class Change < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :category, foreign_key: true
    add_reference :items, :size, foreign_key: true
    add_reference :items, :item_state, foreign_key: true
    add_reference :items, :delivery_fee, foreign_key: true
    add_reference :items, :delivery_method, foreign_key: true
    add_reference :items, :delivery_day, foreign_key: true
    add_reference :items, :user, foreign_key: true
  end
end
