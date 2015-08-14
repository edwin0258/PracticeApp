class User < ActiveRecord::Base
	validates :name, presence: true
	has_many :posts, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy
	before_save {self.email = email.downcase}
	before_save {self.username = username.downcase}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 105},
									uniqueness: {case_sensative: false},
									format: {with: VALID_EMAIL_REGEX}
	validates :username, presence: true, uniqueness: {case_sensative: false}
	validates :password, presence: true

	has_many :active_relationships, class_name: "Relationship",
									foreign_key: "follower_id",
									dependent: :destroy
	has_many :passive_relationships, class_name: "Relationship",
									foreign_key: "followed_id",
									dependent: :destroy
	has_many :following, through: :active_relationships, source: :followed
	has_many :followers, through: :passive_relationships, source: :follower

	has_many :active_messages, class_name: "Message",
								foreign_key: "sender_id",
								dependent: :destroy
	has_many :passive_messages, class_name: "Message",
								foreign_key: "receiver_id",
								dependent: :destroy
	has_many :sent_messages, through: :active_messages, source: :receiver
	has_many :messages, through: :passive_messages, source: :sender
	def follow(other_user)
		active_relationships.create(followed_id: other_user.id)
	end
	def unfollow(other_user)
		active_relationships.find_by(followed_id: other_user.id).destroy
	end
	def following?(other_user)
		following.include?(other_user)
	end

	def message(other_user)
		active_messages.create(receiver_id: other_user.id)
	end
	

	has_secure_password
end