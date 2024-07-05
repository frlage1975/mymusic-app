class AlbumsController < ApplicationController
  # def index
  #   @albums = Album.includes(:artists).page(params[:page]).per(10)
  # end

  def index
    @albums = Album.includes(:artists, :category).order(Arel.sql('RANDOM()')).page(params[:page]).per(10)
  end

  def show
    @album = Album.includes(:artists, :songs, :category).find(params[:id])
  end
end
