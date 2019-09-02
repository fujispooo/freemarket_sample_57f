class CreateItemComments < ActiveRecord::Migration[5.2]
  def change
    create_table :item_comments do |t|
      t.text       :comment
      t.references :user, forign_key: true
      t.references :item, forign_key: true
      t.timestamps
    end
  end
end
