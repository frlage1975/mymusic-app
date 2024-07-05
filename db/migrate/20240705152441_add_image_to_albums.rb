class AddImageToAlbums < ActiveRecord::Migration[7.1]
  def change
    add_column :albums, :image, :string
  end
end
