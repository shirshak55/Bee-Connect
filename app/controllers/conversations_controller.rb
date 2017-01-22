class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation, except: [:index]
  before_action :check_participating!, except: [:index]

  def show
    @personal_message = PersonalMessage.new
    @conversations = Conversation.participating(current_user).order('updated_at DESC')

    respond_to do |format|
      format.html { render :layout => false } # your-action.html.erb
    end
  end

  def index
    @conversations = Conversation.participating(current_user).order('updated_at DESC')
  end

  private

  def set_conversation
    @conversation = Conversation.find_by(id: params[:id])
  end

  def check_participating!
    redirect_to root_path unless @conversation && @conversation.participates?(current_user)
  end

end