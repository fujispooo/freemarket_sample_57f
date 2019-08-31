class CreateDeliveryMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_methods do |t|
      t.string   :delivery_method, null:  false
      t.timestamps
    end
  end
end
