class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false
      t.date :ordered_at

      t.timestamps
    end
  end
end
