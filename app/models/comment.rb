class Comment < ApplicationRecord
	
	# validations
	validates :body, :presence=>true
	

	belongs_to :user
#	belongs_to :post

	belongs_to :forum
end
