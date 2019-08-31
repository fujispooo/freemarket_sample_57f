class AddUsersToAddressId < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :address, foreign_key: true
    add_reference :users, :card, foreign_key: true
  end
end
