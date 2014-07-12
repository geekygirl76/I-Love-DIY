class CreatePgSearchDocuments < ActiveRecord::Migration
  def self.up
      say_with_time("Creating table for pg_search multisearch") do
        create_table :pg_search_documents do |t|
          t.text :content
          t.belongs_to :searchable, :polymorphic => true
          t.timestamps
        end
      end
    end
end