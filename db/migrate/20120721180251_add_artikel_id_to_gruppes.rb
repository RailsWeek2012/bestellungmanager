class AddArtikelIdToGruppes < ActiveRecord::Migration
  def change

    add_column :gruppes, :artikel_id, :integer

  end
end
