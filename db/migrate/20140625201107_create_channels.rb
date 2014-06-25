class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.integer :sub_id
      t.string :title
      t.timestamps
    end
  end
end
