class HomesController < ApplicationController
  def index
    @messages = BdayMessage.all
  end
end
