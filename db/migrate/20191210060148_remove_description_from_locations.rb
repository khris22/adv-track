class RemoveDescriptionFromLocations < ActiveRecord::Migration[6.0]
  def change
    remove_column :locations, :description
  end
end
