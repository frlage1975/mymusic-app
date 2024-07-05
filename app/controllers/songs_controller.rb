class SongsController < ApplicationController
  def index
    @songs = Song.includes(:albums).order(title: :asc)
  end
end
