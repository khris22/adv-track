class AddColumnToAdventureTable < ActiveRecord::Migration[6.0]
  def change
    add_column :adventures, :is_wishlist?, :boolean, default: false
  end
end
