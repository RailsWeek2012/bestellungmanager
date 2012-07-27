class CreateGruppes < ActiveRecord::Migration
  def change
    create_table :gruppes do |t|

      t.string :title
      t.text :details
      t.string :termin

      t.timestamps

    end
  end
end
