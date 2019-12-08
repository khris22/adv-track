class AddAuthIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :auth_id, :integer
  end
end
