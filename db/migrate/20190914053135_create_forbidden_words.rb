class CreateForbiddenWords < ActiveRecord::Migration[5.2]
  def change
    create_table :forbidden_words do |t|
      t.string :forbidden_word
      t.timestamps
    end
  end
end
