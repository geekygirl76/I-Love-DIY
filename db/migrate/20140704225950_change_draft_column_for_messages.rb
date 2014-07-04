class ChangeDraftColumnForMessages < ActiveRecord::Migration
  def change
    change_column :messages, :draft, :string
  end
end
