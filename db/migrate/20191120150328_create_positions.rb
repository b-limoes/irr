class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.float :purchase_price
      t.date :maturity_date

      t.timestamps
    end
  end
end
