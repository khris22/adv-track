class AddColumnToAdventureTable < ActiveRecord::Migration[6.0]
  def change
    add_column :adventure, :is_wishlist?, :boolean, default: false
  end
end
