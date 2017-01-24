class Forum < ApplicationRecord

	# validations 

	validates :title, :presence=>true
	
	validates :description, :presence=>true

	validates :location, :presence=>true

	validates :radius, :presence=>true

	validates :duration, :presence=>true

	
	belongs_to :user
	has_many :comments
	has_many :requests

	# do tags at the end
	has_and_belongs_to_many :tags

	def self.search(search)
  		if search
  			where(["location LIKE ?","%#{search}%"])
  		else
  			all
  		end
  	end

end
