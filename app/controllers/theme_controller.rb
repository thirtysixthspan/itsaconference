class ThemeController < ApplicationController

  def index
    @themes = Theme.all
  end

  def show
    @theme = Theme.find_by_link(params[:theme_link])
    redirect_to ('/') and return if !@theme

  end


end
