class Post < ActiveRecord::Base
	validates :title, presence: true, length: {maximum: 50,minimum: 1}
	validates :summary, presence: true, length: {maximum: 150, mimimum: 5}
	validates :body, presence: true, length: {maximum: 1000, minimum: 10}
	validates :user_id, presence: true
end