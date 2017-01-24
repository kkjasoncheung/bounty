class Post < ApplicationRecord
	
	# validations 

	validates :title, :presence=>true
	
	validates :description, :presence=>true

	validates :location, :presence=>true

	validates :radius, :presence=>true

	validates :duration, :presence=>true



	belongs_to :user
	has_many :comments
	has_many :requests
	has_and_belongs_to_many :tags
end
