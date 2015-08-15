class Post < ActiveRecord::Base
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: {maximum: 50,minimum: 1}
	validates :summary, presence: true, length: {maximum: 150, mimimum: 5}
	validates :body, presence: true, length: {maximum: 1000, minimum: 10}
	validates :user_id, presence: true
	mount_uploader :image, ImageUploader
end