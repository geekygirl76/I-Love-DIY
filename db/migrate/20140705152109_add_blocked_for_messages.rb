class AddBlockedForMessages < ActiveRecord::Migration
  def change
    add_column :messages, :blocked, :boolean
  end
end
