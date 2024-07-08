class AlbumsController < ApplicationController
  def index
    if params[:query].present?
      @albums = Album.joins(:artists).where('LOWER(albums.title) LIKE ?', "%#{params[:query].downcase}%").order(title: :asc)
    else
      @albums = Album.includes(:artists, :category).order(Arel.sql('RANDOM()')).page(params[:page]).per(10)
    end
  end

  def show
    @album = Album.includes(:artists, :songs, :category).find(params[:id])
  end
end
