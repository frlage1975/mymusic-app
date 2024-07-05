class ArtistsController < ApplicationController
  # def index
  #   @artists = Artist.includes(:albums, :country).order(:name).page(params[:page]).per(10)
  # end

  def index
    @artists = Artist.includes(:albums, :country).order(Arel.sql('RANDOM()')).page(params[:page]).per(10)
  end

  def show
    @artist = Artist.includes(:albums, :country).find(params[:id])
  end
end
