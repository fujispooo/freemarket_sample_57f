class CreateDeliveryFees < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_fees do |t|
      t.string   :delivery_fee, null:  false
      t.timestamps
    end
  end
end
