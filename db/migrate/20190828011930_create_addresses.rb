class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.timestamps
      t.integer    :post_number,null: false
      t.string     :city,	      null: false
      t.string     :address,    null: false
      t.string     :bulding_name
      t.integer	   :building_tel
      t.references :user,	  null: false, foreign_key: true
    end
  end
end

