class MessagesController < ApplicationController
	def new
	end
	def index
		@active_messages = current_user.active_messages
		@passive_messages = current_user.passive_messages
	end
	def create
		user = User.find(params[:receiver_id])
		current_user.message(user)
		flash[:success] = "Message Sent"
		redirect_to :back
	end

end