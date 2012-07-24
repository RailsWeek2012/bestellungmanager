class AddUserIdToAuftrags < ActiveRecord::Migration
  def change

    add_column :auftrags, :user_id, :integer
  end
end
