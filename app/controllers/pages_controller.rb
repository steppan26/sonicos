class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :dashboard]

  def home
  end

  def dashboard
    @my_costumes = Costume.where(user: current_user)
    @costumes = Costume.all
    @costume = Costume.new
    @my_offers = Offer.where(user_id: current_user.id)
    @my_costumes_offers = []
    @my_offers.each do |offer|
      @my_costumes_offers << Costume.find(offer.costume_id)
    end
  end
end
