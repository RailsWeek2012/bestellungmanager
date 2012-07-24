class AddBestellungIdToAuftrags < ActiveRecord::Migration
  def change

    add_column :auftrags, :bestellung_id, :integer
  end
end
