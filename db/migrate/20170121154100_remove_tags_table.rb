class RemoveTagsTable < ActiveRecord::Migration[5.0]
  def up
  	drop_table :tags
  	drop_table :posts
  end

  def down
  	create_table :tags do |t|
      t.string :name

      t.timestamps
    end

    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :location
      t.integer :radius
      t.integer :duration
      t.references :user

      t.timestamps
    end
  end
end
