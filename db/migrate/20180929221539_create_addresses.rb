class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'pgcrypto'
    create_table :addresses, id: :uuid do |t|
      t.integer :address_type, null: false
      t.boolean :primary, null: false, default: false
      t.jsonb :body, null: false, default: '{}'
      t.references :addressable, polymorphic: true, type: :uuid

      t.timestamps
    end
  end
end
