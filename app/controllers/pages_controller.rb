class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :dashboard]

  def home
  end

  def dashboard
    @my_costumes = Costume.where(user: current_user)
    @costumes = Costume.all
    @costume = Costume.new
  end
end
