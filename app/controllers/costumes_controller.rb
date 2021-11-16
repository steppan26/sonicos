class CostumesController < ApplicationController

  def index
    @costumes = policy_scope(Costume)
  end

  def new
    @costume = Costume.new
  end

  def show
    @costume = Costume.find(params[:id])
  end

  def create
    @costume = Costume.new(costume_params)
    @user = current_user
    @costume.user_id = current_user.id
    @costume.save

    redirect_to costume_path(@costume)
  end

  def update
    raise
  end

  def destroy
    raise
  end

  private

  def costume_params
    params.require(:costume).permit(:title, :description, :image_url, :price, :location)
  end
end
