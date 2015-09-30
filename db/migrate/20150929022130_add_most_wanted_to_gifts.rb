class AddMostWantedToGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :most_wanted, :boolean, default: false
  end
end
