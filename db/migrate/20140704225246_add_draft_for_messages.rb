class AddDraftForMessages < ActiveRecord::Migration
  def change
    add_column :messages, :draft, :boolean
  end
end
