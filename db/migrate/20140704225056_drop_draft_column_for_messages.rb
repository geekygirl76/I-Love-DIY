class DropDraftColumnForMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :draft
  end
end
