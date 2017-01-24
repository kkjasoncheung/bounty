class AddDpColumnsToUsers < ActiveRecord::Migration[5.0]
  def up
    add_attachment :users, :dp
  end

  def down
    remove_attachment :users, :dp
  end
end
