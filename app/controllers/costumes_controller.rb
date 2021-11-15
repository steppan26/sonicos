class CostumesController < ApplicationController

  def index
    @costumes = Costume.all
  end

  def show
    @costume = Costume.find(params[:id])
  end

  def create
    raise
  end

  def update
    raise
  end

  def destroy
    raise
  end
end
