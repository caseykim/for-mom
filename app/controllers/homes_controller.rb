class HomesController < ApplicationController
  def index
    @gifts = Gift.all
    @messages = BdayMessage.all
  end
end
