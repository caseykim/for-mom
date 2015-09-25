class BdayMessagesController < ApplicationController
  def index
    @bday_messages = BdayMessage.all
    flash.delete(:alert)
  end

  def new
    @bday_message = BdayMessage.new
  end

  def create
    @bday_message = BdayMessage.new(bday_message_params)
    if @bday_message.save
      flash[:notice] = 'Your message has been posted. Thank you!'
      redirect_to bday_messages_path
    else
      flash[:alert] = @bday_message.errors.full_messages
      render :new
    end
  end

  def edit
    @bday_message = BdayMessage.find(params[:id])
  end

  def update
    @bday_message = BdayMessage.find(params[:id])
    password = @bday_message.password
    if password == password_entered
      if @bday_message.update_attributes(bday_message_params)
        flash[:success] = 'Message updated.'
        redirect_to bday_messages_path
      else
        flash[:alert] = @bday_message.errors.full_messages
        render :edit
      end
    else
      flash[:alert] = "Wrong password. 비밀번호가 일치하지않습니다."
      render :edit
    end
  end

  def destroy
    BdayMessage.find(params[:id]).destroy
    flash[:success] = 'Message deleted.'
    redirect_to bday_messages_path
  end

  private
  def bday_message_params
    params.require(:bday_message).permit(:name, :body, :password)
  end

  def password_entered
    params.require(:bday_message).permit(:password)[:password]
  end
end
