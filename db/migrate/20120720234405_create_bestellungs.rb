class CreateBestellungs < ActiveRecord::Migration
  def change
    create_table :bestellungs do |t|

      t.string :title
      t.text :details
      t.string :termin

      t.timestamps

    end
  end
end
