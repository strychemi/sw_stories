class CreateDrafts < ActiveRecord::Migration
  def change
    create_table :drafts do |t|
      t.text :story
      t.integer :prompt_id

      t.index :prompt_id

      t.timestamps null: false
    end
  end
end
