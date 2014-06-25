class AddAgeGenderZipToUser < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :zip, :integer
  end
end
