class Message < ActiveRecord::Base
	belongs_to :sender, class_name: "User"
	belongs_to :receiver, class_name: "User"
	validates :title, presence: true
	validates :summary, presence: true
	validates :body, presence: true

end