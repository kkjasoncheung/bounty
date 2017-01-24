class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :to_id
      t.references :user

      t.timestamps
    end
  end
end
