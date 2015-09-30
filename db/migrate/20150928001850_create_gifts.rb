class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :name, null: false
      t.string :description
      t.decimal :price, precision: 5, scale: 2, null: false
      t.timestamps null: false
    end
  end
end
