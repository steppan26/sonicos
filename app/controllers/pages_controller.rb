class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :dashboard]

  def home
  end

  def dashboard
    @costumes = Costume.all
    @costume = Costume.new
  end
end
