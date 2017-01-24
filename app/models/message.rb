class Message < ApplicationRecord
	
	# validations

	validates :body, :presence=>true
	validates :to_id, :presence=>true
	
	belongs_to :user
end
