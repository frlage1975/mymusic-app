class CountriesController < ApplicationController
  def index
    @countries = Country.left_joins(:artists).select('countries.*, COUNT(artists.id) AS artists_count').group('countries.id').order(name: :asc)
  end
end
