class Request < ApplicationRecord
	
	# validations

	validates :product_name, :presence=>true
	validates :store_name, :presence=>true
	validates :description, :presence=>true
	validates :est_price, :presence=>true
	validates :delivery_location, :presence=>true
	

	belongs_to :user

	belongs_to :forum
end
