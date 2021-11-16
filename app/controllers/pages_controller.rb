class PagesController < ApplicationController
  def home
  end

  def dashboard
    @costume = New.costume
  end
end
