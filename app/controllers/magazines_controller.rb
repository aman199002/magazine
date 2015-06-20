class MagazinesController < ApplicationController

  def index
    @magazines = Magazine.includes( articles: [:comments]).all
  end

  def show
    @magazine = Magazine.find(params[:id])
  end
end
