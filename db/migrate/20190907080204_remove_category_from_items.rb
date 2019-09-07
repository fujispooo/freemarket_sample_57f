class RemoveCategoryFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_reference :items, :category, forign_key: true
    remove_reference :items, :size, forign_key: true
    remove_reference :items, :brand, forign_key: true
    remove_reference :items, :item_state, forign_key: true
    remove_reference :items, :delivery_fee, forign_key: true
    remove_reference :items, :delivery_method, forign_key: true
    remove_reference :items, :delivery_day, forign_key: true
    remove_reference :items, :user, forign_key: true
    

  end
end
