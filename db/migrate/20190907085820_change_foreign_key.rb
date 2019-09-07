class ChangeForeignKey < ActiveRecord::Migration[5.2]
  def change
    remove_column :item_comments, :user_id
    remove_column :item_comments, :item_id
    add_reference :item_comments, :user, foreign_key: true
    add_reference :item_comments, :item, foreign_key: true

    remove_column :item_images, :item_id
    add_reference :item_images, :item, foreign_key: true

    remove_column :category_sizes, :category_id
    remove_column :category_sizes, :size_id
    add_reference :category_sizes, :category, foreign_key: true
    add_reference :category_sizes, :size, foreign_key: true

  end
end
