class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @conversations = Conversation.all
  end

  def create
    if Conversation.between(params[:sender_id],params[:recipient_id])
    .present?
      @conversation = Conversation.between(params[:sender_id],
      params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    if params[:action_annonce].present?
      redirect_to conversation_messages_path(@conversation) + '?action_annonce=show_modal_echange'
    else
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
