class CreateLunchCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :lunch_companies do |t|
      t.string :name
      t.string :token

      t.timestamps
    end
  end
end
