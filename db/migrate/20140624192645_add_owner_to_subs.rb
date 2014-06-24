class AddOwnerToSubs < ActiveRecord::Migration
  def change
    add_column :subs, :user_id, :integer
  end
end
