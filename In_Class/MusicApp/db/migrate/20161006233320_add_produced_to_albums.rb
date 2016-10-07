class AddProducedToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :produced, :string, default: "studio"
  end
end
