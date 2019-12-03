class CreateAdventures < ActiveRecord::Migration[6.0]
  def change
    create_table :adventures do |t|
      t.integer :user_id
      t.integer :location_id
      t.string :name
      t.text :recommendation

      t.timestamps
    end
  end
end
