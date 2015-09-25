class BdayMessagesController < ApplicationController
  def index
    @bday_messages = BdayMessage.all
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
    message = BdayMessage.find(params[:id])
    password = message.password
    if password == password_entered
      message.destroy
      flash[:success] = 'Message deleted.'
    else
      flash[:alert] = "Wrong password. 비밀번호가 일치하지않습니다."
    end
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
