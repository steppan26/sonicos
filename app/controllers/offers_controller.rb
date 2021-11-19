class OffersController < ApplicationController

  def index
    @offers = policy_scope(Offer).select { |offer| offer.user == current_user }
  end

  def show
    raise
  end

  def new
    @costume = Costume.find(params[:costume_id])
    @offer = Offer.new
    authorize @offer
    authorize @costume
  end

  def create
    @offer = Offer.new(offer_params)
    @costume = Costume.find(params[:costume_id])
    @user = current_user
    @offer.user_id = @user.id
    @offer.costume_id = @costume.id
    @offer.status = "pending"
    authorize @offer
    if @offer.save
      @offer.save
      redirect_to dashboard_path
    else
      render "costumes/show"
    end
  end

  def accept
    @offer = Offer.find(params[:id])
    @offers = Offer.where( costume_id: @offer.costume_id )
    @costume = Costume.find(@offer.costume_id)
    @offers.each do |offer|
      offer.status = "rejected"
      offer.save
    end
    @offer.status = "accepted"
    @offer.save
    authorize @offer

    redirect_to dashboard_path
  end

  def cancel
    @offer = Offer.find(params[:id])
    @offers = Offer.where( costume_id: @offer.costume_id )
    @costume = Costume.find(@offer.costume_id)
    @offers.each do |offer|
      offer.status = "pending"
      offer.save
    end
    authorize @offer

    redirect_to dashboard_path
  end

  def destroy
    @offer = Offer.find(params[:id])
    @costume = Costume.find(@offer.costume_id)
    @offer.destroy
    authorize @offer
    redirect_to dashboard_path
  end

  private

  def offer_params
    params.require(:offer).permit(:date_of_hire, :duration)
  end
end
