class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :version
      t.string :description
      t.string :tags
      t.string :image_url
      t.string :longdescription
      t.boolean :enabled,  :default => true

      t.timestamps
    end
  end
end
