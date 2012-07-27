class AddUserIdToBestellungs < ActiveRecord::Migration
  def change

    add_column :bestellungs, :user_id, :integer
  end
end
