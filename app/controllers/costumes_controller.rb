class CostumesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @costumes = policy_scope(Costume)
    @markers = @costumes.geocoded.map do |costume|
      {
        lat: costume.latitude,
        lng: costume.longitude,
        info_window: render_to_string(partial: "info_window", locals: { costume: costume })

      }
    end
  end

  def new
    @costume = Costume.new
    authorize @costume
  end

  def show
    @costume = Costume.find(params[:id])
    @user = current_user
    @offer = Offer.new
    authorize @costume
  end

  def create
    @costume = Costume.new(costume_params)
    @user = current_user
    @costume.user_id = current_user.id
    authorize @costume
    if @costume.save
      redirect_to costume_path(@costume)
    else
      redirect_to controller: 'pages', action: 'dashboard', page: 'new'
    end
  end

  def edit
    @costume = Costume.find(params[:id])
    authorize @costume
  end

  def update
    @costume = Costume.find(params[:id])
    @costume.update(costume_params)
    authorize @costume

    redirect_to costume_path(@costume)
  end

  def destroy
    @costume = Costume.find(params[:id])
    @costume.destroy
    authorize @costume

    redirect_to "/dashboard"
  end

  private

  def costume_params
    params.require(:costume).permit(:title, :description, :price, :location, photos: [])
  end
end
