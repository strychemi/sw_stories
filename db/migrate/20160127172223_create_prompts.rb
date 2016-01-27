class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.integer :user_id
      t.string :text

      t.index :user_id

      t.timestamps null: false
    end
  end
end
