class CategoriesController < ApplicationController
  def index
    @categories = Category.left_joins(:albums).select('categories.*, COUNT(albums.id) AS albums_count').group('categories.id').order(name: :asc)
  end
end
