class AddImageToArtikels < ActiveRecord::Migration
  def change
    add_column :artikels, :image, :string
  end
end
