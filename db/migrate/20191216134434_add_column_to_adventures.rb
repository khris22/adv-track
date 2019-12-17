class AddColumnToAdventures < ActiveRecord::Migration[6.0]
  def change
    add_column :adventures, :category_id, :integer
  end
end
