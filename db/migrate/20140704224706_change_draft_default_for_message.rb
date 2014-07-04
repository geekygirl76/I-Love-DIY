class ChangeDraftDefaultForMessage < ActiveRecord::Migration
  def change
    change_column :messages, :draft, :boolean
  end
end
