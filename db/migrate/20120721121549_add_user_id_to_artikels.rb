class AddUserIdToArtikels < ActiveRecord::Migration
  def change
    add_column :artikels, :user_id, :integer
  end
end
