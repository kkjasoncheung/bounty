class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user
      t.references :post
      t.references :forum
      t.timestamps
    end
  end
end
