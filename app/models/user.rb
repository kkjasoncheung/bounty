class User < ApplicationRecord

	# add dp

	has_attached_file :dp, styles: { medium: "200x200>", thumb: "100x100>" }
  	validates_attachment_content_type :dp, content_type: /\Aimage\/.*\z/

	# validations 
	validates :first_name, :presence=>true
	validates :last_name, :presence=>true
	validates :yob, :presence=>true
	validates :year_study, :presence=>true
	validates :residence, :presence=>true
	validates :username, :presence=>true,
						:uniqueness=>true,
						:length=>{:minimum=>6}
	validates :password, :presence=>true,
						 :length=>{:minimum=>6}

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates :email, :presence=>true,
						:uniqueness=>true,
						:format=>{:with=>EMAIL_REGEX}
	validates :gender, :presence=>true



	has_secure_password
	# associations
	has_many :messages
	has_many :posts
	has_many :requests
	has_many :comments
	belongs_to :school

	has_many :forums

end
