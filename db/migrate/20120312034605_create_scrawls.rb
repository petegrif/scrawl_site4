class CreateScrawls < ActiveRecord::Migration
  def change
    create_table :scrawls do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :scrawls, [:user_id, :created_at]
  end
end

