class AddTrashedForMessages < ActiveRecord::Migration
  def change
    add_column :messages, :trashed, :boolean
  end
end
