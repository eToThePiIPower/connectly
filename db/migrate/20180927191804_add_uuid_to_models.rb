class AddUuidToModels < ActiveRecord::Migration[5.2]
  def up
    tables = %w[contacts profiles users]
    tables.each do |table|
      add_column table, :uuid, :uuid, default: 'uuid_generate_v4()', null: false
    end
  end

  def down
    tables = %w[contacts profiles users]
    tables.each do |table|
      remove_column table, :uuid
    end
  end
end
