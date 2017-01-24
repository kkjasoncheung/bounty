class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :product_name
      t.string :store_name
      t.text :description
      t.float :est_price
      t.string :delivery_location
      t.integer :to_id
      t.references :user
      t.references :post
      t.references :forum
      t.timestamps
    end
  end
end
