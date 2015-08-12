class User < ActiveRecord::Base
	validates :name, presence: true
	has_many :posts, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy
	before_save {self.email = email.downcase}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 105},
									uniqueness: {case_sensative: false},
									format: {with: VALID_EMAIL_REGEX}
	validates :username, presence: true
	validates :password, presence: true






	has_secure_password
end