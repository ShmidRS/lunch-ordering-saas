class CreateDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :dishes do |t|
      t.string :name, null: false
      t.decimal :price, null: false
      t.string :course, null: false
      t.string :image
      t.date :available_at, null: false

      t.timestamps
    end
  end
end
