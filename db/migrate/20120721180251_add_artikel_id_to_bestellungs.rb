class AddArtikelIdToBestellungs < ActiveRecord::Migration
  def change

    add_column :bestellungs, :artikel_id, :integer

  end
end
