class AddReadAttributeToMessagesAndRequests < ActiveRecord::Migration[5.0]
  def up
  	add_column "messages", "read", :boolean
  	add_column "requests", "read", :boolean
  end

  def down
  	remove_column "messages", "read"
  	remove_column "requests", "read"
  end
end
