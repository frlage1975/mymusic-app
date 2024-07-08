class ArtistsController < ApplicationController
  # def index
  #   if params[:query].present?
  #     @artists = Artist.joins(:country).where('LOWER(artists.name) LIKE ?', "%#{params[:query].downcase}%").order(name: :asc)
  #   else
  #     @artists = Artist.includes(:albums, :country).order(Arel.sql('RANDOM()')).page(params[:page]).per(10)
  #   end
  # end

  def index
    if params[:query].present?
      case params[:search_type]
      when 'artist'
        @artists = Artist.where('LOWER(artists.name) LIKE ?', "%#{params[:query].downcase}%").order(name: :asc)
      when 'country'
        @artists = Artist.joins(:country).where('LOWER(countries.name) LIKE ?', "%#{params[:query].downcase}%").order(name: :asc)
      when 'album'
        @artists = Artist.joins(:albums).where('LOWER(albums.title) LIKE ?', "%#{params[:query].downcase}%").distinct.order(name: :asc)
      else
        @artists = Artist.joins(:country, :albums).where('LOWER(artists.name) LIKE :query OR LOWER(countries.name) LIKE :query OR LOWER(albums.title) LIKE :query', query: "%#{params[:query].downcase}%").distinct.order(name: :asc)
      end
    else
      @artists = Artist.includes(:albums, :country).order(Arel.sql('RANDOM()')).page(params[:page]).per(10)
    end
  end

  def show
    @artist = Artist.includes(:albums, :country).find(params[:id])
  end
end
