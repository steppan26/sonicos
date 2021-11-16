class CostumesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @costumes = policy_scope(Costume)
  end

  def new
    @costume = Costume.new
    authorize @costume
  end

  def show
    @costume = Costume.find(params[:id])
    authorize @costume
  end

  def create
    @costume = Costume.new(costume_params)
    @user = current_user
    @costume.user_id = current_user.id
    authorize @costume
    @costume.save

    redirect_to costume_path(@costume)
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

    redirect_to costumes_path
  end

  private

  def costume_params
    params.require(:costume).permit(:title, :description, :price, :location, photos: [])
  end
end
