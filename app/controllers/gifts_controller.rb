class GiftsController < ApplicationController
  def index
    @gifts = Gift.all
    @messages = BdayMessage.all
  end

  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.new(gift_params)
    if @gift.save
      flash[:success] = 'Successfully added a gift on wishlist'
      redirect_to gifts_path
    else
      flash[:alert] = @gift.errors.full_messages.join(", ")
      render :new
    end
  end

  def most_wanted
    Gift.all.each do |gift|
      gift.most_wanted = false
      gift.save
    end
    gift = Gift.find(params[:id])
    gift.most_wanted = true
    if gift.save
      flash[:success] = 'Successfully changed most-wanted gift'
    end
    redirect_to gifts_path
  end

  protected

  def most_wanted?
    most_wanted
  end

  private

  def gift_params
    params.require(:gift).permit(:name, :price, :description)
  end
end
