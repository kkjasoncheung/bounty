class AddToIdToForums < ActiveRecord::Migration[5.0]
  def up
  	add_column "forums", "to_id", :integer
  end

  def down
  	remove_column "forums", "to_id"
  end
end
