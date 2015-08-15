class MessagesController < ApplicationController
	def new
		@message = current_user.active_messages.new
	end
	def index
		@active_messages = current_user.active_messages
		@passive_messages = current_user.passive_messages
	end
	def create
		@message = current_user.active_messages.create(message_params)
		flash[:success] = "Message Sent"
		redirect_to :back
	end
	def destroy
		@message = current_user.active_messages.find(params[:id])
		@message.destroy
		flash[:danger] = "Message Deleted"
		redirect_to :back
	end


	private
		def message_params
			params.require(:message).permit(:title,:summary,:body,:receiver_id)
		end

end