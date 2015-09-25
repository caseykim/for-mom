class CreateBdayMessages < ActiveRecord::Migration
  def change
    create_table :bday_messages do |t|
      t.string :body, null: false
      t.string :name
      t.string :password, null: false
      t.timestamps null: false
    end
  end
end
