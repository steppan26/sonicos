class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :dashboard]

  def home
  end

  def dashboard
    @myCostumes = Costume.where(user: current_user)
    @costume = Costume.new
  end
end
