class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:show]

  def index
    @chatrooms = policy_scope(Chatroom).order(created_at: :desc)
  end

  def show
    @message = Message.new
    @chatrooms = Chatroom.all
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
  end

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
