class CreateBestellungs < ActiveRecord::Migration
  def change
    create_table :bestellungs do |t|

      t.string :name
      t.string :speise
      t.decimal :preis
      t.text :comment


      t.timestamps
    end
  end
end
