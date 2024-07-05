class CreateArtists < ActiveRecord::Migration[7.1]
  def change
    create_table :artists do |t|
      t.string :name, null: false
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
