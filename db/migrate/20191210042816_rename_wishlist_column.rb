class RenameWishlistColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :adventures, :is_wishlist?, :is_wishlist
  end
end
