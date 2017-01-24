class CreateForums < ActiveRecord::Migration[5.0]
  def change
    create_table :forums do |t|
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
