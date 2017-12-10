class CreateOrdersDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :orders_dishes do |t|
      t.references :dish, null: false
      t.references :order, null: false

      t.timestamps
    end
  end
end
