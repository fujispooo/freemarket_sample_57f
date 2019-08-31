class CreateItemStates < ActiveRecord::Migration[5.2]
  def change
    create_table :item_states do |t|
      t.string :item_state,  null:  false
      t.timestamps
    end
  end
end
