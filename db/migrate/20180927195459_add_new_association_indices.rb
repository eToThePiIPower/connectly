class AddNewAssociationIndices < ActiveRecord::Migration[5.2]
  def change
    add_index :contacts, :user_id
    add_index :profiles, :user_id
    add_index :contacts, :created_at
    add_index :profiles, :created_at
    add_index :users, :created_at
  end
end
