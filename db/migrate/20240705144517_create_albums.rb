class CreateAlbums < ActiveRecord::Migration[7.1]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
