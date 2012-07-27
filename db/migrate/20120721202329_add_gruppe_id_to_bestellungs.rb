class AddGruppeIdToBestellungs < ActiveRecord::Migration
  def change

    add_column :bestellungs, :gruppe_id, :integer
  end
end
