class CreateBlockrecords < ActiveRecord::Migration
  def change
    create_table :blockrecords do |t|
      t.integer :sender_id, null: false
      t.integer :receiver_id, null: false
      t.timestamps
    end
  end
end
