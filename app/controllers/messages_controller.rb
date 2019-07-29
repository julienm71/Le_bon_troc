class MessagesController < ApplicationController
  before_action :conversation_instance

  def index
    user1 = User.find(@conversation.sender_id)
    user2 = User.find(@conversation.recipient_id)
    @message_to = current_user == user1 ? user2 : user1
    @message_to_annonces = Annonce.all.where(id:@message_to)

    @messages = @conversation.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    if @messages.last
      @last_message = @messages.last
      if @last_message.user_id != current_user.id
        @last_message.read = true
      end
    end
  @message = @conversation.messages.new
end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end

  def conversation_instance
    @conversation = Conversation.find(params[:conversation_id])
  end

end
