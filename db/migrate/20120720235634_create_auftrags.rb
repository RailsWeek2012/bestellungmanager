class CreateAuftrags < ActiveRecord::Migration
  def change
    create_table :auftrags do |t|

      t.string :name
      t.string :speise
      t.decimal :preis
      t.text :comment


      t.timestamps
    end
  end
end
