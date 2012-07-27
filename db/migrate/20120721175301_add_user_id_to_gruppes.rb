class AddUserIdToGruppes < ActiveRecord::Migration
  def change

    add_column :gruppes, :user_id, :integer

  end
end
