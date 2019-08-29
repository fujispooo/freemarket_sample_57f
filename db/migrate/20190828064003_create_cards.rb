class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer    :card_number,  	null: false
      t.integer    :explation_month,null: false
      t.integer	   :explation_year, null: false
      t.integer    :security_code,	null: false
      t.references :user,	      null: false, foreign_key: true
      t.timestamps
    end
  end
end
