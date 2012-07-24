class CreateArtikels < ActiveRecord::Migration
  def change
    create_table :artikels do |t|
      t.string :title
      t.text :comment

      t.timestamps
    end
  end
end
