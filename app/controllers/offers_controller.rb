class OffersController < ApplicationController

  def index
    @offers = Offer.select { |offer| offer.user == current_user }
  end

  def show
    raise
  end

  def new
    @offer = Offer.new
  end

  def create
    raise
  end

  def destroy
    raise
  end
end
