class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :sub_id,  null: false
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.timestamps
    end
    
    
  end
end
