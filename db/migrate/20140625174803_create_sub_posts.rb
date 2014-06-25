class CreateSubPosts < ActiveRecord::Migration
  def change
    create_table :sub_posts do |t|
      t.integer :sub_id
      t.integer :post_id
      t.timestamps
    end
  end
end
