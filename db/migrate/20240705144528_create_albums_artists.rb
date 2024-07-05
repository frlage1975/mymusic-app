class CreateAlbumsArtists < ActiveRecord::Migration[7.1]
  def change
    create_table :albums_artists do |t|
      t.references :album, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
