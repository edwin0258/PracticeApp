class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post

	validates :title, presence: true, length: {minimum: 2, maximum: 100}
	validates :body, presence: true, length: {minimum: 2, maximum: 1000}
	validates :user_id, presence: true

end