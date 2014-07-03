class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id, null: false
      t.integer :receiver_id, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.timestamps
    end
  end
end
