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
    raise
  end

  def update
    raise
  end

  def destroy
    raise
  end
end
